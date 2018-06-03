//food replenishes health instantly

public class Food extends Item
{
    private int _healAmount;

    public Food(String name, int healAmount)
    {
        super(name, "Food");
        _healAmount = healAmount;
    }

    //accessors
    public int getHealAmount() { return _healAmount; }

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

  
}
