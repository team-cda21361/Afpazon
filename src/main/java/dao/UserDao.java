package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCrypt;

import beans.User;
import beans.Role;
import connector.DBConnect;

public class UserDao implements IDAO<User> {

	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;

	@Override
	public boolean create(User user) {

		try {
			sql = connect.prepareStatement("INSERT INTO user (lastName, firstName, email, password, gender, phone,"
					+ " registrationDate , isActive, id_role)" + "VALUES (?,?,?,?,?,?,NOW(),?,?)");
		
			sql.setString(1, user.getLastName());
			sql.setString(2, user.getFirstName());
			sql.setString(3, user.getEmail());
			sql.setString(4, user.getPassword());
			sql.setString(5, user.getGender());
			sql.setString(6, user.getPhone());
			sql.setBoolean(7, user.isActive());
			sql.setInt(8, user.getRole().getId());

			sql.execute();

			return true;
		} catch (Exception e) {
			System.out.println("Insertion KO");
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<User> read() {
		ArrayList<User> users = new ArrayList<>();
		User user = null;

		try {
			sql = connect
					.prepareStatement("select *, user.id as userId from user inner join role on user.id_role=role.id");
			rs = sql.executeQuery();

			while (rs.next()) {
				user = new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}

	public boolean update(User user) {
		try {
			sql = connect.prepareStatement(
					"UPDATE user SET lastName=?,firstName=?,email=?,password=?,gender=?, phone=?,isActive=?, role=? "
							+ " WHERE id=?");
			
			sql.setString(1, user.getLastName());
			sql.setString(2, user.getFirstName());
			sql.setString(3, user.getEmail());
			sql.setString(4, user.getPassword());
			sql.setString(5, user.getGender());
			sql.setString(6, user.getPhone());
			sql.setBoolean(7, user.isActive());
			sql.setInt(8, user.getRole().getId());
			sql.setInt(9, user.getId());

			sql.executeUpdate();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}

	// Just for Interface IDAO ready
	public boolean delete(User user) {

		return false;
	}

	public boolean changeUserStatus(User user) {
		try {
			sql = connect.prepareStatement("UPDATE user SET isActive=? WHERE id=?");
			sql.setBoolean(1, user.isActive());
			sql.setInt(2, user.getId());
			sql.execute();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public User login(String email, String password) {
		try {
			/*
			 * VERSION AVEC BCRYPT
			 */
			sql = connect.prepareStatement(
					"select *, user.id as userId from user inner join role on user.id_role=role.id where email=?"); // test@test.fr
			sql.setString(1, email);

			rs = sql.executeQuery();

			if (rs.next()) {
				if (BCrypt.checkpw(password, rs.getString("password"))) {

					return new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
							rs.getString("email"), rs.getString("password"), rs.getString("gender"),
							rs.getString("phone"), rs.getDate("registrationDate"), rs.getBoolean("isActive"),
							new Role(rs.getInt("id_role"), rs.getString("role")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public User findById(int id) {
		try {

			sql = connect
					.prepareStatement("select * from user inner join role on user.id_role=role.id WHERE user.id=?");
			sql.setInt(1, id);
			rs = sql.executeQuery();

			if (rs.next()) {
				return new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean findByEmail(String email) {
		try {

			sql = connect
					.prepareStatement("select * from user WHERE user.email=?");
			sql.setString(1, email);
			rs = sql.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<User> search(String search) {
		ArrayList<User> users = new ArrayList<>();
		User user = null;

		try {
			sql = connect
					.prepareStatement("select *, user.id as userId from user"
							+ " inner join role on user.id_role=role.id WHERE CONCAT(lastName, ' ', firstName, ' ', email) LIKE ?");
			sql.setString(1, "%" +search+ "%");
			
			rs = sql.executeQuery();

			while (rs.next()) {
				user = new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
}
