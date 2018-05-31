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
	
}