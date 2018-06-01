
//global initated variables
int w = 60;      //how long the lines are
int cols, rows;  //the columns and rows
Cell [][] grid;  //the grid of cells
Cell current; //the current cell
Cell neighbor; //the next cell
Cell exit; //the exit
static int order = 1;


void setup() {
  //draws the window to be 400 by 400
  size(600, 600);

  //uncomment to slow down the maze generation to see it in action
  //frameRate(1);
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
  current = grid[0][0];
  exit = grid[(int)random(10)][9];
  exit.isExit = true;
}

void draw() {
  //sets background color
  background(61,56,60);
  //background(255);

  //displays the grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid.length; j++) {
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
  }

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

//axuiliary method use to find the cell with a particular order
Cell cellWithOrder(int order) {
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      if (grid[r][c].o == order && !grid[r][c].noNeighbors ) {
        return grid[r][c];
      }
      else if (grid[r][c].o == order && grid[r][c].noNeighbors ){
        return cellWithOrder(order - 1);
      }
    }
  }
  return null;
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
  boolean noNeighbors = false;
  int o; // cell's order; used to find latest cell;

  boolean isExit = false; //determines whether the cell is an exit - false by default


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
    if (visited && !noNeighbors) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    } else {
      noStroke();
      fill(0, 103, 0, 60);
      rect(x, y, w, w);
    }
    if (this==current) {
      fill(255);
      rect(x, y, w, w);
    }
  }
  String toString()
  {
    return "x: " + x + "\ny: " + y + "\n";
  }
}
