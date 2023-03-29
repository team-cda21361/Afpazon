package beans;

public class Complement {
	private int id;
	private Product product_a;
	private Product product_b;
	
	public Complement() {
	}
	
	public Complement(Product product_a, Product product_b) {
		this.product_a = product_a;
		this.product_b = product_b;
	}

	public Complement(int id, Product product_a, Product product_b) {
		this.id = id;
		this.product_a = product_a;
		this.product_b = product_b;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct_a() {
		return product_a;
	}

	public void setProduct_a(Product product_a) {
		this.product_a = product_a;
	}

	public Product getProduct_b() {
		return product_b;
	}

	public void setProduct_b(Product product_b) {
		this.product_b = product_b;
	}
}
