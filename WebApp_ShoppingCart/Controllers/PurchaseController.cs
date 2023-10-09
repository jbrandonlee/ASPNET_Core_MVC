using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApp_ShoppingCart.Models;

// Handles Cart & Checkout
namespace WebApp_ShoppingCart.Controllers
{
	public class PurchaseController : Controller
	{
		public IActionResult Cart()
		{
			return View();
		}

		public IActionResult Checkout()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
