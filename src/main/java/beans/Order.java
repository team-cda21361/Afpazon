package beans;

import java.sql.Date;

public class Order {
	private int id;
	private Date date;
	private Float totalPrice;
	private String paymentToken;
	private String trackingNumber;
	private User user;
	private Address address_delivery;
	private Address address_billing;
	private Status status;
	
	public Order() {
	}

	
	public Order(Float totalPrice, String paymentToken, String trackingNumber, User user,
			Address address_delivery, Address address_billing, Status status) {

		this.totalPrice = totalPrice;
		this.paymentToken = paymentToken;
		this.trackingNumber = trackingNumber;
		this.user = user;
		this.address_delivery = address_delivery;
		this.address_billing = address_billing;
		this.status = status;
	}

	public Order(Date date, Float totalPrice, String paymentToken, String trackingNumber, User user,
			Address address_delivery, Address address_billing, Status status) {
		this.date = date;
		this.totalPrice = totalPrice;
		this.paymentToken = paymentToken;
		this.trackingNumber = trackingNumber;
		this.user = user;
		this.address_delivery = address_delivery;
		this.address_billing = address_billing;
		this.status = status;
	}
	
	public Order(int id, Date date, Float totalPrice, String paymentToken, String trackingNumber, User user,
			Address address_delivery, Address address_billing, Status status) {
		this.id = id;
		this.date = date;
		this.totalPrice = totalPrice;
		this.paymentToken = paymentToken;
		this.trackingNumber = trackingNumber;
		this.user = user;
		this.address_delivery = address_delivery;
		this.address_billing = address_billing;
		this.status = status;
	}
	
	public Order(int id, Date date, Float totalPrice, String paymentToken, String trackingNumber, User user,
			Status status) {
		this.id = id;
		this.date = date;
		this.totalPrice = totalPrice;
		this.paymentToken = paymentToken;
		this.trackingNumber = trackingNumber;
		this.user = user;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentToken() {
		return paymentToken;
	}

	public void setPaymentToken(String paymentToken) {
		this.paymentToken = paymentToken;
	}

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress_delivery() {
		return address_delivery;
	}

	public void setAddress_delivery(Address address_delivery) {
		this.address_delivery = address_delivery;
	}

	public Address getAddress_billing() {
		return address_billing;
	}
	
	public void setAddress_billing(Address address_billing) {
		this.address_billing = address_billing;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
}
