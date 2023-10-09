using WebApp_ShoppingCart.Models;

namespace WebApp_ShoppingCart.Data
{
    public static class DBProduct
    {
        public static List<Product> GetDBProducts()
        {
            List<Product> products = new List<Product>();

            // Code Here

            return products;
        }

        public static List<Product> GetMockProducts()
        {
            List<Product> products = new List<Product>();

            for (int i = 1; i <= 30; i++)
            {
                products.Add(new Product { Name = $"Item{i}", Price = (9.99 + i * 10), Description = $"0{i} " + GetMockDescription(), ImageUrl = $"/img/{(i % 10).ToString().PadLeft(3, '0')}.png" });
            }

            return products;
        }

        private static string GetMockDescription()
        {
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tellus odio, tincidunt in ullamcorper at, vehicula et ex. Pellentesque aliquet eget ligula eu ultricies. Mauris eu tincidunt lorem. Nulla facilisi. Integer elementum elit dolor. Ut gravida leo in ornare porta. Mauris augue dui, gravida in magna quis, bibendum venenatis turpis. Cras eget metus non tortor laoreet volutpat at at orci. Proin fringilla, neque sed laoreet eleifend, nunc sem blandit est, quis semper eros turpis at dui.";
        }
    }
}
