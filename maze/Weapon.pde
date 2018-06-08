
//weapons affect the strength stat
public class Weapon extends Item
{
  //instance variables
  private int _statModifier;  //how much it modifies the strength stat by
  private PImage img; //image
  private int x; //x coordinate
  private int y; //y coordinate

  //Overloaded constructor
  public Weapon(String name, int statModifier)
  {
    super(name, "Weapon");
    _statModifier = statModifier;
    x = ((int) random(601)/60) * 60;
    y = ((int) random(601)/60) * 60;
    
  }

  //accessor
  public int getModifier() { 
    return _statModifier;
  }

  //Mutator
  public int setModifier(int newModifier)
  {
    int tmp = _statModifier;
    _statModifier = newModifier;
    return tmp;
  }

  //displays weapons
  void display()
  {  
    //println("x: " + x + "y: " + y);
    image(weapon, x + 5, y + 5, 50, 50);
    //println("SWORD DISPLAY");
  }
}
