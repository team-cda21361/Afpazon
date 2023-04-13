package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Product;
import beans.Review;
import beans.Role;
import beans.User;
import connector.DBConnect;

public class ReviewDao implements IDAO<Review> {

	Connection connect = DBConnect.getConnect();
	PreparedStatement sql;
	ResultSet rs;

	@Override
	public boolean create(Review review) {
		try {
			sql = connect.prepareStatement("INSERT INTO review (content,stars,id_product,id_user) VALUES (?,?,?,?)");
		
			sql.setString(1, review.getContent());
			sql.setInt(2, review.getStars());
			sql.setInt(3, review.getProduct().getId());
			sql.setInt(4, review.getUser().getId());

			sql.execute();

			return true;
		} catch (Exception e) {
			System.out.println("Insertion KO");
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<Review> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Review review) {
		try {
			sql=connect.prepareStatement("UPDATE review SET content=?, stars=?  WHERE id=?");
			sql.setString(1, review.getContent());
			sql.setInt(2, review.getStars());
			sql.setInt(3, review.getId());
			
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Review review) {
		try {
			sql = connect.prepareStatement("DELETE from review WHERE id =?");
			sql.setInt(1, review.getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Review findById(int id) {
        try {
            sql = connect.prepareStatement("SELECT review.id as 'idreviw', review.content, review.stars, review.id_product, review.id_user, "
                    + " user.id as 'iduser', user.lastName, user.firstName, "
                    + " user.email, user.gender, user.phone, user.registrationDate, user.isActive, user.id_role, role.id as 'idrole', role.role , "
                    + " product.id as 'idprod', product.name as 'nameprod'"
                    + " FROM review "
                    + " INNER JOIN user ON review.id_user = user.id "
                    + " INNER JOIN product ON review.id_product = product.id "
                    + " INNER JOIN role ON role.id = user.id_role WHERE review.id=? ");

            sql.setInt(1, id);

            rs = sql.executeQuery();

            if(rs.next()) {

                Product product = new Product();
                product.setId(rs.getInt("idprod"));
                product.setName(rs.getString("nameprod"));

                Role role = new Role(rs.getInt("idrole"), rs.getString("role"));
                User user = new User(rs.getInt("iduser"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("email"), rs.getString("gender"), 
                		rs.getString("phone"), rs.getDate("registrationDate"), rs.getBoolean("isActive"), role);
                Review review = new Review(rs.getInt("idreviw"), rs.getString("content"), rs.getInt("stars"), product, user);

                return review;

            }


        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Pas de liste de PRODUCTs...");
        }
        return null;
	}
	
	public int findByIdT(int id) {
		// TODO Auto-generated method stub
		int total = 0;
		try {
			sql = connect.prepareStatement("SELECT COUNT(review.id) as total FROM review  "
					+ " INNER JOIN user ON review.id_user = user.id  "
					+ " INNER JOIN product ON review.id_product = product.id  "
					+ " INNER JOIN role ON role.id = user.id_role "
					+ " WHERE review.id_product=?");
			
			sql.setInt(1, id);
			System.out.println("findByIdPT: "+sql);
			
			rs = sql.executeQuery();
			System.out.println("SQL Reviw: ");
			
			if(rs.next()) {
	
			total = rs.getInt("total");
			
			}
			return total;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
			
		}
		return total;
	}
	
	
	public ArrayList<Review> findByIdProd(int id) {

		ArrayList<Review> listReviews = new ArrayList<>();

		try {
			sql = connect.prepareStatement("SELECT review.id as 'idreviw', review.content, review.stars, review.id_product, review.id_user, "
					+ " user.id as 'iduser', user.lastName, user.firstName, "
					+ " user.email, user.gender, user.phone, user.registrationDate, user.isActive, user.id_role, role.id as 'idrole', role.role , "
					+ " product.id as 'idprod', product.name as 'nameprod'"
					+ " FROM review "
					+ " INNER JOIN user ON review.id_user = user.id "
					+ " INNER JOIN product ON review.id_product = product.id "
					+ " INNER JOIN role ON role.id = user.id_role WHERE review.id_product=? ORDER BY review.id DESC");
			
			sql.setInt(1, id);
			System.out.println("findByIdProd: "+sql);
			
			rs = sql.executeQuery();
			System.out.println("SQL Reviw: ");
			
			while(rs.next()) {
	
				Product product = new Product();
				product.setId(rs.getInt("idprod"));
				product.setName(rs.getString("nameprod"));
				
				Role role = new Role(rs.getInt("idrole"), rs.getString("role"));
				User user = new User(rs.getInt("iduser"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("email"), rs.getString("gender"), rs.getString("phone"), rs.getDate("registrationDate"), rs.getBoolean("isActive"), role);
				Review review = new Review(rs.getInt("idreviw"), rs.getString("content"), rs.getInt("stars"), product, user);

				listReviews.add(review);
			
			}
			return listReviews;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
			
		}
		return listReviews;
	}
	
	public Review findUserReviewForProduct(User user, Product product) {
		try {
			sql = connect.prepareStatement("SELECT * FROM review WHERE id_user = ? AND id_product = ?");
			
			sql.setInt(1, user.getId());
			sql.setInt(2, product.getId());
			rs = sql.executeQuery();
			
			if (rs.next()) {
				return new Review(rs.getInt("id"), rs.getString("content"), rs.getInt("stars"), product, user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
