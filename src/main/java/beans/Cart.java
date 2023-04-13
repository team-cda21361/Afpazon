package beans;

import java.text.DecimalFormat;
import java.util.ArrayList;


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
                System.out.println();
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
    
    public String countPrixProduct() {
    	DecimalFormat df = new DecimalFormat("#.00");
	    double count = 0;
		for (Item item : Items) {
		    count += item.getProduct().getPrice() * item.getQuantity();
		}
		return df.format(count);
	}
    
    
	
	//ADD QTE 
	public void addQte(int idItem) {
		for(Item  item: Items) {
			
			if(item.getProduct().getId()==idItem) {
				item.setQuantity(item.getQuantity()+1);
				System.out.println("Quantite Add OK.");
				break;
			}
		}
	}
	//REMOVE QTE 
	public void removeQte(int idItem) {
		for(Item  item: Items) {
			
			if(item.getProduct().getId()==idItem) {
				if(item.getQuantity() <= 1) {
					item.setQuantity(1);
					System.out.println("Quantite Add OK NO POSIBLE. -1: ");
				}else {
					item.setQuantity(item.getQuantity()-1);
					System.out.println("Quantite Add OK.");
				}

				break;
			}
		}
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
	
	
	
	
    
}
