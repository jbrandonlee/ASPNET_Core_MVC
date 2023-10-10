using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Models;
using WebApp_ShoppingCart.Data;

// Handles Shop Gallery
namespace WebApp_ShoppingCart.Controllers
{
    public class ShopController : Controller
    {
        public IActionResult Gallery(string search)
        {
            List<Product> products = DBProduct.GetMockProducts();
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
