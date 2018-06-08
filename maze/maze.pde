//imports
import java.util.LinkedList;

//global initated variables
String clear = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";

int w = 60;      //how long the lines are, width of a cell
int cols, rows;  //the columns and rows

LinkedList<Cell> cells; //collection of cells
Cell [][] grid;  //the grid of cells
Cell current; //the current cell
Cell neighbor; //the next cell
Cell exit; //the exit

PImage door; //used to hold and display the image of the exit
PImage hero; //used to hold and display the image of the hero
PImage weapon; //used to hold and display the image of the sword
PImage monster; //used to hold and display the image of the monsters
PImage bread; //used to hold and display the image of the bread
PImage victory;

boolean isGenerating; //true if maze is still generating
static int level; //levels of the mazes
static int order = 1; //each cell has an order, used to backtrack
boolean isFinished; //checks if dubim reaches exit with proper kills

Hero dubim; // the Hero that will be in the maze
Monster enemy0; //Monster that will be added to the maze
Monster enemy1; //Monster that will be added to the maze
Monster enemy2; //Monster that will be added to the maze
Weapon sword; //Weapon that will allow the Hero to slay Monsters faster
Food food; //The very tasty bread

//Instantiates Entities and Items
void setup() {
  //draws the window to be 600 by 600
  size(600, 600);

  //Creates objects
  dubim = new Hero();
  enemy0 = new Monster(50, 50, 5, 3, "Monster 0", null);
  enemy1 = new Monster(50, 50, 5, 3, "Monster 1", null);
  enemy2 = new Monster(50, 50, 5, 3, "Monster 2", null);
  sword = new Weapon("Bane of Turks", 5);
  food = new Food("bread", 20);

  //Loads images for each object
  door = loadImage("door.gif");
  hero = loadImage("sprite.gif");
  weapon = loadImage("sword.png");
  monster = loadImage("enemy.gif");
  bread = loadImage("bread.png");
  victory = loadImage("victory.png");

  isGenerating = true; //Checks to see if the maze is being created
  isFinished = false; //Dubim initially not finished with the maze
  cells = new LinkedList<Cell>(); //list that contains the cells; used for maze generation
  level = 1; //keeps track of the level
  //uncomment to slow down the maze generation to see it in action
  //frameRate(5);

  //sets number of columns = to width divided by object width
  cols = width / w;

  //sets number of rows = to height divided by object width
  rows = height / w;


  //sets a grid array to columns and rows (I.E. (5,3) would be column 5 row 3
  grid = new Cell[cols][rows];

  //creates the cells inside of the grid
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[i][j] = new Cell(i, j);
    }
  }

  //start cell of maze generation
  current = grid[0][0];
  //choose an exit 
  exit = grid[(int)random(10)][9];
  exit.isExit = true;

  //assign monsters to locations in the maze
  enemy0._currentCell = grid[enemy0.x / 60][enemy0.y / 60];
  enemy1._currentCell = grid[enemy1.x / 60][enemy1.y / 60];
  enemy2._currentCell = grid[enemy2.x / 60][enemy2.y / 60];
  sword._currentCell = grid[sword.x / 60][sword.y / 60];
}


//Displaying the maze
void draw() {
  //println(dubim.getHealth());
  if (!dubim.isAlive())
    print("dead lmao\n");

  //Displays stats in the console
  println(clear + "HP: " + dubim.getHealth() + "\nStrength: " + dubim.getStrength() + "\nDefense: " + dubim.getDefense() + "\nInventory:\n" + dubim.showInventory());
  background(61, 56, 60);

  //background(0,103,0);
  //displays the grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid.length; j++) { 
      grid[i][j].display();
    }
  }

  //********************MAZE GENERATION******************************
  if (isGenerating) {
    //sets the current cell visited variable to true, and gets the next neighbor
    if (current!=null) {
      current.visited = true;

      //set cell's order
      if (current.o == 0) {
        current.o = order; 
        //update the order
        order += 1;
        cells.add(current);
      }

      //Chooses a neighbor of the current cell
      neighbor = current.checkNeighbors();


      //makes sure the neighbor isn't null and that it wasn't visited
      if (neighbor != null && !neighbor.visited)
      {
        neighbor.visited = true;  //sets the neighbors visited value to true
        removeWalls(current, neighbor); //removes the needed walls
        cells.add(neighbor);     //Adds the neighbor to the list of cells
        current = neighbor;      //the current cell is now the neighboring cell, and this gnarly process repeats
      }

      //if no neighbors
      else {
        current.noNeighbors = true;
        cells.remove(current);
        current = cells.get(cells.size()-1);
      }
    }
    //If there is only one cell in the list remaining
    if (cells.size() == 1)
      isGenerating = false; //stop generation
  }


  //**************************END OF MAZE GENERATION****************************************

  //println("KILLS: " + dubim._kills);

  //Displaying image of the Enitities and Items in the maze
  if (dubim.isAlive())
    dubim.display();
  if (enemy0.isAlive())
    enemy0.display();
  if (enemy1.isAlive())
    enemy1.display();
  if (enemy2.isAlive())
    enemy2.display();

  //To pick up sword
  if (!sword._taken && sword.x == dubim.x && sword.y == dubim.y) {
    sword._taken = true;
    dubim.addItem(sword); //Adds sword to inventory
    dubim.setStrength(dubim.getStrength() + sword.getModifier()); //Modifies character's stats
  } 
  //If sword is not picked up, it is still displayed in the maze
  if (!sword._taken) {
    sword.display();
  }
  //println("health no food: " + dubim._health);

  //To pick up food
  if (food.x == dubim.x && food.y == dubim.y) {
    if (dubim._health != 100) { //only eats the food is health is < 100
      food._taken = true;
      dubim.useItem(food);
    }
    //dubim.setHealth(dubim.getHealth() + food.getHealAmount());
    //println("health after food: " + dubim._health);
  } 
  //If food is not picked up, it is still displayed in the maze
  if (!food._taken) {
    food.display();
  }

  //Attacks between Hero and Monsters
  if (enemy0.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy0._currentCell)
  {
    //println("yeet0");
    enemy0.attack(dubim);
    dubim.attack(enemy0);
    //If dubim is alive after enemy attack, then he got a kill
    if (dubim.isAlive() && !enemy0.isAlive()) {
      dubim._kills +=1;
    }
  }

  if (enemy1.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy1._currentCell)
  {
    //println("yeet1");
    enemy1.attack(dubim);
    dubim.attack(enemy1);
    if (dubim.isAlive()&& !enemy1.isAlive()) {
      dubim._kills +=1;
    }
  }

  if (enemy2.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy2._currentCell)
  {
    //println("yeet2");
    enemy2.attack(dubim);
    dubim.attack(enemy2);
    if (dubim.isAlive()&& !enemy2.isAlive()) {
      dubim._kills +=1;
    }
  }

  //When character reaches exit, runs mazeFinished() method
  mazeFinished();
  
}


