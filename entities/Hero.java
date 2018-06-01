package entities;

import java.util.ArrayList;
import items.*;

public class Hero extends Entity {

    private ArrayList<Item> _inventory;
    private int _inventorySize;
    private int _maxHealth;
	
	//Constructors
	public Hero()
    {
		super("Dubim");
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;
        _maxHealth = 100;
	}

    public Hero(String name)
    {
        super(name);
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;
        _maxHealth = 100;
    }

    public int getInventorySize() { return _inventorySize; }

    @Override
    public int setHealth(int health)
    {
        if (health > _maxHealth)
        {
            return _health;
        }
        int tmp = _health;
        _health = health;
        return tmp;
    }

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
    
    public boolean isFull() { return _inventory.size() >= _inventorySize; }

    public boolean addItem(Item item)
    {
        if (!isFull())
        {
            _inventory.add(item);
            return true;
        }
        else 
        {
            return false;
        }
    }
    
    public boolean useItem(Item item)
    {
        if(_inventory.contains(item))
        {
            try 
            {
                item.use(this);
                _inventory.remove(item);
                return true;
            }
            catch (Exception e) { return false; }
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
        Food beef = new Food("Beef", 10);
		character1.addItem(beef);
        System.out.print(character1.showInventory());
        character1.useItem(beef);
        System.out.println(character1.showInventory());
        System.out.println( character1.getHealth());
		System.out.println( "\n" );
	/*	
		Hero character2 = new Hero( "Timothy" );
		System.out.println( character2.getName() );
		System.out.println( character2.getHealth() );
		System.out.println( character2.isAlive() );
		character2.lowerHealth( 105 );
		System.out.println( character2.getHealth() );
		System.out.println( character2.isAlive() ); */
	}
}
