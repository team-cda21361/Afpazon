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
			sql = connect.prepareStatement("INSERT INTO order_list (dateOrder,totalPrice,paymentToken,trackingNumber,"
					+ " id_user,id_address_delivery,id_status)" + "VALUES (now(),?,?,?,?,?,?)");
		
			sql.setFloat(1, order.getTotalPrice());
			sql.setString(2, order.getPaymentToken());
			sql.setString(3, order.getTrackingNumber());
			sql.setInt(4, order.getUser().getId());
			sql.setInt(5, order.getAddress_delivery().getId());
			sql.setInt(6, order.getStatus().getId());
			

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
				orders.add(new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,address,status) );
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}

	@Override
	public boolean delete(Order order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Order object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<Order> search(String search) {
		ArrayList<Order> orders = new ArrayList<>();
		Address_type addtype= new Address_type();

		try {
			sql = connect
					.prepareStatement("select *, u.id as userId, o.id as orderId, a.id as addressId from order_list o inner join user u on u.id=o.id_user "
							+ "INNER JOIN role r ON r.id = u.id_role INNER JOIN address a ON o.id_address_delivery = a.id INNER JOIN status s "
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
				Address address = new Address(rs.getInt("addressId"), rs.getString("address"), rs.getInt("zipCode"),rs.getString("city"),user,addtype);
				orders.add(new Order(rs.getInt("orderId"),rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,address,status) );
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}
}
