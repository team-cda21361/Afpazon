package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Address;
import beans.Address_type;
import beans.User;
import connector.DBConnect;

public class AddressDao implements IDAO<Address> {
Connection connect = DBConnect.getConnect();
PreparedStatement sql = null;
ResultSet rs = null;

	@Override
	public boolean create(Address address) {
		try {
			sql=connect.prepareStatement("INSERT INTO address (address,zipCode,city,id_user,id_address_type) VALUES (?,?,?,?,?)");
			sql.setString(1, address.getAddress());
			sql.setInt(2, address.getZipCode());
			sql.setString(3, address.getCity());
			sql.setInt(4, address.getUser().getId());
			sql.setInt(5, address.getAddress_type().getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	

	@Override
	public ArrayList<Address> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Address address) {
		 try {
				sql = connect.prepareStatement("UPDATE address SET address=?, zipCode=?, city=?, id_address_type=? WHERE id=?");
				sql.setString(1, address.getAddress());
				sql.setInt(2, address.getZipCode());
				sql.setString(3, address.getCity());
				sql.setInt(4, address.getAddress_type().getId() );
				sql.setInt(5, address.getId());
				sql.execute();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
	}

	@Override
	public boolean delete(Address address) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<Address> readById(int id){
		ArrayList<Address> list =new ArrayList<>();
		
		User currentUser = new User();
		try {
			sql = connect.prepareStatement("SELECT *,a.id as idType FROM address INNER JOIN user u ON u.id =id_user INNER JOIN address_type a ON a.id = id_address_type WHERE u.id=?");
			sql.setInt(1, id);
			
			rs=sql.executeQuery();
			while (rs.next()) {
				currentUser.setId(id);
				Address_type addressType =new Address_type(rs.getInt("idType"),rs.getString("type"));
				list.add(new Address(rs.getInt("id"),rs.getString("address"),rs.getInt("zipCode"),rs.getString("city"),currentUser,addressType));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return list;
		
	}

}
