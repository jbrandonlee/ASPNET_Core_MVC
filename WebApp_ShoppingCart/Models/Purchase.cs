namespace WebApp_ShoppingCart.Models
{
	public class Purchase : Product
	{
		public string? CustomerId { get; set; }
		public string? OrderId { get; set; }
		public List<string>? ActivationCode { get; set; }
		public DateOnly? Date { get; set; }

		// Returns TRUE items of the same ProductId are part of the same OrderId
		public static bool ComparePurchase(Purchase p1, Purchase p2)
		{
			if (p1.Id == p2.Id &&								// Same ProductId
				p1.OrderId == p2.OrderId &&						// Bought in the same OrderId
				p1.ActivationCode != p2.ActivationCode) {		// Are different items
				return true;
			}
			return false;
		}
	}
}
