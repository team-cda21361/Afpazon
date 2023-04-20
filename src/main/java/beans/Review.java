package beans;

public class Review {
	private int id;
	private String content;
	private int stars;
	private Product product;
	private User user;
	
	
	
	public Review(String content, int stars, Product product, User user) {
		this.content = content;
		this.stars = stars;
		this.product = product;
	}
	
	public Review() {

	}

	public Review(int id, String content, int stars, Product product) {
		this.id = id;
		this.content = content;
		this.stars = stars;
		this.product = product;
	}

	public Review(int id, String content, int stars, Product product, User user) {
		this.id = id;
		this.content = content;
		this.stars = stars;
		this.product = product;
		this.user = user;
	}

	public Review(int id, String content, int stars) {
		super();
		this.id = id;
		this.content = content;
		this.stars = stars;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
