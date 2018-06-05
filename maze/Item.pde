public abstract class Item
{
  protected String _name; //the name of the item
  protected String _type; //what type it is

  //Constructors
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

  //Accessors
  public String getName() { 
    return _name;
  }
  public String getType() { 
    return _type;
  }

  //Mutators
  public String setName(String newName)
  {
    String tmp = _name;
    _name = newName;
    return tmp;
  }
  //Note that type can't change - an item can't go from weapon to food lol

  public abstract void display();

  @Override
    public String toString() { 
    return _type + ": " + _name;
  }
}
