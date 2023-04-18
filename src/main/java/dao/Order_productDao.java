package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itextpdf.text.log.SysoCounter;

import beans.Order;
import beans.Order_product;
import beans.Product;
import beans.Status;
import beans.Stock;
import beans.User;
import beans.VAT;
import connector.DBConnect;

public class Order_productDao implements IDAO<Order_product>{
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;
	VATDao VATDao = new VATDao();

	@Override
	public boolean create(Order_product order_product) {

		try {
			sql = connect.prepareStatement("INSERT INTO order_product (price, quantity, id_product, id_order) VALUES(?,?,?,?)");
		
			sql.setFloat(1, order_product.getPrice());
			sql.setInt(2, order_product.getQuantity());
			sql.setInt(3, order_product.getProduct().getId());
			sql.setInt(4, order_product.getOrder().getId());

			System.out.println("sql: "+ sql);

			sql.execute();

			return true;
		} catch (Exception e) {
			System.out.println("Insertion KO");
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<Order_product> read() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<Order_product> readForOrder(Order order) {
		ArrayList<Order_product> productsList = new ArrayList<>();

		try {
			sql = connect.prepareStatement("select * from order_product op INNER JOIN product p ON p.id = op.id_product INNER JOIN vat ON vat.id = p.id_vat WHERE op.id_order = ?");
			sql.setInt(1, order.getId());
			rs = sql.executeQuery();

			while (rs.next()) {
				productsList.add(new Order_product(rs.getInt("op.id"), rs.getFloat("op.price"), rs.getInt("op.quantity"), new Product(rs.getInt("p.id"), rs.getString("p.name"), rs.getString("p.description"), rs.getFloat("p.price"), rs.getString("p.mainPicPath"), rs.getString("p.videoPath"), rs.getBoolean("p.inCarousel"), rs.getString("p.size"), rs.getString("p.reference"), rs.getString("p.color"), rs.getFloat("p.weight"), rs.getInt("p.warranty"), rs.getInt("p.sponsoring"), rs.getBoolean("p.isActive"), VATDao.findById(rs.getInt("p.id_vat"))), order));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productsList;
	}

	@Override
	public boolean update(Order_product object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Order_product orderProd) {

		try {
			sql = connect.prepareStatement("DELETE FROM order_product WHERE id=?");

			sql.setInt(1, orderProd.getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
/*
 * Method to find all the product from a same order
 */
	
	public ArrayList<Order_product> findByOrderId(int id) {
		ArrayList<Order_product> orders = new ArrayList<>();
		
		try {
			sql = connect.prepareStatement("SELECT *,u.id as userId,ol.id as orderId, op.id as opId, p.id as prodId, p.price as prodPrice, op.price as opPrice FROM user u INNER JOIN"
					+ " order_list ol ON u.id = ol.id_user INNER JOIN order_product op ON ol.id = id_order INNER JOIN product p "
					+ "ON op.id_product=p.id INNER JOIN vat ON id_vat=vat.id LEFT JOIN product_discount pd ON p.id = pd.id_product LEFT JOIN"
					+ " discount d ON id_discount = d.id INNER JOIN status s ON s.id = id_status WHERE ol.id =?");
			sql.setInt(1, id);
			rs = sql.executeQuery();

			while (rs.next()) {
				VAT vat = new VAT(rs.getFloat("value"));
				Status status =new Status(rs.getString("status"));
				User user = new User();
				Product product = new Product(rs.getInt("prodId"),rs.getString("name"),rs.getString("reference"),vat);
				Order order = new Order(id,rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,status);
				Order_product orderProduct = new Order_product(rs.getInt("opId"),rs.getFloat("opPrice"),rs.getInt("quantity"),product,order);
				orders.add(orderProduct);
			}
			return orders;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	/*
	 * method to pick one specific product 
	 */
	@Override
	public Order_product findById(int id) {
		
		try {
			sql = connect.prepareStatement("SELECT *,u.id as userId,ol.id as orderId, op.id as opId, p.id as prodId,"
					+ " p.price as prodPrice, op.price as opPrice FROM user u INNER JOIN order_list ol ON u.id = ol.id_user"
					+ " INNER JOIN order_product op ON ol.id = id_order INNER JOIN product p ON op.id_product=p.id INNER JOIN"
					+ " vat ON id_vat=vat.id LEFT JOIN product_discount pd ON p.id = pd.id_product LEFT JOIN discount d ON id_discount"
					+ " = d.id INNER JOIN status s ON s.id = id_status WHERE op.id =?");
			sql.setInt(1, id);
			rs = sql.executeQuery();

			if (rs.next()) {
				VAT vat = new VAT(rs.getFloat("value"));
				Status status =new Status(rs.getString("status"));
				User user = new User();
				Product product = new Product(rs.getInt("prodId"),rs.getString("name"),rs.getString("reference"),vat);
				Order order = new Order(id,rs.getDate("dateOrder"),rs.getFloat("totalPrice"),rs.getString("paymentToken"),rs.getString("trackingNumber"),user,status);
				Order_product orderProduct = new Order_product(id,rs.getFloat("opPrice"),rs.getInt("quantity"),product,order);
				
				return orderProduct;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
}
