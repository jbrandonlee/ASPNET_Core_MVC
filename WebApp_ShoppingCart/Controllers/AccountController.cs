using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Data;
using WebApp_ShoppingCart.Models;

// Handles Login, Logout, and Saved Account Data (Purchase History)
namespace WebApp_ShoppingCart.Controllers
{
	public class AccountController : Controller
	{
		/*	For testing purposes, use the following username/password/passhash:
		 *	admin, Password123, b2e98ad6f6eb8508dd6a14cfa704bad7f05f6fb1
		 *	john, password1, e38ad214943daad1d64c102faec29de4afe9da3d
		 */

		public IActionResult Login(string username, string passhash)
		{
			Dictionary<string, string> users = DBUser.GetUserDict();

			if (username == null && passhash == null)				// No prior login was attempted
			{
				return View();
			}
			else if (users.ContainsKey(username.ToLower()))			// Login was attempted
			{
				if (users[username.ToLower()] == passhash)			// Login success
				{
					return RedirectToAction("Gallery", "Shop");
				}
			}

			// Login attempt fails
			ViewBag.loginError = "The username or password entered is incorrect. Please try again.";
			return View();
		}

		public IActionResult Logout()
		{
			return RedirectToAction("Login", "Account");
		}

		public IActionResult History()
		{
            List<Purchase> purchases = DBPurchase.GetPurchaseHistory("john");
            ViewBag.purchases = purchases;

            return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
