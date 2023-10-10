using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Data;
using WebApp_ShoppingCart.Models;

// Handles Login, Logout, and Saved Account Data (Purchase History)
namespace WebApp_ShoppingCart.Controllers
{
	public class AccountController : Controller
	{
		public IActionResult Login(string username, string password)
		{
			// Console.WriteLine($"{username}, {password}");
			if (username != null && password != null) {
				return RedirectToAction("Index", "Gallery");
			}
			return View();
		}

		public IActionResult Logout()
		{
			return RedirectToAction("Login", "Account");
		}

		public IActionResult History()
		{
			List<Product> products = DBProduct.GetMockProducts(5);
			ViewBag.products = products;

			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
