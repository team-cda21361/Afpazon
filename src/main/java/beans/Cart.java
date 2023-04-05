package beans;

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
}
