﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Data;
using WebApp_ShoppingCart.Models;

// Handles Shop Gallery & Add-To-Cart
namespace WebApp_ShoppingCart.Controllers
{
    public class ShopController : Controller
    {
        public IActionResult Gallery(string search)
        {
			ISession sessionObj = HttpContext.Session;
			string? isAuthenticated = sessionObj.GetString("isAuthenticated");
			string? userId = sessionObj.GetString("userId");

			if (String.IsNullOrEmpty(isAuthenticated))                                          // If not logged in
			{                                                                                   // Save sessionId as userId
				sessionObj.SetString("userId", sessionObj.Id);
				ViewBag.debugInfo = $"isAuthenticated = false, userId = {sessionObj.Id}";
			}
			else                                                                                // Else already logged in
			{                                                                                   // Update nav
				ViewBag.username = userId;
				ViewBag.debugInfo = $"isAuthenticated = true, userId = {userId}";
			}

			List<Product> products;
            products = String.IsNullOrEmpty(search) ? DBProduct.GetProducts() : DBProduct.GetFilteredProducts(search);
			ViewBag.products = products;
			ViewBag.cartCount = DBCart.GetUniqueCount(sessionObj.GetString("userId"));
			return View();
        }

		[HttpPost]
		public IActionResult AddToCart(string productId)
		{
			string? userId = HttpContext.Session.GetString("userId");

			if (DBProduct.IsValidId(productId))
			{
				Product? product = DBProduct.GetProductById(productId);
				CartItem cartItem = CartItem.ConvertToCartItem(product, userId);
				DBCart.AddToCart(cartItem);
			}

            ViewBag.cartCount = DBCart.GetUniqueCount(userId);
            return Json(new { cartCount = ViewBag.cartCount });
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
