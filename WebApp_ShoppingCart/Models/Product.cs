namespace WebApp_ShoppingCart.Models
{
	public class Product
	{
		public string? Name { get; set; }
		public double? Price { get; set; }
		public string? Description { get; set; }
		public string? ImageUrl { get; set; }

		public List<Product> GetMockData()
		{
			List<Product> products = new List<Product>();

			for (int i = 1; i <= 10; i++)
			{
				products.Add(new Product { Name = $"Item{i}", Price = (9.99 + i * 10), Description = $"0{i} " + GetDescription(), ImageUrl = $"~/img/{i.ToString().PadLeft(3)}.png" });
			}

			return products;
		}

		private string GetDescription()
		{
			return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tellus odio, tincidunt in ullamcorper at, vehicula et ex. Pellentesque aliquet eget ligula eu ultricies. Mauris eu tincidunt lorem. Nulla facilisi. Integer elementum elit dolor. Ut gravida leo in ornare porta. Mauris augue dui, gravida in magna quis, bibendum venenatis turpis. Cras eget metus non tortor laoreet volutpat at at orci. Proin fringilla, neque sed laoreet eleifend, nunc sem blandit est, quis semper eros turpis at dui.";
		}
	}
}