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
	
	
	public ArrayList <Category> findCategoriesByProductId(int product_id) {
		ArrayList <Category>  categories = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select * from product inner join category_product on product.id = category_product.id_product inner join category on category_product.id_category= category.id WHERE id_product = ? order by category");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				 categories.add(new Category(rs.getInt("id_category"),rs.getString("category"),rs.getBoolean("isActive")));
			}
			
			for (Category category :  categories) {
				System.out.println(category.isActive());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		//Retourne la liste des category_product 
		return  categories;	
	}
	
	public ArrayList <Category> findCategoriesNotInProductByProductId(int product_id) {
		ArrayList <Category>  categories = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select * from category where id NOT IN ( select distinct id_category from category_product where id_product = ?) order by category");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				 categories.add(new Category(rs.getInt("id"),rs.getString("category"),rs.getBoolean("isActive")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		//Retourne la liste des category_product 
		return  categories;	
	}
	
	public boolean deleteCategoryFromProductById(int idCategory,int idProduct) {
		try {
			 sql =  connect.prepareStatement("delete from category_product where id_product=? and id_category=?");
			 sql.setInt(1,idProduct);
			 sql.setInt(2, idCategory);
			 sql.execute();
			 return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}
	
	public boolean addCategoryToProductById(int idCategory,int idProduct) {
		try {
			 sql =  connect.prepareStatement("insert into category_product (id_product,id_category) values (?,?)");
			 sql.setInt(1,idProduct);
			 sql.setInt(2, idCategory);
			 sql.execute();
			 return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}
	
}
