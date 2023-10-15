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
			ViewBag.Cart = DBCart.GetCartItems("john");
			return View();
		}
		
		[HttpPost]
		public IActionResult ChangeItem(string Id,int quantity)
		{
			DBCart.ChangeCart(Id,quantity);
			return RedirectToAction("Index");
		}

		[HttpPost]
		public IActionResult DeleteItem(string customer,string Id)
		{
			Debug.WriteLine($"this is the id:{Id},{customer}");
			DBCart.DeleteCart(customer,Id);
			return RedirectToAction("Index");
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
