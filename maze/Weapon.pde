//<<<<<<< HEAD
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
//=======
//weapons affect the strength stat
/*public class Weapon extends Item
{
  //in
  //Constructor
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

  void display()
  {
    img = loadImage("sword.png");
    image(img, x, y, 60, 60);
    println("DISPLAYING SWORD");
  }
  I just need to fix somsething
  omg
  ging
  g
  reh
  e
  h
  tej
  wtjw
  tj
  wyr
  kety
  k
  wyj
  73
  m
  64
  m6u
  em
  e
  m6
  m
  srym
  5y
  k
  57e
  k76
  ek7
  5em
  5w
  j7e
  k
  rsyj
  57
  i
  3
  o
  yj
  73
  j
  37
  k3
  y
  ks
  7
  j3
  
  37j
  37
  m7
  3
  75k
  w57k
  37
  k73
  k37
  3m
  37
  37
  
}*/
//>>>>>>> 8bb9ccecaf6303f6b0208ae285be1deaf49746de
