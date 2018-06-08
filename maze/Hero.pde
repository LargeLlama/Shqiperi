import java.util.LinkedList;
public class Hero extends Entity {

  private LinkedList<Item> _inventory; //collection for inventory
  private int _inventorySize; //keeps track of how many items are in inventory

  private int _maxHealth; //the max health for entities
  private int _level; //keeps track of the level
  private int _exp; //character's experience
  private int _expToNextLvl; //xp needed to level up
  private int x; //x coordinate
  private int y; //y coordinate
  private int _kills; //amount of monsters killed

  //constructor
  public Hero()
  {
    //sets default values
    super("Dubim");
    _inventory = new LinkedList<Item>();
    _inventorySize = 1;
    _maxHealth = 100;
    _health = 100;
    _level = 1;
    _exp = 0;
    _expToNextLvl = 10;
    _kills = 0;
  }

  //Accessors
  
  public int getInventorySize() { 
    return _inventorySize;
  }
  public int getLevel() { 
    return _level;
  }
  public int getExp() { 
    return _exp;
  }
  public int getLevelUp() { 
    return _expToNextLvl;
  }


  @Override
  
  //Mutators
  
    public int setHealth(int health)
    {
      if (health > _maxHealth)
      {
        _health = _maxHealth;
        return _maxHealth;
      }
      int tmp = _health;
      _health = health;
      return tmp;
    }

  public int setInventorySize(int newSize)
  {
    int tmp = _inventorySize;
    _inventorySize = newSize;
    return tmp;
  }

  public int setLevel(int level)
  {
    int tmp = _level;
    _level = level;
    return tmp;
  }
  
  //Method to display inventory in console
  public String showInventory()
  {
    String inventory = "";
    for (Item i : _inventory)
    {
      inventory += i.getType() + " -- " + i.getName() + "\n";
    }
    return inventory;
  }

  //Method for character to level up
  public void levelUp()
  {
    if (_exp >= _expToNextLvl) //if amt of xp is enough to level up
    {
      _exp = _exp - _expToNextLvl;
      setLevel(_level++); //character levels up
      _expToNextLvl += 10;
    }
  }

  //Checks to see if inventory is full
  public boolean isFull() { 
    return _inventory.size() >= _inventorySize;
  }


  //Adds item to the inventory
  public boolean addItem(Item item)
  {
    if (!isFull())
    {
      _inventory.add(item);
      return true;
    } else
    {
      return false;
    }
  }

  //Method to use an item
  public boolean useItem(Food food)
  {
    //if (_inventory.contains(food))
   // {
      try
      {
        food.use(this);
        this.setHealth(_health + food.getHealAmount());
        _inventory.remove(food);
        return true;
      }
      catch (Exception e) { 
        return false;
      }
   /* } else
    {
      return false;
    }*/
  }

  //to display hero
  void display() {
    //img= loadImage("sprite.gif");
    image(hero, x, y, 60, 60);
  }
}
