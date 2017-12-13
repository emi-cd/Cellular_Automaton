// 2D Array of objects
Cell[][] grid;
STATE[][] state; 
STATE[][] next_state; 

// Number of columns and rows in the grid
int cols = 30;
int rows = 30;

int cell_size = 20;
int DEAD_COLOR = 255;
int REST_COLOR = 127;
int LIVE_COLOR = 0;

// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 3;
int born_condition = 3;
int rest_time = 1;
// ----------------------------------
boolean flag = false;

public enum STATE {
  LIVE, DEAD, REST
}

void setup() {
  size(700, 600);
  grid = new Cell[cols][rows];
  state = new STATE[cols][rows];
  next_state = new STATE[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*cell_size, j*cell_size, cell_size, cell_size);
      grid[i][j].display();
      state[i][j] = STATE.DEAD;
      next_state[i][j] = STATE.DEAD;
    }
  }
}

void draw() {
  background(255);

  // Start button
  fill(255);
  rect(620, 20, 60, 40);
  fill(0);
  textSize(20);
  text("Start", 628, 48);

  // Stop buttom
  fill(255);
  rect(620, 90, 60, 40);
  fill(0);
  textSize(20);
  text("Stop", 628, 118);

  // next Step
  fill(255);
  rect(620, 160, 60, 40);
  fill(0);
  textSize(15);
  text("1 Step", 628, 188);
  // Clear buttom

  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      if (flag)
        grid[i][j].goto_next_state();
      grid[i][j].display();
    }
  }

  mouseOver();
  swap_state();
  if (flag)
    delay(500);
}

void swap_state() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      state[i][j] = next_state[i][j];
    }
  }
}

void mousePressed() {

  // Cell
  if (mouseX < cell_size*rows && mouseY < cell_size*cols) {
    int i = mouseX / cell_size;
    int j = mouseY / cell_size;
    grid[i][j].swap_state();
  }
  // Start buttom
  else if (620 <= mouseX && mouseX <= 680 && 20 <= mouseY && mouseY <= 60) {
    flag = true;
  }
  // Stop buttom
  else if (620 <= mouseX && mouseX <= 680 && 90 <= mouseY && mouseY <= 130) {
    flag = false;
  }
  // Next Step
  else if (620 <= mouseX && mouseX <= 680 && 160 <= mouseY && mouseY <= 200) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // Oscillate and display each object
        grid[i][j].goto_next_state();
        grid[i][j].display();
      }
    }
  }
  // Clear buttom
}

void mouseOver() {
  if (mouseX < cell_size*rows && mouseY < cell_size*cols) {
    int i = mouseX / cell_size;
    int j = mouseY / cell_size;
    grid[i][j].mouseOver();
  } else if (620 <= mouseX && mouseX <= 680 && 20 <= mouseY && mouseY <= 60) {
    fill(#D7F7E9);
    rect(620, 20, 60, 40);
    fill(0);
    textSize(20);
    text("Start", 628, 48);
  } else if (620 <= mouseX && mouseX <= 680 && 90 <= mouseY && mouseY <= 130) {
    fill(#D7F7E9);
    rect(620, 90, 60, 40);
    fill(0);
    textSize(20);
    text("Stop", 628, 118);
  }
}

int count_live_surrounding_cell(int tmp_i, int tmp_j) {
  int ret = 0;

  for (int i = (tmp_i-1>0 ? tmp_i-1 : 0); i < (rows > tmp_i+1 ? tmp_i+2 : rows); i++) {
    for (int j = (tmp_j-1>0 ? tmp_j-1 : 0); j < (cols > tmp_j+1 ? tmp_j+2 : cols); j++) {
      if (state[i][j] == STATE.LIVE && !(tmp_i==i && tmp_j == j) )
        ret++;
    }
  }

  return ret;
}


// A Cell object.
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x, y;   // x,y location
  float w, h;   // width and height
  int i, j;
  int _color;
  int _state;

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    _state = 0;
    _color = DEAD_COLOR;
    i = (int)x/cell_size;
    j = (int)y/cell_size;
  } 

  void goto_next_state() {
    int num = count_live_surrounding_cell(i, j);
    System.out.println("i:"+i+",j:" + j + ",num:" + num);

    if ((_state > 0 && live_condition_more <= num && num <= live_condition_less && state[i][j] != STATE.REST) || 
        (_state == 0 && num == born_condition) ) {         // next live.
        _state = rest_time;
        next_state[i][j] = STATE.LIVE;
      }else if(_state > 0){                               // next rest.
        _state--; 
        next_state[i][j] = STATE.REST;
      }else
        next_state[i][j] = STATE.DEAD;

    set_cell_color();
  }

  void set_cell_color() {
    if (_state == 0)
      _color = DEAD_COLOR;
    else if (_state == rest_time)
      _color = LIVE_COLOR;
    else
      _color = REST_COLOR;
  }

  void display() {
    stroke(0);
    fill(_color);
    rect(x, y, w, h);
  }

  void go_live() {
    _state = rest_time;
    next_state[i][j] = STATE.LIVE;
    set_cell_color();
    display();
  }

  void go_dead() {
    _state = 0;
    next_state[i][j] = STATE.DEAD;
    set_cell_color();
    display();
  }

  void swap_state() {
    if (_state == 0)
      go_live();
    else
      go_dead();
  }

  void mouseOver() {
    if (_state == 0) {
      stroke(0);
      fill(230);
      rect(x, y, w, h);
    }
  }
}