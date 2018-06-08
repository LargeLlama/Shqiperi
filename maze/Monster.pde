
public class Monster extends Entity
{
  private Item _drop; //the item that the monster drops
  private int _expDrop; //the xp that the monster drops
  private int x; //x coordinate
  private int y; //y coordinate
  private Cell _currentCell; //the cell

  //constructor
  public Monster() {
    //sets default values
    super();
    x = ((int) random(600) / 60) * 60;
    y = ((int) random(600) / 60) * 60;
  }

  //overloaded constructor
  public Monster(int health, int speed, int strength, int defense, String name, Item drop, int exp)
  {
    super(health, speed, strength, defense, name);
    _drop = drop;
    _expDrop = exp;
    x = ((int) random(600) / 60) * 60;
    y = ((int) random(600) / 60) * 60;
  }

  //Accessors

  //allows character to pick up items
  public Item getDrop() { 
    return _drop;
  }

  //Mutators
  
  //Sets the items that are dropped
  public Item setDrop(Item item)
  {
    Item tmp = _drop;
    _drop = item;
    return tmp;
  }

  //To display monsters
  void display() {
    image(monster, x, y, 60, 60);
  }
}
