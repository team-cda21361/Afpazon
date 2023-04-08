package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Category;
import beans.Discount;
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
	
	public ArrayList <Discount> findDiscountsByProductId(int product_id) {
		ArrayList <Discount>  discounts = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select *, discount.id as discountId from product inner join product_discount on product.id = product_discount.id_product inner join discount on product_discount.id_discount= discount.id WHERE id_product = ? order by discount.startDate");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				discounts.add(new Discount(rs.getInt("discountId"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return  discounts;	
	}
	
	public ArrayList <Discount> findDiscountsNotInPorductByProductId(int product_id) {
		ArrayList <Discount>  discounts = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select * from discount where id not in (select distinct id_discount from product_discount where id_product = ?) order by discount.startDate");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				discounts.add(new Discount(rs.getInt("id"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return  discounts;	
	}
	
	public boolean deleteDiscountFromProductById(int idDiscount,int idProduct) {
		try {
			 sql =  connect.prepareStatement("delete from product_discount where id_product=? and id_discount=?");
			 sql.setInt(1,idProduct);
			 sql.setInt(2, idDiscount);
			 sql.execute();
			 return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}
	
}
