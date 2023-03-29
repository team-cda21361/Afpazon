package beans;

public class Category {
	private int id;
	private String category;
	private boolean isActive;
	
	public Category() {
	}
	
	public Category(String category, boolean isActive) {
		this.category = category;
		this.isActive = isActive;
	}

	public Category(int id, String category, boolean isActive) {
		this.id = id;
		this.category = category;
		this.isActive = isActive;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
}
