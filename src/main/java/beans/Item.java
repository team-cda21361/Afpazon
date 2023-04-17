package beans;

import java.util.ArrayList;

public class Item {
	private int quantity;
	private Product product;
	private ArrayList<Discount> discount;
	private double prixR;
	
	
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
	public ArrayList<Discount> getDiscount() {
		return discount;
	}
	public void setDiscount(ArrayList<Discount> discount) {
		this.discount = discount;
	}
	
	public double getPrixR() {
		return prixR;
	}
	public void setPrixR(double prixR) {
		this.prixR = prixR;
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
	public Item(int quantity, Product product, ArrayList<Discount> discount) {
		this.quantity = quantity;
		this.product = product;
		this.discount = discount;
	}
	
	public Item(int quantity, Product product, ArrayList<Discount> discount, double prixR) {
		this.quantity = quantity;
		this.product = product;
		this.discount = discount;
		this.prixR = prixR;
	}
	public Item(int quantity, Product product, double prixR) {
		this.quantity = quantity;
		this.product = product;
		this.prixR = prixR;
	}
	
	

}
