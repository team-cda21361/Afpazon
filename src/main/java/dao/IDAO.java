package dao;

import java.util.ArrayList;

public interface IDAO<T> {
	
	public boolean create(T object);
	
	public ArrayList<T> read();
	
	public boolean update(T object);
	
	public boolean delete( T object);
	
	public Object findById (int id);
	
	

}
