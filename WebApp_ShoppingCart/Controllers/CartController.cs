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
			List<Product> products = DBProduct.GetProducts();
			ViewBag.products = products;

			return View();
		}
        /*DataList展示所有商品,添加按钮订购,点击添加到DataTable虚拟表中,

DataTable生成虚拟表(存放商品基本信息, 以及数量),

(购物车列表) GridView展示DataTable中数据

这里首先要判断是否存在购物车一般用Session存储(Session("Car"))

如果存在判断此件商品是否存在,如果此件商品也存在,则仅在数量上加1。

如此件商品不存在,则添加此商品的基本信息,

如购物车不存在,则创建购物车.

删除 更新 可放置两个按钮,或者Link,购物车列表(GridView)可添加全选/反选功能,点击删除,只需

找到选中的CheckBox即可, 更新的话,可以在购物车列表(GridView)数量一列放成TextBox，点击更新

的时候,可以全部重新更新和加载购物车.

*/

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
