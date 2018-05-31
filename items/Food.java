package items;
//food replenishes health instantly
import entities.Hero;

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
    
    public static void main(String[] args)
    {
        Food beef = new Food("Beef", 10);
        System.out.println(beef);
    } 
}
