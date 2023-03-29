package beans;

public class Category_product {
	private int id;
	private Product product;
	private Category category;
	
	public Category_product() {
	}
	
	public Category_product(Product product, Category category) {
		this.product = product;
		this.category = category;
	}

	public Category_product(int id, Product product, Category category) {
		this.id = id;
		this.product = product;
		this.category = category;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
