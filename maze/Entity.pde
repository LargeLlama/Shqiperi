//Superclass for all living things in the game
public abstract class Entity
{
    //Instance variables
    protected int _health; //tracks the character's health
    protected int _speed; //tracks the character's speed
    protected int _strength; //tracks the character's strength
    protected int _defense; //tracks the character's defense

    protected String _name; //The character's name

    //constructor
    public Entity()
    {
        //sets default values
        _health = 100;
        _speed = 10;
        _strength = 10;
        _defense = 3;
        _name = "";
    }

    //overloaded constructor
    public Entity(String name)
    {
        this();
        _name = name;
    }

    //a bigger overloaded constructor
    public Entity(int health, int speed, int strength, int defense, String name)
    {
        _health = health;
        _speed = speed;
        _strength = strength;
        _defense = defense;
        _name = name;
    }

    //Accessors

    //returns Health
    public int getHealth() { return _health; }

    //returns Speed
    public int getSpeed() { return _speed; }

    //returns Strength
    public int getStrength() { return _strength; }

    //returns Defense
    public int getDefense() { return _defense; }

    //returns the name of the entity
    public String getName() { return _name; }

    //Mutators

    public int setHealth(int num)
    {
        int tmp = _health;
        _health = num;
        return tmp;
    }

    public int setSpeed(int num)
    {
        int tmp = _speed;
        _speed = num;
        return tmp;
    }

    public int setStrength(int num)
    {
        int tmp = _strength;
        _strength = num;
        return tmp;
    }

    public int setDefense(int num)
    {
        int tmp = _defense;
        _defense = num;
        return tmp;
    }

    public String setName(String str)
    {
        String tmp = _name;
        _name = str;
        return tmp;
    }

    //Methods

    public boolean isAlive() { return _health > 0; } //checks to see if entity is alive

    public void lowerHealth(int damageTaken){ this.setHealth(_health - damageTaken); } //damage method

    public boolean attack(Entity target) //attack method
    {
        if (target.isAlive()) //if entity is alive
        {
            target.lowerHealth(this.getStrength() - target.getDefense()); //entity takes damage
            return true;
        }
        return false;
    }
    

    @Override
    //toString method
    public String toString() { return this.getName() + ": " + this.getHealth() + " HP"; }
}
