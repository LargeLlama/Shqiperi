import java.util.ArrayList;
public class Hero extends Entity {

    private ArrayList<Item> _inventory;
    private int _inventorySize;

    private int _maxHealth;
    private int _level;
    private int _exp;
    private int _expToNextLvl;
    private PImage img;
    private int x;
    private int y;
    private Cell _currentCell;
    private int _kills;

	public Hero()
    {
        super("Dubim");
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;

        _maxHealth = 100;

        _health = 100;
 
        _level = 1;
        _exp = 0;
        _expToNextLvl = 10;
        _kills = 0;
    }

    public int getInventorySize() { return _inventorySize; }
    public int getLevel() { return _level; }
    public int getExp() { return _exp; }
    public int getLevelUp() { return _expToNextLvl; }


    @Override
    public int setHealth(int health)
    {

        if (health > _maxHealth)
        {
            return _maxHealth;
        }
        int tmp = _health;
        _health = health;
        return tmp;
    }

    public String showInventory()
    {
        String inventory = "";
        for (Item i : _inventory)
        {
            inventory += i.getType() + ": " + i.getName() + "\n";
        }
        return inventory;
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

    public void levelUp()
    {
        if (_exp >= _expToNextLvl)
        {
            _exp = _exp - _expToNextLvl;
            setLevel(_level++);
            _expToNextLvl += 10;
        }
    }

    public boolean isFull() { return _inventory.size() >= _inventorySize; }

    public boolean addItem(Item item)
    {
        if (!isFull())
        {
            _inventory.add(item);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean useItem(Food food)
    {
        if(_inventory.contains(food))
        {
            try
            {
                food.use(this);
                _inventory.remove(food);
                return true;
            }
            catch (Exception e) { return false; }
        }
        else
        {
            return false;
        }
    }

void display(){
  img= loadImage("sprite.gif");
  image(img, x, y, 60, 60);
}


}
