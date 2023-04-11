package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Role;
import connector.DBConnect;

public class RoleDao implements IDAO<Role>{
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql = null;
	ResultSet rs = null;
	@Override
	public boolean create(Role object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Role> read() {
		ArrayList<Role> list=new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM role");
			rs=sql.executeQuery();
			while (rs.next()) {
				list.add(new Role(rs.getInt("id"),rs.getString("role")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean update(Role object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Role object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	/*
	 * 
	 */
	public Role findByName(String roleName) {
		Role role=null;
		try {
			sql = connect.prepareStatement("SELECT * FROM role WHERE role=?");
			sql.setString(1, roleName);
			rs=sql.executeQuery();
			if (rs.next()) {
				role= (new Role(rs.getInt("id"),rs.getString("role")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return role;
	}

}
