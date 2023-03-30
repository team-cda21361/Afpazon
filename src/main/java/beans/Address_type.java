package beans;

public class Address_type {
	private int id;
	private String type;
	
	public Address_type() {
	}
	
	public Address_type(String type) {
		this.type = type;
	}
	
	public Address_type(int id, String type) {
		this.id = id;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
