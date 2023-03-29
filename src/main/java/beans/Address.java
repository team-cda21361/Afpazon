package beans;

public class Address {
	private int id;
	private String address;
	private int zipCode;
	private String city;
	private User user;
	private Address_type address_type;
	
	public Address() {
	}
	
	public Address(String address, int zipCode, String city, User user, Address_type address_type) {
		this.address = address;
		this.zipCode = zipCode;
		this.city = city;
		this.user = user;
		this.address_type = address_type;
	}

	public Address(int id, String address, int zipCode, String city, User user, Address_type address_type) {
		this.id = id;
		this.address = address;
		this.zipCode = zipCode;
		this.city = city;
		this.user = user;
		this.address_type = address_type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address_type getAddress_type() {
		return address_type;
	}

	public void setAddress_type(Address_type address_type) {
		this.address_type = address_type;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", zipCode=" + zipCode + ", city=" + city + ", user="
				+ user + ", address_type=" + address_type + "]";
	}
	
}
