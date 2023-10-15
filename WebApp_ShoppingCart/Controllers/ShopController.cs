using System.Diagnostics;
using Microsoft.AspNetCore.Http;
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
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			if (String.IsNullOrEmpty(isRegistered))                                             // If not logged in
			{                                                                                   // Save sessionId as userId
				ISession sessionObj = HttpContext.Session;
				sessionObj.SetString("userId", sessionObj.Id);
				Console.WriteLine("Set userId in Gallery:\n" + sessionObj.Id);
				ViewBag.username = "User";
			}
			else                                                                                // Else already logged in
			{                                                                                   // Update nav
                ViewBag.username = HttpContext.Session.GetString("userId");
			}

			List<Product> products;
            products = String.IsNullOrEmpty(search) ? DBProduct.GetProducts() : DBProduct.GetFilteredProducts(search);
			ViewBag.products = products;
			ViewBag.cartCount = DBCart.GetUniqueCount(userId);
			return View();
        }

		[HttpPost]
		public IActionResult AddToCart(string productId)
		{
			ISession sessionObj = HttpContext.Session;
			string isRegistered = sessionObj.GetString("isRegistered");
			string userId = sessionObj.GetString("userId");
			Console.WriteLine($"Added to Cart BY\nuserId:\n{userId}\nisRegistered:\n{isRegistered}");

			if (DBProduct.IsValidId(productId))
			{
				Product product = DBProduct.GetProductById(productId);
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
