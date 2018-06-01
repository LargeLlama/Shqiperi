//armor affect the defense stat
public class Armor extends Item 
{
    //instance variables
    private int _statModifier;  //how much it modifies the defense stat by

    //Constructor
    public Armor(String name, int statModifier)
    {
        super(name, "Armor");
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

    //test
    public static void main(String[] args)
    {
        Armor sword = new Armor("Shield of the Double Headed Eagle", 5);
        System.out.println(sword);
    }
}
