package beans;

public class Image {
	private int id;
	private String picPath;
	private Product product;
	
	public Image() {
	}
	
	public Image(String picPath, Product product) {
		this.picPath = picPath;
		this.product = product;
	}

	public Image(int id, String picPath, Product product) {
		this.id = id;
		this.picPath = picPath;
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
