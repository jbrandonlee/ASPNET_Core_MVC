using System.Diagnostics;
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
            List<Product> products;
            products = String.IsNullOrEmpty(search) ? DBProduct.GetProducts() : DBProduct.GetFilteredProducts(search);

			ViewBag.products = products;
			return View();
        }

		[HttpPost]
		public IActionResult AddToCart(string username, string productId)
		{
			if (!String.IsNullOrEmpty(productId))
			{
				Product product = DBProduct.GetProductById(productId);
				CartItem cartItem = CartItem.ConvertToCartItem(product, username, 1);
				DBCart.AddToCart(cartItem);
			}
			return Ok();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
