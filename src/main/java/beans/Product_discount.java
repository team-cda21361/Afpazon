package beans;

public class Product_discount {
	private int id;
	private Product product;
	private Discount discount;
	
	public Product_discount() {
	}
	
	public Product_discount(Product product, Discount discount) {
		this.product = product;
		this.discount = discount;
	}

	public Product_discount(int id, Product product, Discount discount) {
		this.id = id;
		this.product = product;
		this.discount = discount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}
}
