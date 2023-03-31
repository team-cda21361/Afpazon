package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Category;
import connector.DBConnect;

public class CategoryDao implements IDAO<Category> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;
	Category category = new Category();
	
	@Override
	public boolean create(Category category) {
		try {
			sql = connect.prepareStatement("INSERT INTO category(category,isActive VALUES (?,?)");
			sql.setString(1, category.getCategory());
			sql.setBoolean(2, category.isActive());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Category> read() {
		ArrayList<Category> listategory =new ArrayList<>();
		try {
			//Recup de tous les informations des category 
			sql =  connect.prepareStatement("SELECT * FROM category");
			//RS: stock le resultat de la requete SQL
			rs = sql.executeQuery();
			//Boucle sur chaque elt trouv� dans le ResultSet - equivalent de Foreach
			while(rs.next()) {
				category = new Category(rs.getInt("id"),rs.getString("category"),rs.getBoolean("isActive"));
				//Ajout de l'element instanci�e au dessus dans la liste 
				listategory.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category ajout�s dans la liste
		System.out.println(listategory);
		return listategory;
	}

	@Override
	public boolean update(Category category) {
		try {
			sql = connect.prepareStatement("UPDATE category SET category =?, isActive=?  WHERE id=?");
			sql.setString(1,category.getCategory());
			sql.setBoolean(2,category.isActive());
			sql.setInt(3,category.getId());
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Category category) {
		try {			
			sql = connect.prepareStatement("DELETE FROM category WHERE id=?");	
			sql.setInt(1, category.getId());
			sql.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return false;

	}
	public boolean changeCategoryStatus(Category category) {
		try {			
			sql = connect.prepareStatement("Update   category set category=? , isActive=? WHERE id=?");	
			sql.setBoolean(1, category.isActive());
			sql.setInt(2, category.getId());
			System.out.println(sql);
			sql.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return false;
	}

	@Override
	public Object findById(int id) {
		try {
			sql = connect.prepareStatement("SELECT * FROM category "
					+ " WHERE id=?");
			sql.setInt(1,id);
			System.out.println(sql);
			 rs= sql.executeQuery();
			if(rs.next()) {
				category = new Category(rs.getInt("id"),rs.getString("category"),rs.getBoolean("isActive"));
				return category;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
