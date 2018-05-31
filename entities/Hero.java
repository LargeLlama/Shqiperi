package entities;

import java.util.ArrayList;
import items.*;

public class Hero extends Entity {

    private ArrayList<Item> _inventory;
    private int _inventorySize;
	
	//Constructors
	public Hero()
    {
		super("Dubim");
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;
	}

    public Hero(String name)
    {
        super(name);
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;
    }

    public int getInventorySize() { return _inventorySize; }

    public String showInventory()
    {
        String inventory = "";
        for (Item i : _inventory)
        {
            inventory += i.getType() + ": " + i.getName() + "\n";
        }
        return inventory;
    }

    public int setInventorySize(int newSize)
    {
        int tmp = _inventorySize;
        _inventorySize = newSize;
        return tmp;
    }
    
    public boolean isFull() { return _inventory.size >= _inventorySize }

    public boolean addItem(Item item)
    {
        if (isFull())
        {
            _inventory.add(item);
            return true;
        }
        else 
        {
            return false;
        }
    }
	
	public static void main( String[] args ) 
    {
		Hero character1 = new Hero();
		System.out.println( character1.getName() );
		System.out.println( character1.getHealth() );
		System.out.println( character1.isAlive() );
		character1.lowerHealth( 20 );
		System.out.println( character1.getHealth() );
		System.out.println( character1.isAlive() );
		
		System.out.println( "\n" );
		
		Hero character2 = new Hero( "Timothy" );
		System.out.println( character2.getName() );
		System.out.println( character2.getHealth() );
		System.out.println( character2.isAlive() );
		character2.lowerHealth( 105 );
		System.out.println( character2.getHealth() );
		System.out.println( character2.isAlive() );
	}
}
