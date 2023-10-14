using Microsoft.Data.SqlClient;
using WebApp_ShoppingCart.Models;
using System;
using System.Collections.Generic;

namespace WebApp_ShoppingCart.Data
{
    public class DBProduct
    {
		//For the Gallery
		public static List<Product> GetProducts()
		{
			List<Product> products = new List<Product>();
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string sql = @"SELECT ProductID, ProductName, Price,Description From ProductList";
				SqlCommand cmd = new SqlCommand(sql, conn);
				SqlDataReader reader = cmd.ExecuteReader();

				while (reader.Read())
				{
					Product product = new Product()
					{
						Name = (string)reader["ProductName"],
						Description = (string)reader["Description"],
						Price = (decimal)reader["Price"],
						Id = (string)reader["ProductID"]
					};
					products.Add(product);
				}
			}

			return products;
		}

		//For the Cart
		public static Product GetProductsbyid(string productid)
		{
			if (string.IsNullOrEmpty(productid)) { return null; }
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string checkSql = "SELECT COUNT(*) FROM Cart WHERE ProductID = @productid";
				SqlCommand checkCmd = new SqlCommand(checkSql, conn);
				checkCmd.Parameters.AddWithValue("@productid", productid);
				int existingRows = (int)checkCmd.ExecuteScalar();
				if (existingRows > 0)
				{
					string sql = @"SELECT ProductID, ProductName, Price,Description,Quantity From Cart where ProductID=@productid";
					SqlCommand cmd = new SqlCommand(sql, conn);
					cmd.Parameters.AddWithValue("@productid", productid);
					SqlDataReader reader = cmd.ExecuteReader();

					while (reader.Read())
					{
						Product product = new Product()
						{
							Name = (string)reader["ProductName"],
							Description = (string)reader["Description"],
							Price = (decimal)reader["Price"],
							Id = (string)reader["ProductID"],
							Quantity = (int)reader["Quantity"]
						};
						return product;
					}
				}
				else
				{
					string sql = @"SELECT ProductID, ProductName, Price,Description From ProductList where ProductID=@productid";
					SqlCommand cmd = new SqlCommand(sql, conn);
					cmd.Parameters.AddWithValue("@productid", productid);
					SqlDataReader reader = cmd.ExecuteReader();

					while (reader.Read())
					{
						Product product = new Product()
						{
							Name = (string)reader["ProductName"],
							Description = (string)reader["Description"],
							Price = (decimal)reader["Price"],
							Id = (string)reader["ProductID"],
						};
						return product;
					}
				}
				return null;
			}
		}

		public void AddToCart(Product product)
		{
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();

				//test whether exist productid
				string checkSql = "SELECT COUNT(*) FROM Cart WHERE ProductID = @productid";
				SqlCommand checkCmd = new SqlCommand(checkSql, conn);
				checkCmd.Parameters.AddWithValue("@productid", product.Id);
				int existingRows = (int)checkCmd.ExecuteScalar();
				if (existingRows <= 0)
				{
					string sql = @"INSERT INTO Cart(ProductID, ProductName, Price,Description,Quantity,CustomerCode) 
                            VALUES(@productid,@productname,@productprice,@productdescription,@productquantity,@customercode);
                            SELECT SCOPE_IDENTITY();";
					SqlCommand cmd = new SqlCommand(sql, conn);

					cmd.Parameters.AddWithValue("@productid", product.Id);
					cmd.Parameters.AddWithValue("@productname", product.Name);
					cmd.Parameters.AddWithValue("@productprice", product.Price);
					cmd.Parameters.AddWithValue("@productdescription", product.Description);
					cmd.Parameters.AddWithValue("@productquantity", 1);
					cmd.Parameters.AddWithValue("@customercode", 1);
					cmd.ExecuteNonQuery();

				}
				else
				{
					string updateSql = @"UPDATE Cart SET Quantity = 1 + @productquantity 
                             WHERE ProductID = @productid";

					SqlCommand cmd2 = new SqlCommand(updateSql, conn);
					cmd2.Parameters.AddWithValue("@productid", product.Id);
					cmd2.Parameters.AddWithValue("@productquantity", product.Quantity);
					cmd2.ExecuteNonQuery();
				}
			}
		}

		public static List<Product> GetCartProducts()
		{
			List<Product> products = new List<Product>();
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string sql = @"SELECT ProductID, ProductName, Price,Description,Quantity,CustomerCode From Cart";
				SqlCommand cmd = new SqlCommand(sql, conn);
				SqlDataReader reader = cmd.ExecuteReader();

				while (reader.Read())
				{
					Product product = new Product()
					{
						Name = (string)reader["ProductName"],
						Description = (string)reader["Description"],
						Price = (decimal)reader["Price"],
						Id = (string)reader["ProductID"],
						Quantity = (int)reader["Quantity"],
						CustomerCode = (string)reader["CustomerCode"]
					};
					products.Add(product);
				}
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
                string sql = @"SELECT P.ProductName, P.Description, O.PurchaseDate, OD.ActivationCode 
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
                        Date = DateOnly.FromDateTime((DateTime)reader["PurchaseDate"])
                    };
                    products.Add(product);
                }
            }
            return products;
        }

    }
}
