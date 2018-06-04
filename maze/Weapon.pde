//weapons affect the strength stat
public class Weapon extends Item
{
    //instance variables
    private int _statModifier;  //how much it modifies the strength stat by

    //Constructor
    public Weapon(String name, int statModifier)
    {
        super(name, "Weapon");
        _statModifier = statModifier;
    }

    //accessor
    public int getModifier() { return _statModifier; }

    //Mutator
    public int setModifier(int newModifier)
    {
        int tmp = _statModifier;
        _statModifier = newModifier;
        return tmp;
    }

  
}
