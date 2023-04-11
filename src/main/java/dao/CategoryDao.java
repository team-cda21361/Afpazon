package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.Category;
import connector.DBConnect;

public class CategoryDao implements IDAO<Category> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;
	Category category = new Category();
	public static ArrayList<Category> activeCategories = new ArrayList<>();
	
	@Override
	public boolean create(Category category) {
		try {
			sql = connect.prepareStatement("INSERT INTO category (category, isActive) VALUES (?, ?)");
			sql.setString(1, category.getCategory());
			sql.setBoolean(2, true);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Category> read() {
		ArrayList<Category> listeCategory =new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM category");
			rs = sql.executeQuery();
			while(rs.next()) {
				category = new Category(rs.getInt("id"), rs.getString("category"), rs.getBoolean("isActive"));
				listeCategory.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listeCategory;
	}
	
	public void readActives() {
		activeCategories.clear();
		try {
			sql = connect.prepareStatement("SELECT * FROM category WHERE isActive = 1");
			rs = sql.executeQuery();
			while (rs.next()) {
				activeCategories.add(new Category(rs.getInt("id"), rs.getString("category"), rs.getBoolean("isActive")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void injectCategories(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		CategoryDao categoryDao = new CategoryDao();
		categoryDao.readActives();
		session.setAttribute("categoriesList", activeCategories);

	}

	@Override
	public boolean update(Category category) {
		try {
			sql = connect.prepareStatement("UPDATE category SET category = ?, isActive = ? WHERE id = ?");
			sql.setString(1, category.getCategory());
			sql.setBoolean(2, category.isActive());
			sql.setInt(3, category.getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Category category) {
		try {			
			sql = connect.prepareStatement("DELETE FROM category WHERE id = ?");	
			sql.setInt(1, category.getId());
			sql.execute();
			return true;
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return false;
	}
	
	public boolean changeCategoryStatus(Category category) {
		try {			
			sql = connect.prepareStatement("UPDATE category SET isActive = ? WHERE id = ?");	
			sql.setBoolean(1, category.isActive());
			sql.setInt(2, category.getId());
			sql.execute();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Category findById(int id) {
		try {
			sql = connect.prepareStatement("SELECT * FROM category WHERE id = ?");
			sql.setInt(1, id);
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
