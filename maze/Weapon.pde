//weapons affect the strength stat
public class Weapon extends Item
{
  //instance variables
  private int _statModifier;  //how much it modifies the strength stat by
  private PImage img;
  private int x;
  private int y;

  //Constructor
  public Weapon(String name, int statModifier)
  {
    super(name, "Weapon");
    _statModifier = statModifier;
    x = ((int) random(601)) * 60;
    y = ((int) random(601)) * 60;
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

  void display()
  {
    img = loadImage("sword.gif");
    image(img, x, y, 60, 60);
  }
}
