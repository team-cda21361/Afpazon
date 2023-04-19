package beans;

import java.text.DecimalFormat;
import java.util.ArrayList;

import dao.Product_discountDao;


public class Cart{
    
    private ArrayList<Item> Items = new ArrayList<>();
    
    public ArrayList<Item> getItems() {
        return Items;
    }
    
    // CREATION DE LA LIST
        public void setItems(ArrayList<Item> items) {
        this.Items = items;
    }
        
        

    
 
        
        
    
    // AJOUT ELEMENT
    public boolean addItem(Item newItem) {
        for (Item item : Items) {
            if (item.getProduct().getId() == newItem.getProduct().getId()) {
                item.setQuantity(newItem.getQuantity() + item.getQuantity());
                return true;
            }
        }
        if (Items.add(newItem)) {
            return true;
        }
        return false;
    }
    
    public int countProduct() {
        int count = 0;
        for (Item item : Items) {
            count += item.getQuantity();
        }
        return count;
    }
    
    public double countPrixProduct() {
  
	    double count = 0;
		for (Item item : Items) {
		    count += item.getProduct().getPrice() * item.getQuantity();
		}
		return count;
	}
    
    public double countPrixProductApresRemise() {
    
	    double count = 0;
		for (Item item : Items) {
		    count += item.getPrixR() * item.getQuantity();
		}
		return count;
	}
    
    
	
	//ADD QTE 
	public boolean addQte(int idItem) {
		for(Item  item: Items) {
			
			if(item.getProduct().getId()==idItem) {
				item.setQuantity(item.getQuantity()+1);
				System.out.println("Quantite Add OK.");
				return true;
			}
		}
		return false;
	}
	//REMOVE QTE 
	public boolean removeQte(int idItem) {
		for(Item  item: Items) {
			
			if(item.getProduct().getId()==idItem) {
				if(item.getQuantity() <= 1) {
					item.setQuantity(1);
					System.out.println("Quantite removeQte OK NO POSIBLE. -1: ");
					return true;
				}else {
					item.setQuantity(item.getQuantity()-1);
					System.out.println("Quantite removeQte OK.");
					return true;
				}

			}
		}
		return false;
	}
	
   	
	
	private ArrayList<Discount> discounts = null;
	//RECHERCHE COUPON
    public boolean rechercheCoupon(String coupon) {
    	System.out.println("Llega al metodo: ");
    	Product_discountDao product_discountDao = new Product_discountDao();
    	Product_discount product_discount = new Product_discount();
    	int cont = 0;
		for(Item  item: Items) {
			discounts = new ArrayList<>();
			System.out.println("Ingresa prod: "+cont);
			
			product_discount = product_discountDao.findByIdProdCoupon(item.getProduct().getId(), coupon);
		    
			if(product_discount != null) {
				//VALIDATION
				boolean discountExist = false;
				if(item.getDiscount() != null) {
					
				}
				int counter = 0;
				for (Discount discount : item.getDiscount()) {
		       		 if (discount.getId() == product_discount.getDiscount().getId() ) {
		       			 System.out.println("Remise Exist");
		       			 discountExist = true;
		       			 break;
		       		 }
		       		counter++;
				 }
				if(discountExist != true && counter < 2) {
					System.out.println("Ingresa en if de prod para cambiar el precio: "+cont);
					item.setPrixR(item.getPrixR()-(product_discount.getDiscount().getPercent() * item.getPrixR()));
					//CREATION DE TABLEAU
					for (Discount discount : item.getDiscount()) {
						 discounts.add(discount);
					 }
					discounts.add(product_discount.getDiscount());
					item.setDiscount(discounts);
					System.out.println("Add nouvelle discount.");
					cont++;
				}
			}
			
		}
		if(cont > 0) {
			return true;
		}
		
		return false;
	}
	
	
	
	
	//DELETEITEM
    public boolean deleteById(int idItem) {
		for(Item  item: Items) {
			
			if(item.getProduct().getId()==idItem) {
				Items.remove(item);
				System.out.println("Delete Article de panier OK.");
				return true;
			}
		}
		return false;
	}
	
	//DELETEITEMS
    public boolean deleteItems() {
		for(Item  item: Items) {
			Items.remove(item);
			System.out.println("Delete Article de panier OK.");
		}
		return true;
	}
	
	
    
}
