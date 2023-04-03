package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Product;
import beans.Stock;
import beans.VAT;
import connector.DBConnect;

public class StockDao implements IDAO<Stock>{
	
	//****************** INSTANTIATION ***************************************************************************

		Connection connect = DBConnect.getConnect();
		PreparedStatement sql; 
		ResultSet rs;
		
	@Override
	public boolean create(Stock object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Stock> read() {
		ArrayList<Stock> listStock = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT *,s.id as idStock,p.id as idProd FROM stock s INNER JOIN product p ON s.id_product = p.id"
					+ " INNER JOIN vat ON p.id_vat = vat.id");
			rs = sql.executeQuery();

			while(rs.next()) {
				Product product = new Product(rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
				

				listStock.add(new Stock(rs.getInt("idStock"),rs.getInt("quantity"),product));
				System.out.println("Liste de Stock ok !!!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return listStock;
	}

	@Override
	public boolean update(Stock object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Stock object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
