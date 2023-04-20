package beans;

public class Image {
	private int id;
	private String picPath;
	private int product;
	
	public Image() {
	}
	
	public Image(String picPath, int product) {
		this.picPath = picPath;
		this.product = product;
	}

	public Image(int id, String picPath, int product) {
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

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}
}
