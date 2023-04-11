package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Discount;
import beans.Product;
import beans.Product_discount;
import beans.Review;
import beans.Role;
import beans.User;
import connector.DBConnect;

public class Product_discountDao implements IDAO<Product_discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;
	
	@Override
	public boolean create(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
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
	
	public Product_discount findByIdProd(int id) {
		Product_discount product_discount = null;

		try {
			sql = connect.prepareStatement("SELECT discount.id as 'iddiscount', discount.startDate, discount.endDate, discount.percent, discount.voucher, product_discount.id as 'product_discountid', product.id as 'idprod', product.name as 'nameprod', product.price  FROM discount "
					+ " INNER JOIN product_discount ON discount.id = product_discount.id_discount "
					+ " INNER JOIN product ON product_discount.id_product = product.id "
					+ " WHERE product.id=? and now() between discount.startDate and discount.endDate;");
			
			
			sql.setInt(1, id);
			System.out.println("findByIdProd: "+sql);
			
			rs = sql.executeQuery();
		
			
			if(rs.next()) {
	
				Product product = new Product();
				product.setId(rs.getInt("idprod"));
				product.setName(rs.getString("nameprod"));
				product.setPrice(rs.getFloat("price"));

				Discount discount = new Discount(rs.getInt("iddiscount"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getFloat("percent"), rs.getString("voucher"));
				product_discount = new Product_discount(rs.getInt("product_discountid"), product, discount);

				
			
			}
			return product_discount;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de inf...");
			
		}
		return product_discount;
	}
	

}
