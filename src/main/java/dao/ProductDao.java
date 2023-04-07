package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.AddProductList;
import beans.Discount;
import beans.Product;
import beans.VAT;
import connector.DBConnect;

public class ProductDao implements IDAO<Product> {



//****************** INSTANTIATION ***************************************************************************

	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;

//****************** CREATE **********************************************************************************

	@Override
	public boolean create(Product product) {

		try {

			sql = connect.prepareStatement("INSERT INTO product"
					+ "(name,description,price,mainPicPath,videoPath,inCarousel,size,"
					+ "reference,color,weight,warranty,sponsoring,isActive,id_vat)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			sql.setString(1, product.getName());
			sql.setString(2, product.getDescription());
			sql.setFloat(3, product.getPrice());
			sql.setString(4, product.getMainPicPath());
			sql.setString(5, product.getVideoPath());
			sql.setBoolean(6, product.isInCarousel());
			sql.setString(7, product.getSize());
			sql.setString(8, product.getReference());
			sql.setString(9, product.getColor());
			sql.setFloat(10, product.getWeight());
			sql.setInt(11, product.getWarranty());
			sql.setInt(12, product.getSponsoring());
			sql.setBoolean(13, product.isActive());
			sql.setInt(14, product.getVat().getId());

			sql.execute();
			System.out.println("Insertion de PRODUCT fait !!!");
			return true;

		}catch(SQLException e) {
			e.printStackTrace();
			System.err.println("Pas d'insertion de PRODUCT...");
		}
		return false;
	}

//****************** READ ************************************************************************************

	@Override
	public ArrayList<Product> read() {
		ArrayList<Product> listProducts = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM product INNER JOIN vat ON product.id_vat = vat.id");
			rs = sql.executeQuery();

			while(rs.next()) {
				Product product = new Product(rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));

				listProducts.add(product);
				System.out.println(rs.getBoolean("isActive"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return listProducts;
	}

//****************** UPDATE **********************************************************************************

	@Override
	public boolean update(Product product) {

		try {

			sql = connect.prepareStatement("UPDATE product SET name=?, description=?, price=?, mainPicPath=?, "
					+ "videoPath=?, inCarousel=?, size=?, reference=?, color=?, weight=?, warranty=?, "
					+ "sponsoring=?, isActive=?, id_vat=? WHERE id=?");

			sql.setString(1, product.getName());
			sql.setString(2, product.getDescription());
			sql.setFloat(3, product.getPrice());
			sql.setString(4, product.getMainPicPath());
			sql.setString(5, product.getVideoPath());
			sql.setBoolean(6, product.isInCarousel());
			sql.setString(7, product.getSize());
			sql.setString(8, product.getReference());
			sql.setString(9, product.getColor());
			sql.setFloat(10, product.getWeight());
			sql.setInt(11, product.getWarranty());
			sql.setInt(12, product.getSponsoring());
			sql.setBoolean(13, product.isActive());
			sql.setInt(14, product.getVat().getId());
			sql.setInt(15, product.getId());

			sql.execute();
			System.out.println("Modification de PRODUCT fait !!!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de modification de PRODUCT...");
		}
		return false;
	}

//****************** DELETE **********************************************************************************

	@Override
	public boolean delete(Product product) {
		return false;
	}
	
//****************** ACTIVATE/DESACTIVATE ********************************************************************
	
	public boolean changeProductStatus(Product product) {
		try {
			sql = connect.prepareStatement("UPDATE product SET isActive=? WHERE id=?");

			sql.setBoolean(1, product.isActive());
			sql.setInt(2, product.getId());
			sql.execute();
			
			System.out.println("Archive de PRODUCT fait !!!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas d'archive de PRODUCT...");
		}
		return false;
	}

	
	
//****************** FINDBY **********************************************************************************

	@Override
	public Product findById(int id) {
		Product product = new Product();

		try {
			sql = connect.prepareStatement("SELECT * FROM product INNER JOIN vat "
					+ "ON product.id_vat = vat.id WHERE product.id=?");

			sql.setInt(1,id);

			System.out.println("sql id prod: "+sql);
			ResultSet rs= sql.executeQuery();

			if(rs.next()) {
				product = new Product(rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));

				System.out.println("FindById PRODUCT OK !!!");
				return product;

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("FindById PRODUCT NOK...");
		}
		return product;
	}
	
	
	
	public ArrayList<Product> findProdCarousel() {
		ArrayList<Product> listProducts = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM product INNER JOIN vat  ON product.id_vat = vat.id WHERE inCarousel=1");
			rs = sql.executeQuery();
			System.out.println("REALIZA LA CONSULTA");
			
			while(rs.next()) {
				Product product = new Product(rs.getInt("id"), rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));

				listProducts.add(product);
			
			}
			return listProducts;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return listProducts;
	}
	
	//************************************Find by reference*******************************//
	
	public Product findByRef(String reference) {
		try {
			sql = connect.prepareStatement("SELECT * FROM product INNER JOIN vat "
					+ "ON product.id_vat = vat.id WHERE product.reference=?");
			sql.setString(1,reference);
			 rs= sql.executeQuery();
			if(rs.next()) {
			return new Product(rs.getInt("id"),rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//************************************Read By category for discount list table*******************************//
	public ArrayList<Product> readByCategory(ArrayList<Product> list, int catId) {
		try {
			sql = connect.prepareStatement("SELECT *, p.id as idProd FROM category c INNER JOIN category_product  cp ON c.id = id_category INNER JOIN product "
					+ "p ON p.id = id_product INNER JOIN vat v ON v.id = id_vat WHERE c.id = ?");
			sql.setInt(1, catId);
			rs = sql.executeQuery();

			while(rs.next()) {
				Product product = new Product(rs.getInt("idProd"),rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
				
				if (!new AddProductList().isExist(list, product.getId())) {
					
					list.add(product);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return list;
	}
}
