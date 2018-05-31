package items;

public class Sword extends Item
{
    //Instance variables
    private int _statModifier;  //how much it will modify a stat by (the stat is determined by the type)

    public Sword(String name)
    {
        super(name, "Weapon");
        _statModifier = (int)(Math.random() * 3 + 2);
    }

    //Accessors
    public int getModifier() { return _statModifier; }
    
    //Mutators
    public int setModifier(int newModifier)
    {
        int tmp = _statModifier;
        _statModifier = newModifier;
        return tmp;
    }

    @Override
    public String toString() { return _name + " : " + _type; }

    public static void main(String[] args)
    {
        
    }
}