//Used to remove the walls of the cells during maze generation
void removeWalls(Cell a, Cell b)
{
  //grabs the difference between the x values
  int x = (b.x / w) - (a.x / w);
  //uncomment for debugging
  //print("x diff: " + x + "\n");

  //if it's 1, then it is to the right
  if (x == 1)
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

/*
//auxiliary method used to find the cell with a particular order
 Cell cellWithOrder(int order) {
 if (order == 1) {
 return grid[0][0];
 }
 
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
 */

//keyboard input used to move the hero
void keyPressed() {

  //top, right, bottom, left
  //checks if no right wall
  if (!isGenerating) 
  { //to move right
    if (key=='d' && dubim.x <= width-120 && !grid[dubim.x/60][dubim.y/60].walls[1]) {
      //println("pressed d");
      dubim.x += 60;
    }
    //down
    else if (key=='s' && dubim.y <= height-120  && !grid[dubim.x/60][dubim.y/60].walls[2]) {
      //println("pressed s");
      dubim.y += 60;
    }
    //left
    else if (key=='a' && dubim.x >= w  && !grid[dubim.x/60][dubim.y/60].walls[3]) {
      //println("pressed a");
      dubim.x -= 60;
    }
    //up
    else if (key=='w' && dubim.y >= w  && !grid[dubim.x/60][dubim.y/60].walls[0]) {
      //println("pressed w");
      dubim.y -= 60;
    }
  }
}

//Performs action if maze is finished
void mazeFinished() {
  if (dubim.x == exit.x && dubim.y==exit.y && dubim._kills == 3) {
    isFinished = true;
  }

  if (isFinished) {
    image(victory, 0, 0, 600, 600);
  }
}


import java.util.LinkedList;

class Cell {
  //Cell Class variables
  private PImage dungeon;

  int x, y; //coordinates

  //top, right, bottom, left
  //allows for control of wall display
  boolean walls[] = {true, true, true, true};
  LinkedList<Cell> neighbors;
  //ArrayList<Cell> neighbors;

  Cell top = null;
  Cell right = null;
  Cell bottom = null;
  Cell left = null;

  boolean visited = false; //has the cell been visited
  boolean noNeighbors = false; //does the cell have zero neighbors
  int o; // cell's order; used to find lasword cell;

  boolean isExit = false; //determines whether the cell is an exit - false by default


  //creates temporary variables when Cell is called to create grid
  Cell(int i, int j)
  {
    //sets coordinates based on cell width
    x = i*w;
    y = j*w; 
    neighbors = new LinkedList<Cell>(); //creates linked list of neighbors
    dungeon = loadImage("cell.png"); //loads image of cell
  }

  //Selects neighbor of a cell if there is one
  //Otherwise, returns null
  Cell checkNeighbors()
  {
    //sets a local x variable that is easier to work with
    int x = this.x / w;
    int y = this.y / w;

    //To check neighbors
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
      neighbors.add(top); //adds to neighbors list
    }
    if (right != null && !right.visited)
    {
      neighbors.add(right); //adds to neighbors list
    }
    if (bottom != null && !bottom.visited)
    {
      neighbors.add(bottom); //adds to neighbors list
    }
    if (left != null && !left.visited)
    {
      neighbors.add(left); //adds to neighbors list
    }
    //println(neighbors);
    if (neighbors.size() > 0)
    {
      int random = floor(random(neighbors.size())); //chooses a random neighbor
      return neighbors.get(random);
    } else
    {
      noNeighbors = true;
      return null;
    }
  }

  //displays the cell
  void display()
  {
    //trbl = top right bottom left
    //creates walls for top side of cells
    stroke(255);
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
    if (visited && !noNeighbors && isGenerating) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    } else {
      noStroke();

      //done for speed purposes
      if (isGenerating) {
        fill(0, 103, 0, 60); //green
        rect(x, y, w, w);
      } else {
        image(dungeon, x + 5, y + 5, 60, 60);
      }
    }
    //colors current cell white during maze generation
    if (this==current && isGenerating) {
      fill(255);
      rect(x, y, w, w);
    }
    //shows door image
    if (this.isExit == true) {
      //fill(244, 66, 75);
      //rect(x, y, w, w);
      image(door, x, y, 60, 60);
    }
  }

  //our toString method
  String toString()
  {
    return "x: " + x + "\ny: " + y + "\n";
  }
}
