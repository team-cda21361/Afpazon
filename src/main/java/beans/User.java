package beans;

import java.sql.Date;

public class User {
	private int id;
	private String lastName;
	private String firstName;
	private String email;
	private String password;
	private String gender;
	private String phone;
	private Date registrationDate;
	private boolean isActive = true;
	private Role role;
	
	public User() {
	}
	
	/*
	 * constructor only for dev mock(to be deleted after developpement
	 */
	public User(String email, Role role) {
		
		this.email = email;
		this.role = role;
	}


	/*for registration*/
	public User(String lastName, String firstName, String email, String password, Role role) {
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	public User(String lastName, String firstName, String email, String password, String gender, String phone,
			Date registrationDate, boolean isActive, Role role) {
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.phone = phone;
		this.registrationDate = registrationDate;
		this.isActive = isActive;
		this.role = role;
	}
	
	public User(int id, String lastName, String firstName, String email, String password, String gender, String phone,
			Date registrationDate, boolean isActive, Role role) {
		this.id = id;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.phone = phone;
		this.registrationDate = registrationDate;
		this.isActive = isActive;
		this.role = role;
	}

	public User(int id, String lastName, String firstName, String email, String gender, String phone,
			Date registrationDate, boolean isActive, Role role) {
		this.id = id;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.registrationDate = registrationDate;
		this.isActive = isActive;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}
