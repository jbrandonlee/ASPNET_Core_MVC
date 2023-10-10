using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApp_ShoppingCart.Models;

// Handles Cart & Checkout
namespace WebApp_ShoppingCart.Controllers
{
	public class CartController : Controller
	{
		public IActionResult Index()
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
