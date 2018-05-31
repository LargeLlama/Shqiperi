public class Hero {
	
	//Instance Variables
	public String name;
	public int health;
	
	//Constructors
	public Hero() {
		
		name = "Dubin";
		health = 100;
		
	}
	
	public Hero( String n ) {
		
		this();
		name = n;
		
	}
	
	//Accessors
	public String getName() { return name; }
	
	public int getHealth() { return health; }
	
	
	//Methods
	public boolean isAlive() {
		
		return health > 0;
		
	}
	
	public void lowerHealth( int damageTaken ) {
		
		health = health - damageTaken;
		
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