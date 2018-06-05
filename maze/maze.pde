import java.util.Stack;
//global initated variables
String clear = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
Stack s;
int w = 60;      //how long the lines are, width of a cell
int cols, rows;  //the columns and rows
Cell [][] grid;  //the grid of cells
Cell current; //the current cell
Cell neighbor; //the next cell
Cell exit; //the exit
PImage door; //used to hold and display the image of the exit
boolean isGenerating; //true if maze is still generating
static int level = 1; //levels of the mazes
static int order = 1; //each cell has an order, used to backtrack
Hero dubim; // the Hero that will be in the maze
Monster enemy0; //Monster that will be added to the maze
Monster enemy1; //Monster that will be added to the maze
Monster enemy2; //Monster that will be added to the maze
Weapon test; //Weapon that will allow the Hero to slay Monsters faster


//Instantiates Entities and Items
void setup() {
  s = new Stack();
  //draws the window to be 600 by 600
  size(600, 600);

  //Creates objects
  dubim = new Hero();
  enemy0 = new Monster(50, 50, 5, 3, "Monster 0", null);
  enemy1 = new Monster(50, 50, 5, 3, "Monster 1", null);
  enemy2 = new Monster(50, 50, 5, 3, "Monster 2", null);
  test = new Weapon("Bane of Turks", 5);
  isGenerating = true;

  //uncomment to slow down the maze generation to see it in action
  //frameRate(1);

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
  println(dubim.showInventory());
}


//Displaying the maze
void draw() {
  //println(dubim.getHealth());
  if (!dubim.isAlive())
    print("dead lmao\n");

  println(clear + "HP: " + dubim.getHealth());
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
    if (order == 101 && current.o == 1)
      isGenerating = false;
  }
  //**************************END OF MAZE GENERATION****************************************


  //Displaying image of the Enitities and Items in the maze
  if (dubim.isAlive())
    dubim.display();
  if (enemy0.isAlive())
    enemy0.display();
  if (enemy1.isAlive())
    enemy1.display();
  if (enemy2.isAlive())
    enemy2.display();

  test.display();


  //Attacks between Hero and Monsters
  if (enemy0.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy0._currentCell)
  {
    //println("yeet0");
    enemy0.attack(dubim);
    dubim.attack(enemy0);
  }

  if (enemy1.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy1._currentCell)
  {
    //println("yeet1");
    enemy1.attack(dubim);
    dubim.attack(enemy1);
  }

  if (enemy2.isAlive() && grid[dubim.x / 60][dubim.y / 60] == enemy2._currentCell)
  {
    //println("yeet2");
    enemy2.attack(dubim);
    dubim.attack(enemy2);
  }


  //mazeFinished();
}

//Used to remove the walls of the cells during maze generation
void removeWalls(Cell a, Cell b)
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

//keyboard input used to move the hero
void keyPressed() {
  //right

  //top,right,bottom,left
  //checks if no right wall
  if (!isGenerating) 
  {
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
  if (dubim.x == exit.x && dubim.y==exit.y) {
    background(0);
  }
}




class Cell {
  //Cell Class variables
  private PImage dungeon;
  static final int HERO = 1;
  static final int TRAP = 2;
  static final int  MONSTER= 3;

  int x, y;

  //top,right,bottom,left
  //allows for control of wall display
  boolean walls[] = {true, true, true, true};
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
    dungeon = loadImage("cell.png");
  }

  //Selects neighbor of a cell if there is one
  //Otherwise, returns null
  Cell checkNeighbors()
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
      door = loadImage("door.gif");
      image(door, x, y, 60, 60);
    }
  }

  String toString()
  {
    return "x: " + x + "\ny: " + y + "\n";
  }
}
