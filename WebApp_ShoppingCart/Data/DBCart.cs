using Microsoft.Data.SqlClient;
using System.Reflection.PortableExecutable;
using WebApp_ShoppingCart.Models;

namespace WebApp_ShoppingCart.Data
{
	public class DBCart
	{
		// (For View) Returns list of cart items by username
		public static List<CartItem> GetCartItems(string username)
		{
			List<CartItem> cartItems = new List<CartItem>();
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string sql = @"SELECT P.ProductID, P.ProductName, P.Description, P.Price, C.CustomerID, C.Quantity 
							   FROM ProductList P, Cart C
							   WHERE P.ProductID = C.ProductID";

				SqlCommand cmd = new SqlCommand(sql, conn);
				SqlDataReader reader = cmd.ExecuteReader();

				while (reader.Read())
				{
					CartItem cartItem = new CartItem()
					{
						Id = (string)reader["ProductID"],
						Name = (string)reader["ProductName"],
						Description = (string)reader["Description"],
						Price = (decimal)reader["Price"],
						ImageUrl = $"/img/{(string)reader["ProductID"]}.png",
						CustomerId = (string)reader["CustomerId"],
						Quantity = (int)reader["Quantity"]
					};
					cartItems.Add(cartItem);
				}
				return cartItems;
			}
		}

		public static bool IsItemInCart(string id)
		{
			if (String.IsNullOrEmpty(id)) { return false; }

			int count;
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string sql = @"SELECT COUNT(*) FROM Cart WHERE ProductID = @ProductId";

				SqlCommand cmd = new SqlCommand(sql, conn);
				cmd.Parameters.AddWithValue("@ProductId", id);

				count = (int)cmd.ExecuteScalar();
			}
			return (count > 0);
		}

		// Handles Adding New Item to Cart or Increasing Quantity
		public static void AddToCart(CartItem cartItem)
		{
			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();

				if (!IsItemInCart(cartItem.Id))
				{
					// If Item does not exists in Cart, Add to Cart
					string sql = @"INSERT INTO Cart(ProductID, Quantity, CustomerID) 
								   VALUES(@productid,@productquantity,@customerid);
								   SELECT SCOPE_IDENTITY();";
					SqlCommand cmd = new SqlCommand(sql, conn);

					cmd.Parameters.AddWithValue("@productid", cartItem.Id);
					cmd.Parameters.AddWithValue("@productquantity", 1);
					cmd.Parameters.AddWithValue("@customerid", "john");
					cmd.ExecuteNonQuery();
				}
				else
				{
					// If Item already exists in Cart, Update Quantity
					string updateSql = @"UPDATE Cart SET Quantity = Quantity + 1 
                             WHERE ProductID = @productid";

					SqlCommand cmd2 = new SqlCommand(updateSql, conn);
					cmd2.Parameters.AddWithValue("@productid", cartItem.Id);
					cmd2.ExecuteNonQuery();
				}
			}
		}
	}
}