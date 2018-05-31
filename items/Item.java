package items;

public abstract class Item
{
    protected String _name;
    protected String _type;

    public Item(String name)
    {
        _name = name;
        _type = "Item";
    }    

    public Item(String name, String type)
    {
        _name = name;
        _type = type;
    }
    
    public String getName() { return _name; }
    public String getType() { return _type; }

    public String setName(String newName)
    {
        String tmp = _name;
        _name = newName;
        return tmp;
    }
}
