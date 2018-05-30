// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 10;
int rows = 10;
int x, y = 0;
int l;

void setup() {
  size(400, 400);
  background(0);
  l = (width/cols);
  //initalize cells
  grid = new Cell[cols][rows];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      grid[r][c] = new Cell(x, y, l, l);
      x += l;
    }
    x=0; //reset x coordinate to start from left
    y+=l; //new row
  }
}

void draw() {
  background(0);
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      grid[r][c].display();
    }
  }
}
// Cell objects for the grid
class Cell {
  // A cell knows about its location in the grid 
  // and its size
  float x, y;   // x,y location 
  float w, h;   // width and height

  // Constructor
  Cell(float X, float Y, float W, float H) {
    x = X;
    y = Y;
    w = W;
    h = H;
  } 


  void display() {
    stroke(255);
    fill(204, 102, 0); //orangie color
    rect(x, y, w, h);
  }
}
