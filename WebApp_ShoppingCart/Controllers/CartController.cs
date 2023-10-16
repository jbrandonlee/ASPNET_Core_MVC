﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Data;
using WebApp_ShoppingCart.Models;

// Handles Cart & Checkout
namespace WebApp_ShoppingCart.Controllers
{
	public class CartController : Controller
	{
		public IActionResult Index()
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

			ViewBag.cart = DBCart.GetCartItems(userId);
            ViewBag.cartCount = DBCart.GetUniqueCount(userId);
            return View();
		}
		
		[HttpPost]
		public IActionResult UpdateCartItem(string productId, int quantity)
		{
			ISession sessionObj = HttpContext.Session;
			string? isAuthenticated = sessionObj.GetString("isAuthenticated");
			string? userId = sessionObj.GetString("userId");

			DBCart.UpdateQuantity(productId, quantity, userId);
			return RedirectToAction("Index", "Cart");
		}

		[HttpPost]
		public IActionResult RemoveCartItem(string productId)
		{
			ISession sessionObj = HttpContext.Session;
			string? isAuthenticated = sessionObj.GetString("isAuthenticated");
			string? userId = sessionObj.GetString("userId");

			DBCart.RemoveItem(productId, userId);
            ViewBag.cartCount = DBCart.GetUniqueCount(userId);
            return Json(new { cartCount = ViewBag.cartCount });
        }

		public IActionResult Checkout()
		{
			ISession sessionObj = HttpContext.Session;
			string? userId = sessionObj.GetString("userId");

			// If User is isAuthenticated
			DBPurchase.CheckoutCart(DBCart.GetCartItems(userId), userId);
			return RedirectToAction("History", "Account");

			// Else
			// sessionObj.SetString("isCheckout", "true");
			// Redirect to Login
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
