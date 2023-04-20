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
			sql = connect.prepareStatement(
					"INSERT INTO address (address,zipCode,city,id_user,id_address_type) VALUES (?,?,?,?,?)");
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
	
	public boolean create_ledger(Address address) {
		try {
			sql = connect.prepareStatement(
					"INSERT INTO address_ledger (address,zipCode,city) VALUES (?,?,?)");
			sql.setString(1, address.getAddress());
			sql.setInt(2, address.getZipCode());
			sql.setString(3, address.getCity());
			System.out.println("SQL create_ledger: "+sql);
			sql.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public int lastId() {
		int id = 0;
		try {
			/*
			 * VERSION AVEC BCRYPT
			 */
			sql = connect.prepareStatement("select last_insert_id() as 'last' from address_ledger"); // test@test.fr
	
			System.out.println("sql LASTIF ADRESS :"+sql);
			rs = sql.executeQuery();

			if (rs.next()) {
					return id = (rs.getInt("last"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public ArrayList<Address> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Address address) {
		try {
			sql = connect
					.prepareStatement("UPDATE address SET address=?, zipCode=?, city=?, id_address_type=? WHERE id=?");
			sql.setString(1, address.getAddress());
			sql.setInt(2, address.getZipCode());
			sql.setString(3, address.getCity());
			sql.setInt(4, address.getAddress_type().getId());
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
		try {			
			sql = connect.prepareStatement("DELETE FROM address WHERE id = ?");	
			sql.setInt(1, address.getId());
			sql.execute();
			return true;
		}catch(Exception e) {
			e.printStackTrace();		
		}
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
		currentUser.setId(id);
		
		try {
			sql = connect.prepareStatement(
					"SELECT *,a.id as idType FROM address INNER JOIN user u ON u.id =id_user INNER JOIN address_type a ON a.id = id_address_type WHERE u.id=?");
			sql.setInt(1, id);
			rs = sql.executeQuery();
      currentUser.setId(id);
			while (rs.next()) {
				Address_type addressType = new Address_type(rs.getInt("idType"), rs.getString("type"));
				list.add(new Address(rs.getInt("id"), rs.getString("address"), rs.getInt("zipCode"),
						rs.getString("city"), currentUser, addressType));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return list;

	}
	
	public Address readByIdAdresseFacturation(int id){
		User currentUser = new User();
		currentUser.setId(id);
		Address adresse = null;
		try {
			sql = connect.prepareStatement(
					"SELECT *,a.id as idType FROM address INNER JOIN user u ON u.id =id_user INNER JOIN address_type a ON a.id = id_address_type WHERE u.id=? AND a.type='facturation' LIMIT 1");
			sql.setInt(1, id);
			rs = sql.executeQuery();
      currentUser.setId(id);
			if(rs.next()) {
				Address_type addressType = new Address_type(rs.getInt("idType"), rs.getString("type"));
				adresse = new Address(rs.getInt("id"), rs.getString("address"), rs.getInt("zipCode"),
						rs.getString("city"), currentUser, addressType);
				return adresse;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return adresse;

	}
	
	public Address readByIdAdresseId(int id){
		User currentUser = new User();
		currentUser.setId(id);
		Address adresse = null;
		try {
			sql = connect.prepareStatement(
					"SELECT *,a.id as idType FROM address INNER JOIN user u ON u.id =id_user INNER JOIN address_type a ON a.id = id_address_type WHERE address.id=? ");
			sql.setInt(1, id);
			System.out.println("SQL readByIdAdresseId: "+sql);
			rs = sql.executeQuery();
      currentUser.setId(id);
			if(rs.next()) {
				Address_type addressType = new Address_type(rs.getInt("idType"), rs.getString("type"));
				adresse = new Address(rs.getInt("id"), rs.getString("address"), rs.getInt("zipCode"),
						rs.getString("city"), currentUser, addressType);
				return adresse;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return adresse;

	}

}
