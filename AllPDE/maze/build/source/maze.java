import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.ArrayList; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class maze extends PApplet {


//global initated variables
int w = 60;      //how long the lines are
int cols, rows;  //the columns and rows
Cell [][] grid;  //the grid of cells
Cell current; //the current cell
Cell neighbor; //the next cell
Cell exit; //the exit
static int order = 1;
PImage[] imgs;
int imgHeroX, imgHeroY;
int imgMonsX, imgMonsY;


public void setup() {
  
  //draws the window to be 600 by 600
  

  //uncomment to slow down the maze generation to see it in action
  //frameRate(1);
  
  //sets number of columns = to width divided by object width
  cols = width/w;

  //sets number of rows = to height divided by object width
  rows = height/w;

Hero dubim = new Hero();

  //sets a grid array to columns and rows (I.E. (5,3) would be column 5 row 3
  grid = new Cell[cols][rows];

  //creates the cells inside of the grid
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  current = grid[0][0];
  exit = grid[(int)random(10)][9];
  exit.isExit = true;


//*************IMAGES*******************
  imgs = new PImage[6];
  imgs[0] = loadImage("sprite.gif");
  imgs[1] = loadImage("enemy.gif");
  
  imgMonsX = ((int) random(601) / 60) * 60;
  imgMonsY = ((int) random(601) / 60) * 60;

}

public void draw() {
  //sets background color
  background(61, 56, 60);
  //background(0,103,0);
  //displays the grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid.length; j++) {

      if (imgHeroX == grid[i][j].x && imgHeroY == grid[i][j].y) {
        grid[i][j].cargo[0] = Cell.HERO;
      }

      grid[i][j].display();
    }
  }

  //sets the current cell visited variable to true, and gets the next neighbor
  if (current!=null) {
    current.visited = true;

    //set cell's order
    if (current.o == 0) {
      current.o = order; 
      //update the order
      order+=1;
    }

    neighbor = current.checkNeighbors();


    //makes sure the neighbor isn't null and that it wasn't visited
    if (neighbor != null && !neighbor.visited)
    {
      neighbor.visited = true;  //sets the neighbors visited value to true
      removeWalls(current, neighbor); //removes the needed walls

      current = neighbor;      //the current cell is now the neighboring cell, and this gnarly process repeats
    }

    //no neighbors
    else {
      current.noNeighbors = true;
      current = cellWithOrder(current.o-1);
    }
  }
  image(imgs[0], imgHeroX, imgHeroY, 60, 60);
  image(imgs[1], imgMonsX,imgMonsY,60,60); 
  //mazeFinished();
}



public void removeWalls(Cell a, Cell b)
{
  //grabs the difference between the x values
  int x = (b.x / w) - (a.x / w);
  //uncomment for debugging
  //print("x diff: " + x + "\n");

  //if it's 1, then it is to the right
  if ( x == 1)
  {
    a.walls[1] = false;
    b.walls[3] = false;
  }
  //if it's -1, it's to the left
  else if ( x == -1)
  {
    a.walls[3] = false;
    b.walls[1] = false;
  }
  //grabs the y value to calculate where the other block is
  int y = (b.y / w) - (a.y / w);
  //uncomment for debugging
  //print("y diff: " + y + "\n");
  //if it's 1, it's above
  if (y == 1)
  {
    a.walls[2] = false;
    b.walls[0] = false;
  }
  //if it's -1, it's below
  else if (y == -1)
  {
    a.walls[0] = false;
    b.walls[2] = false;
  }
  //debugging
  //println(current.o);
  //println(current);
}

//axuiliary method use to find the cell with a particular order
public Cell cellWithOrder(int order) {
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      if (grid[r][c].o == order && !grid[r][c].noNeighbors ) {
        return grid[r][c];
      } else if (grid[r][c].o == order && grid[r][c].noNeighbors ) {
        return cellWithOrder(order - 1);
      }
    }
  }
  return null;
}

//for keyboard input
public void keyPressed() {
  //right


  if (key=='d' && imgHeroX <= width-120) {
    println("pressed d");
    imgHeroX += 60;
  }
  //down
  else if (key=='s' && imgHeroY <= height-120) {
    println("pressed s");
    imgHeroY += 60;
  }
  //left
  else if (key=='a' && imgHeroX >= w) {
    println("pressed a");
    imgHeroX -= 60;
  }
  //up
  else if (key=='w' && imgHeroY >= w) {
    println("pressed w");
    imgHeroY -= 60;
  }
}

public void mazeFinished() {
  if (imgHeroX == exit.x && imgHeroY==exit.y) {
    background(0);
  }
}



class Cell {
  //Cell Class variables

  static final int HERO = 1;
  static final int TRAP = 2;
  static final int  MONSTER= 3;

  int x, y;
  boolean walls[] = {true, true, true, true};
  int[] cargo;
  ArrayList<Cell> neighbors;
  Cell top = null;
  Cell right = null;
  Cell bottom = null;
  Cell left = null;

  boolean visited = false;
  boolean noNeighbors = false;
  int o; // cell's order; used to find latest cell;

  boolean isExit = false; //determines whether the cell is an exit - false by default


