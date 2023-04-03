package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Category;
import beans.Category_product;
import beans.Product;
import connector.DBConnect;

public class Category_productDao implements IDAO<Category_product> {
	
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;
	Category category = new Category();
	Product product = new Product();

	@Override
	public boolean create(Category_product category_product) {
		try {
			PreparedStatement sql = connect.prepareStatement("INSERT INTO category_product(id_product,id_category)"
					+ " VALUES (?,?)");
			sql.setInt(1, category_product.getProduct().getId());
			sql.setInt(2, category_product.getCategory().getId());
			sql.execute();
			return true;	
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Category_product> read() {
ArrayList<Category_product> listCategoryProduct= new ArrayList<>();
		try {
			//Recup de tous les informations 
			 sql =  connect.prepareStatement("SELECT *,cp.id IDCP, product.id IDPD,category.id IDCAT FROM category_product cp "
					+ " INNER JOIN product p on cp.id_product = p.id "
					+ " INNER JOIN category c on cp.id_category = c.id");
			//RS: stock le resultat de la requete SQL
			 rs = sql.executeQuery();
			//Boucle sur chaque elt trouv� dans le ResultSet - equivalent de Foreach
			while(rs.next()) {
				product.setId(Integer.parseInt(null, rs.getInt("IDCP")));
				category.setId(Integer.parseInt(toString(), rs.getInt("IDCAT")));
				Category_product category_product = new Category_product(rs.getInt("IDCP"),product,category);
				//Ajout de l'element instanci�e au dessus dans la liste
				listCategoryProduct.add(category_product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return listCategoryProduct;
	}
	
	public ArrayList <Category_product> findProductByCategory(int id){
		ArrayList<Category_product> ListProductByCategory= new ArrayList<>();
		try {
			//Recup de tous les informations 
			 sql =  connect.prepareStatement("SELECT *,cp.id IDCP, product.id IDPD,c.id IDCAT FROM category_product cp "
					+ " INNER JOIN product p on cp.id_product = p.id "
					+ " INNER JOIN category c on cp.id_category = c.id "
					+ " WHERE c.id=?");
			 sql.setInt(1,id);
			//RS: stock le resultat de la requete SQL
			 rs = sql.executeQuery();
			//Boucle sur chaque elt trouv� dans le ResultSet - equivalent de Foreach
			while(rs.next()) {
				product.setId(rs.getInt("IDCP"));
				category.setId( rs.getInt("IDCAT"));
				Category_product category_product = new Category_product(rs.getInt("IDCP"),product,category);
				//Ajout de l'element instanci�e au dessus dans la liste
				ListProductByCategory.add(category_product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return ListProductByCategory;	
	}

	@Override
	public boolean update(Category_product category_product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Category_product category_product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
