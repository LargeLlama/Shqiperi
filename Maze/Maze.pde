//global initated variables
int w = 40;      //how long the lines are
int cols, rows;  //the columns and rows
Cell [][] grid;  //the grid of cells
Cell current; //the current cell
Cell neighbor; //the next cell

void setup() {
  //draws the window to be 400 by 400
  size(400, 400);
  
  //uncomment to slow down the maze generation to see it in action
  frameRate(5);
  //sets number of columns = to width divided by object width
  cols = width/w;

  //sets number of rows = to height divided by object width
  rows = height/w;

  //sets a grid array to columns and rows (I.E. (5,3) would be column 5 row 3
  grid = new Cell[cols][rows];

  //creates the cells inside of the grid
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  current = grid[(int)random(10)][(int)random(10)];
}

void draw() {
  //sets background color
  background(255);

  //displays the grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid.length; j++) {
      grid[i][j].display();
    }
  }
  //sets the current cell visited variable to true, and gets the next neighbor
  current.visited = true;
  neighbor = current.checkNeighbors();

  //makes sure the neighbor isn't null and that it wasn't visited 
  if (neighbor != null && !neighbor.visited)
  {
    neighbor.visited = true;  //sets the neighbors visited value to true
    current = neighbor;      //the current cell is now the neighboring cell, and this gnarly process repeats
  }
}

class Cell {
  //Cell Class variables
  int x, y;
  boolean walls[] = {true, true, true, true};
  ArrayList<Cell> neighbors;
  Cell top = null;
  Cell right = null;
  Cell bottom = null;
  Cell left = null;

  boolean visited = false;


  //creates temporary variables when Cell is called to create grid
  Cell(int i, int j) 
  {
    x = i*w;
    y = j*w;
    neighbors = new ArrayList<Cell>();
  }

  Cell checkNeighbors()
  {
    //sets a local x variable that is easier to work with
    int x = this.x / w;
    int y = this.y / w;
    
    if (y + 1 < grid[x].length) 
      top = grid[x][y + 1];

    if (x + 1 < grid.length)
      right = grid[x + 1][y];

    if ( y - 1 > 0)
      bottom = grid[x][y - 1];

    if (x - 1 > 0)
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

    if (neighbors.size() > 0)
    { 
      int random = floor(random(neighbors.size()));
      return neighbors.get(random);
    } else
    {
      return null;
    }
  }

  void display() 
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
    if (visited) {
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    }
  }

  String toString()
  {
    return "x: " + x + "\ny: " + y + "\n";
  }
}
