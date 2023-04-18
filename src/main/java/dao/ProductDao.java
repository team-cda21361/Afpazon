package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.AddProductList;
import beans.Category;
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
		
		System.out.println("Dans Dao : " + product.getVideoPath());
		System.out.println("Dans Dao : " + product.getId());

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
			sql = connect.prepareStatement("SELECT *, product.id as idProd FROM product INNER JOIN vat "
					+ "ON product.id_vat = vat.id WHERE product.id=?");
			sql.setInt(1,id);

			ResultSet rs= sql.executeQuery();

			if(rs.next()) {
				product = new Product(rs.getInt("idProd"),rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));

				return product;

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("FindById PRODUCT NOK...");
		}
		return product;
	}
	
	
//****************** FINDBY CAROUSEL **********************************************************************************
	
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
	public ArrayList<Product> findNewProdCarousel() {
		ArrayList<Product> listNewProducts = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT * FROM product INNER JOIN vat  ON product.id_vat = vat.id ORDER BY product.id ASC LIMIT 10");
			rs = sql.executeQuery();
			System.out.println("REAL LA CONSULTA");
			
			while(rs.next()) {
				Product product = new Product(rs.getInt("id"), rs.getString("name"),rs.getString("description"),
						rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
						rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
						rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
						rs.getInt("sponsoring"),rs.getBoolean("isActive"),
						new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
				
				listNewProducts.add(product);
				
			}
			return listNewProducts;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return listNewProducts;
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
	
	//****************** READWARRANTY **********************************************************************************
	
	public ArrayList<Integer> readWarranty() {
		ArrayList<Integer> listWarranties = new ArrayList<>();
		try {
			sql = connect.prepareStatement("SELECT DISTINCT warranty FROM product ORDER BY warranty");
			rs = sql.executeQuery();

			while(rs.next()) {
				listWarranties.add(rs.getInt("warranty"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listWarranties;
	}
	//****************** FINDBYID discount **********************************************************************************//

		public Product findByIdDiscount(int id) {
			Product product = new Product();

			try {
				sql = connect.prepareStatement("SELECT *, product.id as 'idProd' "
						+ " FROM product "
						+ " INNER JOIN product_discount ON product.id = product_discount.id_product "
						+ " INNER JOIN discount ON product_discount.id_discount = discount.id "
						+ " INNER JOIN vat ON product.id_vat = vat.id "
						+ " WHERE product.id=? AND now() between discount.startDate and discount.endDate AND discount.voucher IS NULL");
				sql.setInt(1,id);
				System.out.println("SQL DEMANDE SI DESCOUNT 1: "+sql);

				ResultSet rs= sql.executeQuery();

				if(rs.next()) {
					product = new Product(rs.getInt("idProd"),rs.getString("name"),rs.getString("description"),
							rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
							rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
							rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
							rs.getInt("sponsoring"),rs.getBoolean("isActive"),
							new VAT(rs.getInt("id_vat"),rs.getFloat("value")));

					return product;

				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("FindByIdDiscount PRODUCT NOK...");
			}
			return product;
		}
		
		//****************** FINDBYID categorie de Product **********************************************************************************//
		public Category findByIdCategoriedeProd(int id) {
			Category category = new Category();

			try {
				sql = connect.prepareStatement("SELECT category.id, category.category, category.isActive FROM category_product INNER JOIN category ON category_product.id_category = category.id  WHERE id_product=? AND category.isActive=1 LIMIT 1");
				sql.setInt(1,id);
				System.out.println("SQL category: "+sql);

				ResultSet rs= sql.executeQuery();

				if(rs.next()) {
					category = new Category(rs.getInt("id"),rs.getString("category"),rs.getBoolean("isActive"));
					return category;

				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("FindByIdDiscount PRODUCT NOK...");
			}
			return category;
		}
		
		
		//****************** FINDBYID categorie **********************************************************************************//
		public int findByIdStock(int id) {
			int stock = 0;

			try {
				sql = connect.prepareStatement("SELECT * FROM stock WHERE id_product=?");
				sql.setInt(1,id);
				System.out.println("SQL stock: "+sql);

				ResultSet rs= sql.executeQuery();

				if(rs.next()) {
					stock = (rs.getInt("quantity"));

					return stock;

				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("FindByIdDiscount PRODUCT NOK...");
			}
			return stock;
		}
		
}


