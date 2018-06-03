
public class Monster extends Entity
{
    private Item _drop;

    public Monster(int health, int speed, int strength, int defense, String name, Item drop)
    {
        super(health, speed, strength, defense, name);
        _drop = drop;
    }

    public Item getDrop() { return _drop; }

    public Item setDrop(Item item)
    {
        Item tmp = _drop;
        _drop = item;
        return tmp;
    }
}
