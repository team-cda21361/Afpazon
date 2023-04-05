package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Product_discount;
import connector.DBConnect;

public class Product_discountDao implements IDAO<Product_discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;
	@Override
	public boolean create(Product_discount object) {
		try {
			sql = connect.prepareStatement("INSERT INTO product_discount(id_product,id_discount) VALUES (?,?)");
			sql.setInt(1, object.getProduct().getId());
			sql.setInt(2, object.getDiscount().getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Product_discount> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
