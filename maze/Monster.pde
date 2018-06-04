
public class Monster extends Entity
{
  private Item _drop;
  private int x;
  private int y;
  private PImage img;
  private Cell _currentCell;

  public Monster() {
    super();
    x = ((int) random(601) / 60) * 60;
    y = ((int) random(601) / 60) * 60;
  }

  public Monster(int health, int speed, int strength, int defense, String name, Item drop)
  {
    super(health, speed, strength, defense, name);
    _drop = drop;
    x = ((int) random(601)) * 60;
    y = ((int) random(601)) * 60;
  }

  public Item getDrop() { 
    return _drop;
  }

  public Item setDrop(Item item)
  {
    Item tmp = _drop;
    _drop = item;
    return tmp;
  }

  void display() {
    img = loadImage("enemy.gif");
    image(img, x, y, 60, 60);
  }
}
