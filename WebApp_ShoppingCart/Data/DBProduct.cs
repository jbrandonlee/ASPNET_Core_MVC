using Microsoft.Data.SqlClient;
using WebApp_ShoppingCart.Models;

namespace WebApp_ShoppingCart.Data
{
    public static class DBProduct
    {
        public static List<Product> GetDBProducts()
        {
            List<Product> products = new List<Product>();

            // Code here to retrieve products from DB

            return products;
        }

		public static List<Product> GetFilteredProducts(string search)
		{
			List<Product> products = GetDBProducts();

			// Code here to filter products

			return products;
		}

        public static List<Product> GetMockProducts(int num)
        {
            List<Product> products = new List<Product>();
            if (num > 30) { num = 30; }

            for (int i = 1; i <= num; i++)
            {
                products.Add(new Product { Id = $"CA0{i.ToString().PadLeft(2,'0')}", Name = $"Item{i}", Price = (9.99 + i * 10), Description = $"0{i} " + GetMockDescription(), ImageUrl = $"/img/{i.ToString().PadLeft(3, '0')}.png" });
            }

            return products;
        }

        private static string GetMockDescription()
        {
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tellus odio, tincidunt in ullamcorper at, vehicula et ex. Pellentesque aliquet eget ligula eu ultricies. Mauris eu tincidunt lorem. Nulla facilisi. Integer elementum elit dolor. Ut gravida leo in ornare porta. Mauris augue dui, gravida in magna quis, bibendum venenatis turpis. Cras eget metus non tortor laoreet volutpat at at orci. Proin fringilla, neque sed laoreet eleifend, nunc sem blandit est, quis semper eros turpis at dui.";
        }

        public static List<Product> GetPurchaseHistory()
        {
            List<Product> products = new List<Product>();

            using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
            {
                conn.Open();
                string sql = @"SELECT P.ProductName, P.Description, O.PurchaseDate, OD.Quantity, OD.ActivationCode 
                               FROM ProductList P, OrderHeader O, OrderDetails OD
                               WHERE P.ProductID = OD.ProductID AND O.OrderID = OD.OrderID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Product product = new Product()
                    {
                        Name = (string)reader["ProductName"],
                        Description = (string)reader["Description"],
                        ActivationCode = (string)reader["ActivationCode"],
                        Date = DateOnly.FromDateTime((DateTime)reader["PurchaseDate"]),
                        Quantity = (int)reader["Quantity"]
                    };
                    products.Add(product);
                }
            }
            return products;
        }

    }
}
