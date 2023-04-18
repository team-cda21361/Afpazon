package beans;

public class Product {
	private int id;
	private String name;
	private String description;
	private Float price;
	private String mainPicPath;
	private String videoPath;
	private boolean inCarousel = false;
	private String size;
	private String reference;
	private String color;
	private Float weight;
	private int warranty;
	private int sponsoring;
	private boolean isActive;
	private VAT vat;
	private Review review;
	
	public Product() {
	}

	// backoffice order management order_productDao constructor
	public Product(int id,String name, String reference, VAT vat) {
		this.id = id;
		this.name = name;
		this.reference = reference;
		this.vat = vat;
	}
	public Product(String name, String description, Float price, String mainPicPath, String videoPath,
			boolean inCarousel, String size, String reference, String color, Float weight, int warranty, int sponsoring,
			boolean isActive, VAT vat) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.mainPicPath = mainPicPath;
		this.videoPath = videoPath;
		this.inCarousel = inCarousel;
		this.size = size;
		this.reference = reference;
		this.color = color;
		this.weight = weight;
		this.warranty = warranty;
		this.sponsoring = sponsoring;
		this.isActive = isActive;
		this.vat = vat;
	}
	
	public Product(int id, String name, String description, Float price, String mainPicPath, String videoPath,
			boolean inCarousel, String size, String reference, String color, Float weight, int warranty, int sponsoring,
			boolean isActive, VAT vat) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.mainPicPath = mainPicPath;
		this.videoPath = videoPath;
		this.inCarousel = inCarousel;
		this.size = size;
		this.reference = reference;
		this.color = color;
		this.weight = weight;
		this.warranty = warranty;
		this.sponsoring = sponsoring;
		this.isActive = isActive;
		this.vat = vat;
	}
	
	
	public Product(int id, String name, String description, Float price, String mainPicPath, String videoPath,
			boolean inCarousel, String size, String reference, String color, Float weight, int warranty, int sponsoring,
			boolean isActive, VAT vat, Review review) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.mainPicPath = mainPicPath;
		this.videoPath = videoPath;
		this.inCarousel = inCarousel;
		this.size = size;
		this.reference = reference;
		this.color = color;
		this.weight = weight;
		this.warranty = warranty;
		this.sponsoring = sponsoring;
		this.isActive = isActive;
		this.vat = vat;
		this.review = review;
	}

	public Product(int warranty) {
		this.warranty = warranty;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getMainPicPath() {
		return mainPicPath;
	}

	public void setMainPicPath(String mainPicPath) {
		this.mainPicPath = mainPicPath;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public boolean isInCarousel() {
		return inCarousel;
	}

	public void setInCarousel(boolean inCarousel) {
		this.inCarousel = inCarousel;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public int getWarranty() {
		return warranty;
	}

	public void setWarranty(int warranty) {
		this.warranty = warranty;
	}

	public int getSponsoring() {
		return sponsoring;
	}

	public void setSponsoring(int sponsoring) {
		this.sponsoring = sponsoring;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public VAT getVat() {
		return vat;
	}

	public void setVat(VAT vat) {
		this.vat = vat;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}
	
}
