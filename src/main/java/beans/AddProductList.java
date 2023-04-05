package beans;

import java.util.ArrayList;

public class AddProductList {

	public boolean isExist(ArrayList<Product> list,int id) {
		for (Product product : list) {
			if (product.getId()==id) {
				return true;
			}
		}
		return false;
		
	} 
	public boolean delete(ArrayList<Product> list,int id) {
		for (Product product : list) {
			if (product.getId()==id) {
				list.remove(product);
				return true;
			}
		}
		return false;
		
	} 
}
