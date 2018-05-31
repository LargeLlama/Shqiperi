package entities;

import java.util.ArrayList;
import items.*;

public class Hero extends Entity {

    private ArrayList<Item> _inventory;
	
	//Constructors
	public Hero() {
		super("Dubim");
        _inventory = new ArrayList<Item>();
	}

    public Hero(String name)
    {
        super(name);
        _inventory = new ArrayList<Item>();
    }
	
	public static void main( String[] args ) {
		
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
