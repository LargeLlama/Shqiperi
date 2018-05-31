package entities;

//Superclass for all living things in the game
public abstract class Entity
{
    //Instance variables
    protected int _health;
    protected int _speed;
    protected int _strength;
    protected int _defense;

    protected String _name;

    public Entity()
    {
        _health = 100;
        _speed = 10;
        _strength = 10;
        _defense = 3;
        _name = "";
    }

    public Entity(String name) 
    {
        this();
        _name = name;
    }

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

    //Modifiers

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

    public boolean isAlive() { return _health > 0; }

    public void lowerHealth(int damageTaken){ this.setHealth(_health - damageTaken); }
    
    public boolean attack(Entity target)
    {
        if (target.isAlive())
        {
            target.lowerHealth(this.getStrength() - target.getDefense());
            return true;
        }
        return false;
    }

    @Override
    public String toString() { return this.getName() + ": " + this.getHealth() + " HP"; }
}
