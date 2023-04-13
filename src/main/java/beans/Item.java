package beans;

public class Item {
	private int quantity;
	private Product product;
	private double discount;
	
	
	
	/*************************************************
	 * SETTERS AND GETTERS
	 * ***********************************************/
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
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	/**********************************************
	 * CONSTRUSTORS
	 * ****************************************/
	public Item(int quantity, Product product) {
		this.quantity = quantity;
		this.product = product;
	}
	public Item(Product product) {
		this.product = product;
	}
	public Item(int quantity, Product product, double discount) {
		this.quantity = quantity;
		this.product = product;
		this.discount = discount;
	}
	
	
	
	

}
