package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Discount;
import connector.DBConnect;

public class DiscountDao implements IDAO<Discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;
	@Override
	public boolean create(Discount discount) {

		try {
			sql = connect.prepareStatement("INSERT INTO discount (startDate,endDate,percent,voucher) VALUES (?,?,?,?");
					 
		
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
	public boolean update(Discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
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
}