  //creates temporary variables when Cell is called to create grid
  Cell(int i, int j)
  {
    x = i*w;
    y = j*w;
    neighbors = new ArrayList<Cell>();
    cargo = new int[3];
  }

  public Cell checkNeighbors()
  {
    //sets a local x variable that is easier to work with
    int x = this.x / w;
    int y = this.y / w;

    if (y + 1 < grid[x].length)
      top = grid[x][y + 1];

    if (x + 1 < grid.length)
      right = grid[x + 1][y];

    if ( y - 1 >= 0)
      bottom = grid[x][y - 1];

    if (x - 1 >= 0)
      left = grid[x - 1][y];

    if (top != null && !top.visited)
    {
      neighbors.add(top);
    }
    if (right != null && !right.visited)
    {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited)
    {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited)
    {
      neighbors.add(left);
    }
    //println(neighbors);
    if (neighbors.size() > 0)
    {
      int random = floor(random(neighbors.size()));
      return neighbors.get(random);
    } else
    {
      noNeighbors = true;
      return null;
    }
  }

  public void display()
  {
    //trbl = top right bottom left


    //creates walls for top side of cells
    stroke(0);
    if (walls[0]) {
      line(x, y, x+w, y);
    }

    //creates walls for right side of cells
    if (walls[1]) {
      line(x+w, y, x+w, y+w);
    }

    //creates walls for botttom side of cells
    if (walls[2]) {
      line(x+w, y+w, x, y+w);
     
    }

    //creates walls for left side of cells
    if (walls[3]) {
      line(x, y+w, x, y);
    }

    //colors current cell
    if (visited && !noNeighbors) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    } else {
      noStroke();
      fill(0, 103, 0, 60); //green
      rect(x, y, w, w);
    }
    if (this==current) {
      fill(255);
      rect(x, y, w, w);
    }
    if (this.isExit == true) {
      fill(244, 66, 75);
      rect(x, y, w, w);
    }
  }
  public String toString()
  {
    return "x: " + x + "\ny: " + y + "\n";
  }
}
//Superclass for all living things in the game
public abstract class Entity
{
    //Instance variables
    protected int _health;
    protected int _speed;
    protected int _strength;
    protected int _defense;

    protected String _name;

    public Entity()
    {
        _health = 100;
        _speed = 10;
        _strength = 10;
        _defense = 3;
        _name = "";
    }

    public Entity(String name)
    {
        this();
        _name = name;
    }

    public Entity(int health, int speed, int strength, int defense, String name)
    {
        _health = health;
        _speed = speed;
        _strength = strength;
        _defense = defense;
        _name = name;
    }

    //Accessors

    //returns Health
    public int getHealth() { return _health; }

    //returns Speed
    public int getSpeed() { return _speed; }

    //returns Strength
    public int getStrength() { return _strength; }

    //returns Defense
    public int getDefense() { return _defense; }

    //returns the name of the entity
    public String getName() { return _name; }

    //Modifiers

    public int setHealth(int num)
    {
        int tmp = _health;
        _health = num;
        return tmp;
    }

    public int setSpeed(int num)
    {
        int tmp = _speed;
        _speed = num;
        return tmp;
    }

    public int setStrength(int num)
    {
        int tmp = _strength;
        _strength = num;
        return tmp;
    }

    public int setDefense(int num)
    {
        int tmp = _defense;
        _defense = num;
        return tmp;
    }

    public String setName(String str)
    {
        String tmp = _name;
        _name = str;
        return tmp;
    }

    //Methods

    public boolean isAlive() { return _health > 0; }

    public void lowerHealth(int damageTaken){ this.setHealth(_health - damageTaken); }

    public boolean attack(Entity target)
    {
        if (target.isAlive())
        {
            target.lowerHealth(this.getStrength() - target.getDefense());
            return true;
        }
        return false;
    }

    @Override
    public String toString() { return this.getName() + ": " + this.getHealth() + " HP"; }
}
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

public class Hero extends Entity {

    private ArrayList<Item> _inventory;
    private int _inventorySize;
    private int _maxHealth;
    private int _level;
    private int _exp;
    private int _expToNextLvl;
    private PImage gang;

	public Hero()
    {
        super("Dubim");
        _inventory = new ArrayList<Item>();
        _inventorySize = 10;
        _maxHealth = 100;
        _level = 1;
        _exp = 0;
        _expToNextLvl = 10;
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
            return _health;
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


}
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
    public String getName() { return _name; }
    public String getType() { return _type; }

    //Mutators
    public String setName(String newName)
    {
        String tmp = _name;
        _name = newName;
        return tmp;
    }
    //Note that type can't change - an item can't go from weapon to food lol


    @Override
    public String toString() { return _type + ": " + _name; }
}

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
//weapons affect the strength stat
public class Weapon extends Item
{
    //instance variables
    private int _statModifier;  //how much it modifies the strength stat by

    //Constructor
    public Weapon(String name, int statModifier)
    {
        super(name, "Weapon");
        _statModifier = statModifier;
    }

    //accessor
    public int getModifier() { return _statModifier; }

    //Mutator
    public int setModifier(int newModifier)
    {
        int tmp = _statModifier;
        _statModifier = newModifier;
        return tmp;
    }

  
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "maze" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
