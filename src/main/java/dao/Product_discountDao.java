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
import beans.Review;
import beans.Role;
import beans.User;
import connector.DBConnect;

public class Product_discountDao implements IDAO<Product_discount> {
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;

	@Override
	public boolean create(Product_discount object) {
		try {
			sql = connect.prepareStatement("INSERT INTO product_discount(id_product,id_discount) VALUES (?,?)");
			sql.setInt(1, object.getProduct().getId());
			sql.setInt(2, object.getDiscount().getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
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
	
	

	public Product_discount findByIdProd(int id) {
		Product_discount product_discount = null;

		try {
			sql = connect.prepareStatement("SELECT discount.id as 'iddiscount', discount.startDate, discount.endDate, discount.percent, discount.voucher, product_discount.id as 'product_discountid', product.id as 'idprod', product.name as 'nameprod', product.price  FROM discount "
					+ " INNER JOIN product_discount ON discount.id = product_discount.id_discount "
					+ " INNER JOIN product ON product_discount.id_product = product.id "
					+ " WHERE product.id=? and now() between discount.startDate and discount.endDate;");
			
			
			sql.setInt(1, id);
			System.out.println("findByIdProd: "+sql);
			
			rs = sql.executeQuery();
		
			
			if(rs.next()) {
	
				Product product = new Product();
				product.setId(rs.getInt("idprod"));
				product.setName(rs.getString("nameprod"));
				product.setPrice(rs.getFloat("price"));

				Discount discount = new Discount(rs.getInt("iddiscount"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getFloat("percent"), rs.getString("voucher"));
				product_discount = new Product_discount(rs.getInt("product_discountid"), product, discount);

				
			
			}
			return product_discount;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de inf...");
			
		}
		return product_discount;
	}
	
	public ArrayList <Discount> findDiscountsByProductId(int product_id) {
		ArrayList <Discount>  discounts = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select *, discount.id as discountId from product inner join product_discount on product.id = product_discount.id_product inner join discount on product_discount.id_discount= discount.id WHERE id_product = ? order by discount.startDate");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				discounts.add(new Discount(rs.getInt("discountId"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return  discounts;	
	}
	
	public ArrayList <Discount> findDiscountsNotInPorductByProductId(int product_id) {
		ArrayList <Discount>  discounts = new ArrayList<>();
		
		try {
			 sql =  connect.prepareStatement("select * from discount where id not in (select distinct id_discount from product_discount where id_product = ?) order by discount.startDate");
			 sql.setInt(1,product_id);
			 rs = sql.executeQuery();
			while(rs.next()) {
				discounts.add(new Discount(rs.getInt("id"),rs.getDate("startDate"),rs.getDate("endDate"),rs.getFloat("percent"),rs.getString("voucher")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Retourne la liste des category_product 
		return  discounts;	
	}
	
	public boolean deleteDiscountFromProductById(int idDiscount,int idProduct) {
		try {
			 sql =  connect.prepareStatement("delete from product_discount where id_product=? and id_discount=?");
			 sql.setInt(1,idProduct);
			 sql.setInt(2, idDiscount);
			 sql.execute();
			 return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}
	
	public boolean addDiscountToProductById(int idDiscount,int idProduct) {
		try {
			 sql =  connect.prepareStatement("insert into product_discount (id_product,id_discount) values (?,?)");
			 sql.setInt(1,idProduct);
			 sql.setInt(2, idDiscount);
			 sql.execute();
			 return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}
	public Product_discount findProdByIdDiscount(int id) {
		Product_discount product_discount = null;

		try {
			sql = connect.prepareStatement("SELECT discount.id as 'iddiscount', discount.startDate, discount.endDate, discount.percent, discount.voucher, product_discount.id as 'product_discountid', product.id as 'idprod', product.name as 'nameprod', product.price  FROM discount "
					+ " INNER JOIN product_discount ON discount.id = product_discount.id_discount "
					+ " INNER JOIN product ON product_discount.id_product = product.id "
					+ " WHERE product.id=? and now() between discount.startDate and discount.endDate;");
			
			
			sql.setInt(1, id);
			System.out.println("findByIdProd: "+sql);
			
			rs = sql.executeQuery();
		
			
			if(rs.next()) {
	
				Product product = new Product();
				product.setId(rs.getInt("idprod"));
				product.setName(rs.getString("nameprod"));
				product.setPrice(rs.getFloat("price"));

				Discount discount = new Discount(rs.getInt("iddiscount"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getFloat("percent"), rs.getString("voucher"));
				product_discount = new Product_discount(rs.getInt("product_discountid"), product, discount);

				
			
			}
			return product_discount;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de inf...");
			
		}
		return product_discount;
	}
}
