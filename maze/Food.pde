//food replenishes health instantly

public class Food extends Item
{
  private int _healAmount;
  private PImage img;

  public Food(String name, int healAmount)
  {
    super(name, "Food");
    _healAmount = healAmount;
  }

  //accessors
  public int getHealAmount() { 
    return _healAmount;
  }

  //Mutators
  public int setHealAmount(int newAmount)
  {
    int tmp = _healAmount;
    _healAmount = newAmount;
    return tmp;
  }

  public void use(Hero hero)
  {
    hero.setHealth(hero.getHealth() + _healAmount);
  }

  public void display() {
    image(bread, x + 5, y + 5, 50, 50);
  }
}
