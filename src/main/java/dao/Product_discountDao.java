package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Discount;
import beans.Product;
import beans.Product_discount;
import beans.VAT;
import connector.DBConnect;

public class Product_discountDao implements IDAO<Product_discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;
	@Override
	public boolean create(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Product_discount> read() {
		return null;
	}
	@Override
	public boolean update(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Product_discount object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<Product_discount> findProdDiscountSponsoring() {
		ArrayList<Product_discount> listProductDiscounts= new ArrayList<>();
			try {
				sql = connect.prepareStatement("SELECT *\r\n"
						+ "FROM product p\r\n"
						+ "join vat on p.id_vat = vat.id\r\n"
						+ "ORDER BY p.sponsoring DESC limit 5;");
				rs = sql.executeQuery();
				System.out.println("Executing Discount sponsored products query...");
				
				while(rs.next()) {
					Product product = new Product(rs.getInt("id"), rs.getString("name"),rs.getString("description"),
							rs.getFloat("price"),rs.getString("mainPicPath"),rs.getString("videoPath"),
							rs.getBoolean("inCarousel"),rs.getString("size"),rs.getString("reference"),
							rs.getString("color"),rs.getFloat("weight"),rs.getInt("warranty"),
							rs.getInt("sponsoring"),rs.getBoolean("isActive"),
							new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
					
					Discount discount =new Discount();
					
					Product_discount products_discount = new Product_discount(rs.getInt("id"),product,discount);

					listProductDiscounts.add(products_discount);
				System.out.println(listProductDiscounts);
				}
				return listProductDiscounts;
				
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("Pas de liste de PRODUCTs...Discount");
			}
			return listProductDiscounts;
		}
	
	public ArrayList<Product_discount> findSponsoredProducts() {
	    ArrayList<Product_discount> listSponsoredProducts = new ArrayList<>();
	    try {
	        sql = connect.prepareStatement("SELECT * FROM product_discount pd JOIN product p ON pd.id_product = p.id JOIN discount d ON pd.id_discount = d.id JOIN vat ON p.id_vat = vat.id WHERE p.sponsoring IS NOT NULL ORDER BY d.percent DESC;");
	        rs = sql.executeQuery();
	        System.out.println("Executing sponsored products query...");
	        
	        while(rs.next()) {
	            Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("description"),
	                    rs.getFloat("price"), rs.getString("mainPicPath"), rs.getString("videoPath"),
	                    rs.getBoolean("inCarousel"), rs.getString("size"), rs.getString("reference"),
	                    rs.getString("color"), rs.getFloat("weight"), rs.getInt("warranty"),
	                    rs.getInt("sponsoring"), rs.getBoolean("isActive"),
	                    new VAT(rs.getInt("id_vat"),rs.getFloat("value")));
	            
	            Discount discount = new Discount(rs.getInt("id"),rs.getDate("startDate"), rs.getDate("endDate"), rs.getFloat("percent"),rs.getString("voucher"));
	        	Product_discount productsDiscount = new Product_discount(rs.getInt("id"),product,discount);
	            listSponsoredProducts.add(productsDiscount);
	            
	        }
	        return listSponsoredProducts;
	        
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.err.println("Failed to retrieve sponsored products.");
	    }
	    return listSponsoredProducts;
	}
	
	

}
