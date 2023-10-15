namespace WebApp_ShoppingCart.Models
{
	public class CartItem : Product
	{
		public string? CustomerId { get; set; }
		public int Quantity { get; set; }

		public static CartItem ConvertToCartItem(Product product, string CustomerId, int Quantity)
		{
			CartItem cartItem = new CartItem
			{
				Id = product.Id,				
				Name = product.Name,
				Description = product.Description,
				Price = product.Price,
				ImageUrl = product.ImageUrl,
				CustomerId = CustomerId,
				Quantity = Quantity
			};

			return cartItem;
		}
	}
}
