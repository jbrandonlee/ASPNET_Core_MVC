using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApp_ShoppingCart.Models;

namespace WebApp_ShoppingCart.Controllers
{
	public class AccountController : Controller
	{
		public IActionResult Login()
		{
			return View();
		}

		public IActionResult Logout()
		{
			return View();
		}

		public IActionResult Purchases()
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
