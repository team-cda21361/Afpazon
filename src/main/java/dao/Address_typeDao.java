package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.Address_type;
import beans.Role;
import beans.User;
import connector.DBConnect;

public class Address_typeDao implements IDAO<Address_type> {
	
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql = null;
	ResultSet rs = null;

	@Override
	public boolean create(Address_type object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Address_type> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Address_type object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Address_type object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Address_type findByName(String name) {
		try {

			sql = connect
					.prepareStatement("SELECT * FROM `address_type` WHERE type=?");
			sql.setString(1, name);
			rs = sql.executeQuery();

			if (rs.next()) {
				return new Address_type(rs.getInt("Id"),rs.getString("type"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
