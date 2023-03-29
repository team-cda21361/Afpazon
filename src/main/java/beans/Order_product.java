package beans;

public class Order_product {
	private int id;
	private Float price;
	private int quantity;
	private Product product;
	private Order order;
	
	public Order_product() {
	}
	
	public Order_product(Float price, int quantity, Product product, Order order) {
		this.price = price;
		this.quantity = quantity;
		this.product = product;
		this.order = order;
	}
	
	public Order_product(int id, Float price, int quantity, Product product, Order order) {
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.product = product;
		this.order = order;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
