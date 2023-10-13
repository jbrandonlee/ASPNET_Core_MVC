namespace WebApp_ShoppingCart.Models
{
	public class Product
	{
		public string Id { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }
		public decimal Price { get; set; }
		public string? ImageUrl { get; set; }
		public string ActivationCode { get; set; }
		public DateOnly Date { get; set; }
		public int Quantity {  get; set; }

    }	
}
