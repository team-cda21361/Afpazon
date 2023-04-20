package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Category;
import beans.Discount;
import connector.DBConnect;

public class DiscountDao implements IDAO<Discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;
	@Override
	public boolean create(Discount discount) {

		try {
			sql = connect.prepareStatement("INSERT INTO discount (startDate,endDate,percent,voucher) VALUES (?,?,?,?)");
					 
		
			sql.setDate(1, discount.getStartDate());
			sql.setDate(2, discount.getEndDate());
			sql.setFloat(3, discount.getPercent());
			sql.setString(4, discount.getVoucher());
		

			sql.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println("Insertion KO");
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<Discount> read() {
		ArrayList<Discount> listStock = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM  discount ORDER BY startDate desc");
			rs = sql.executeQuery();

			while(rs.next()) {
			
				listStock.add(new Discount(rs.getInt("id"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
				//System.out.println("Liste de discount ok !!!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de discount...");
		}
		return listStock;
	}

	@Override
	public boolean update(Discount discount) {
		try {

			sql = connect.prepareStatement("UPDATE discount SET startDate=?, endDate=?, percent=?, voucher=?  WHERE id=?");

			sql.setDate(1, discount.getStartDate());
			sql.setDate(2, discount.getEndDate());
			sql.setFloat(3, discount.getPercent());
			sql.setString(4, discount.getVoucher());
			sql.setInt(5, discount.getId());
			

			sql.execute();
			System.out.println("Modification de PRODUCT fait !!!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de modification de PRODUCT...");
		}
		return false;
	}

	@Override
	public boolean delete(Discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		try {
			sql = connect.prepareStatement("SELECT * FROM discount "
					+ " WHERE id=?");
			sql.setInt(1,id);
			 rs= sql.executeQuery();
			if(rs.next()) {
				Discount discount = new Discount(rs.getInt("id"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher"));
				return discount;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Discount> search(String search) {
		ArrayList<Discount> listStock = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM  discount WHERE CONCAT(voucher, ' ', startDate, ' ', endDate) LIKE ? ORDER BY startDate desc");
			sql.setString(1, "%" +search+ "%");
			rs = sql.executeQuery();

			while(rs.next()) {
			
				listStock.add(new Discount(rs.getInt("id"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de discount...");
		}
		return listStock;
	}
	public int lastInsertId() {
		int id=0;
		try {
			sql = connect.prepareStatement("SELECT LAST_INSERT_ID(Id) as id from discount order by LAST_INSERT_ID(Id) desc limit 1");
			 rs= sql.executeQuery();
			if(rs.next()) {
				id=rs.getInt("id");
			}
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}
}
