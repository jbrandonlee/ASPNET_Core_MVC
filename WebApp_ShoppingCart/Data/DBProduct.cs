using Microsoft.Data.SqlClient;
using WebApp_ShoppingCart.Models;
using System;
using System.Collections.Generic;

namespace WebApp_ShoppingCart.Data
{
    public static class DBProduct
    {
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
