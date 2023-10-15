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

		[HttpGet]
		public IActionResult Login()
		{
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			if (String.IsNullOrEmpty(isRegistered))                                     // If not logged in
			{																			// Display common view
				return View();
			}
			else                                                                        // Else already logged in
			{                                                                           // Redirect to Gallery
				return RedirectToAction("Gallery", "Shop");
			}			
		}

		[HttpPost]
		public IActionResult Login(string username, string passhash)
		{
			Dictionary<string, string> users = DBUser.GetUserDict();

			if (String.IsNullOrEmpty(username) && String.IsNullOrEmpty(passhash))		// Invalid values
			{
				return View();
			}
			else if (users.ContainsKey(username.ToLower()))								// Login was attempted
			{
				if (users[username.ToLower()] == passhash)								// Login success
				{
					HttpContext.Session.SetString("isRegistered", "true");				// Update session details
					HttpContext.Session.SetString("userId", username);
					return RedirectToAction("Gallery", "Shop");
				}
			}

			// Login attempt fails
			ViewBag.loginError = "The username or password entered is incorrect. Please try again.";
			return View();
		}

		public IActionResult Logout()
		{
			HttpContext.Session.Clear();
			return RedirectToAction("Login", "Account");
		}

		public IActionResult History()
		{
			string? isRegistered = HttpContext.Session.GetString("isRegistered");
			string? userId = HttpContext.Session.GetString("userId");
			Console.WriteLine($"userId:\n{userId}\nisRegistered:\n{isRegistered}");

			if (String.IsNullOrEmpty(isRegistered))                                     // If not logged in
			{                                                                           // Redirect to Login page
				return RedirectToAction("Login", "Account");
			}
			else                                                                        // Else already logged in
			{                                                                           // Display user-specific view
				List<Purchase> purchases = DBPurchase.GetPurchaseHistory(userId);
				ViewBag.purchases = purchases;
                ViewBag.cartCount = DBCart.GetUniqueCount(userId);
				ViewBag.username = HttpContext.Session.GetString("userId");
				return View();
			}
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
