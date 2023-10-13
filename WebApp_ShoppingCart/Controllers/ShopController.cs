using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp_ShoppingCart.Models;
using WebApp_ShoppingCart.Data;
using System.Text.Json;

// Handles Shop Gallery
namespace WebApp_ShoppingCart.Controllers
{
    public class ShopController : Controller
    {

        public IActionResult Gallery(string search)
        {
            List<Product> products = DBProduct.GetProducts();
            if (search == null)
            {
                ViewBag.products = products;
            }
            else
            {
                ViewBag.products = Searchproduct(search, products);
            }
            return View();
        }

        private List<Product> Searchproduct(string search, List<Product> products)
        {
            List<Product> result = new List<Product>();
            foreach (Product product in products)
            {
                if (product.Name != null)
                {
                    string productlo = product.Name.ToLower();
                    string searchlo = search.ToLower();
                    if (productlo.Contains(searchlo))
                    {
                        result.Add(product);
                    }
                }
            }
            return result;
        }
        
        //get the data from js
        [HttpPost]
        public IActionResult Click([FromBody] string productid)
        {
            
            return View("Index","Cart");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
