package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.VAT;
import connector.DBConnect;

public class VATDao implements IDAO<VAT> {

	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;

	@Override
	public boolean create(VAT object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<VAT> read() {
		ArrayList<VAT> vats = new ArrayList<>();
		VAT vat = null;

		try {
			sql = connect.prepareStatement("SELECT * FROM vat");
			rs = sql.executeQuery();

			while (rs.next()) {
				vat = new VAT(rs.getInt("id"), rs.getFloat("value"));
				vats.add(vat);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vats;
	}

	@Override
	public boolean update(VAT object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(VAT object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}