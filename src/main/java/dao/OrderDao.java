package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Address;
import beans.Address_type;
import beans.Order;
import beans.Role;
import beans.Status;
import beans.User;
import connector.DBConnect;

public class OrderDao implements IDAO<Order> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;
	
	@Override
	public boolean create(Order order) {

		try {
			sql = connect.prepareStatement("INSERT INTO order_list (dateOrder, totalPrice, paymentToken, trackingNumber,"
					+ " id_user, id_address_delivery, id_address_billing, id_status)" + "VALUES (now(),?,?,?,?,?,?,?)");
		
			sql.setFloat(1, order.getTotalPrice());
			sql.setString(2, order.getPaymentToken());
			sql.setString(3, order.getTrackingNumber());
			sql.setInt(4, order.getUser().getId());
			sql.setInt(5, order.getAddress_delivery().getId());
			sql.setInt(6, order.getAddress_billing().getId());
			sql.setInt(7, order.getStatus().getId());
			

			sql.execute();

			return true;
		} catch (Exception e) {
			System.out.println("Insertion KO");
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<Order> read() {
		ArrayList<Order> orders = new ArrayList<>();
		Address_type addtype= new Address_type();

		try {
			sql = connect
					.prepareStatement("select *, u.id as userId, o.id as orderId, a.id as addressId from order_list o inner join user u on u.id=o.id_user "
							+ "INNER JOIN role r ON r.id = u.id_role INNER JOIN address a ON o.id_address_delivery = a.id INNER JOIN status s ON s.id = o.id_status ORDER BY dateOrder DESC");
			rs = sql.executeQuery();

			while (rs.next()) {
				User user = new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
				addtype.setId(2);	
				Status status = new Status(rs.getString("status"));
				Address address = new Address(rs.getInt("addressId"), rs.getString("address"), rs.getInt("zipCode"),rs.getString("city"),user,addtype);
				orders.add(new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,address,address,status) );
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}
	
	public ArrayList<Order> readForUser(User user) {
		ArrayList<Order> orders = new ArrayList<>();
		Address_type addtype= new Address_type();

		try {
			sql = connect
					.prepareStatement("select *, u.id as userId, o.id as orderId from order_list o inner join user u on u.id=o.id_user "
							+ "INNER JOIN role r ON r.id = u.id_role INNER JOIN address_ledger a1 ON o.id_address_delivery = a1.id INNER JOIN address_ledger a2 ON o.id_address_billing = a2.id INNER JOIN status s "
							+ "ON s.id = o.id_status WHERE u.id = ? ORDER BY dateOrder DESC");
			sql.setInt(1, user.getId());
			rs = sql.executeQuery();

			while (rs.next()) {
				Status status = new Status(rs.getString("status"));
				addtype.setId(2);	
				Address addressDel = new Address(rs.getInt("a1.id"), rs.getString("a1.address"), rs.getInt("a1.zipCode"),rs.getString("a1.city"),user,addtype);
				addtype.setId(1);	
				Address addressBill = new Address(rs.getInt("a2.id"), rs.getString("a2.address"), rs.getInt("a2.zipCode"),rs.getString("a2.city"),user,addtype);
				orders.add(new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,addressDel,addressBill,status) );
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}

	@Override
	public boolean delete(Order order) {
		try {
			sql = connect.prepareStatement("DELETE from order_list WHERE id =?");
			sql.setInt(1, order.getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Order object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Order findById(int id) {

		Order orders = new Order();
		Address_type addtype = new Address_type();

		try {
			sql = connect
					.prepareStatement("select *, u.id as userId, o.id as orderId, a1.id as addressId, a2.id as addressId  from order_list o inner join user u on u.id=o.id_user "
							+ "INNER JOIN role r ON r.id = u.id_role INNER JOIN address_ledger a1 ON o.id_address_delivery = a1.id INNER JOIN address_ledger a2 ON o.id_address_billing = a2.id INNER JOIN status s "
							+ "ON s.id = o.id_status WHERE o.id=?");
			sql.setInt(1, id);
			System.out.println("sql Order: "+sql);
			rs = sql.executeQuery();

			if (rs.next()) {
				User user = new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
				addtype.setId(2);	
				Status status = new Status(rs.getString("status"));
				Address address1 = new Address(rs.getInt("a1.addressId"), rs.getString("a1.address"), rs.getInt("a1.zipCode"),rs.getString("a1.city"),user,addtype);
				Address address2 = new Address(rs.getInt("a2.addressId"), rs.getString("a2.address"), rs.getInt("a2.zipCode"),rs.getString("a2.city"),user,addtype);
				orders = (new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,address1,address2,status) );
				return orders;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;

	}
	public ArrayList<Order> search(String search) {
		ArrayList<Order> orders = new ArrayList<>();
		Address_type addtype= new Address_type();

		try {
			sql = connect
					.prepareStatement("select *, u.id as userId, o.id as orderId, a.id as addressId from order_list o inner join user u on u.id=o.id_user "
							+ "INNER JOIN role r ON r.id = u.id_role INNER JOIN address_ledger a1 ON o.id_address_delivery = a1.id INNER JOIN address_ledger a2 ON o.id_address_billing = a2.id INNER JOIN status s "
							+ "ON s.id = o.id_status WHERE CONCAT(email, ' ', status) LIKE ? ORDER BY dateOrder DESC");
			sql.setString(1, "%"+ search +"%");
			rs = sql.executeQuery();

			while (rs.next()) {
				User user = new User(rs.getInt("userId"), rs.getString("lastName"), rs.getString("firstName"),
						rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"),
						rs.getDate("registrationDate"), rs.getBoolean("isActive"),
						new Role(rs.getInt("id_role"), rs.getString("role")));
				addtype.setId(2);	
				Status status = new Status(rs.getString("status"));
				Address address1 = new Address(rs.getInt("a1.addressId"), rs.getString("a1.address"), rs.getInt("a1.zipCode"),rs.getString("a1.city"),user,addtype);
				Address address2 = new Address(rs.getInt("a2.addressId"), rs.getString("a2.address"), rs.getInt("a2.zipCode"),rs.getString("a2.city"),user,addtype);
				orders.add(new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,address1,address2,status) );
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}
	
	public int lastId() {
		int id = 0;
		try {
			/*
			 * VERSION AVEC BCRYPT
			 */
			sql = connect.prepareStatement("select last_insert_id() as 'last' from order_list"); // test@test.fr
	
			rs = sql.executeQuery();

			if (rs.next()) {
				

					return id = (rs.getInt("last"));
		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
}
