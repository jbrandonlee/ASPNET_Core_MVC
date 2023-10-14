using Microsoft.Data.SqlClient;
using WebApp_ShoppingCart.Models;

namespace WebApp_ShoppingCart.Data
{
	public class DBPurchase
	{
		// (For View) Returns list of purchases by username
		public static List<Purchase> GetPurchaseHistory(string username)
		{
			List<Purchase> purchases = new List<Purchase>();

			using (SqlConnection conn = new SqlConnection(Data.CONNECTION_STRING))
			{
				conn.Open();
				string sql = @"SELECT P.ProductID, P.ProductName, P.Description, O.OrderId, O.PurchaseDate, OD.ActivationCode 
                               FROM ProductList P, OrderHeader O, OrderDetails OD
                               WHERE P.ProductID = OD.ProductID AND O.OrderID = OD.OrderID AND O.CustomerID = @Username 
							   ORDER BY PurchaseDate, ProductID";
				SqlCommand cmd = new SqlCommand(sql, conn);
				cmd.Parameters.AddWithValue("@Username", username);
				SqlDataReader reader = cmd.ExecuteReader();

				while (reader.Read())
				{
					Purchase purchase = new Purchase()
					{
						Id = (string)reader["ProductId"],
						Name = (string)reader["ProductName"],
						Description = (string)reader["Description"],
						ImageUrl = $"/img/{(string)reader["ProductID"]}.png",
						OrderId = (string)reader["OrderId"],
						ActivationCode = new List<string>(),
						Date = DateOnly.FromDateTime((DateTime)reader["PurchaseDate"])
					};
					purchase.ActivationCode.Add((string)reader["ActivationCode"]);

					// If new Purchase is same as prev Purchase (same ProductID and OrderID)
					// works because of ORDER BY clause in SQL
					if (purchases.Count() != 0 && Purchase.ComparePurchase(purchase, purchases[purchases.Count() - 1]))
					{
						// Add to prev Purchase ActivationCode list
						purchases[purchases.Count() - 1].ActivationCode.Add(purchase.ActivationCode[0]);
					}
					else
					{
						// Insert new entry to list
						purchases.Add(purchase);
					}
				}
			}
			return purchases;
		}
	}
}
