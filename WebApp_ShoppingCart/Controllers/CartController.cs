using System.Diagnostics;
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
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			if (String.IsNullOrEmpty(isRegistered))                                     // If not logged in
			{                                                                           // Save sessionId as userId
				ISession sessionObj = HttpContext.Session;
				sessionObj.SetString("userId", sessionObj.Id);
				Console.WriteLine("Set userId in Cart:\n" + sessionObj.Id);
                ViewBag.username = "User";
			}
			else                                                                        // Else already logged in
			{                                                                           // Update nav
                ViewBag.username = HttpContext.Session.GetString("userId");
			}

			ViewBag.Cart = DBCart.GetCartItems(userId);
            ViewBag.cartCount = DBCart.GetUniqueCount(userId);
            return View();
		}
		
		[HttpPost]
		public IActionResult UpdateCartItem(string productId, int quantity)
		{
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			DBCart.UpdateQuantity(productId, quantity, userId);
			return RedirectToAction("Index", "Cart");
		}

		[HttpPost]
		public IActionResult RemoveCartItem(string productId)
		{
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			DBCart.RemoveItem(productId, userId);
            ViewBag.cartCount = DBCart.GetUniqueCount(userId);
            return Json(new { cartCount = ViewBag.cartCount });
        }

		public IActionResult Checkout()
		{
			return RedirectToAction("History", "Account");
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
