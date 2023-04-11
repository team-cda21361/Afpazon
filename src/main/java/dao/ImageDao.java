package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Image;
import beans.Product;
import beans.VAT;
import connector.DBConnect;

public class ImageDao implements IDAO<Image> {
	
	Connection connect = DBConnect.getConnect();
	PreparedStatement sql; 
	ResultSet rs;

	@Override
	public boolean create(Image image) {
		System.out.println("Dans image : "+ image.getPicPath());
		System.out.println("Dans image : "+ image.getId());
		
		try {
			sql = connect.prepareStatement("INSERT INTO image (picPath, id_product) VALUES (?, ?)");
			sql.setString(1, image.getPicPath());
			sql.setInt(2, image.getId());
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Image> read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Image object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Image object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(int id) {
		// TODO Auto-generated method stub
		
		return null;
	}
	
	public ArrayList<Image> findImagesById(int id) {
		ArrayList<Image> listImages = new ArrayList<>();
		
		try {
			sql = connect.prepareStatement("SELECT * FROM image where id_product=?");
			sql.setInt(1, id);
			rs = sql.executeQuery();
			System.out.println("REALIZA LA CONSULTA");
			
			while(rs.next()) {
				Image image = new Image(rs.getString("picPath"),rs.getInt("id"));

				listImages.add(image);
			
			}
			return listImages;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Pas de liste de PRODUCTs...");
		}
		return listImages;
	}
	

}
