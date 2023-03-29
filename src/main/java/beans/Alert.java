package beans;

public class Alert {
	private int id;
	private String email;
	private boolean backInStock;
	private boolean priceDrop;
	private Product product;
	
	public Alert() {
	}
	
	public Alert(String email, boolean backInStock, boolean priceDrop, Product product) {
		this.email = email;
		this.backInStock = backInStock;
		this.priceDrop = priceDrop;
		this.product = product;
	}

	public Alert(int id, String email, boolean backInStock, boolean priceDrop, Product product) {
		this.id = id;
		this.email = email;
		this.backInStock = backInStock;
		this.priceDrop = priceDrop;
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isBackInStock() {
		return backInStock;
	}

	public void setBackInStock(boolean backInStock) {
		this.backInStock = backInStock;
	}

	public boolean isPriceDrop() {
		return priceDrop;
	}

	public void setPriceDrop(boolean priceDrop) {
		this.priceDrop = priceDrop;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
