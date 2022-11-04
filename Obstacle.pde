class Obstacle extends Rectangle {
  float speed;
  float col;
  
  Obstacle(float x, float y, float w, float h, float s, float c){
    super(x,y,w,h);
    speed = s;
    col = c;
  }
  
  void update() {
    x = x + speed;
    if(speed > 0 && x > width+grid) {
     x = -w-grid; 
    } else if (speed < 0 && x < -width-grid) {
      x = width+grid;
    }
  }
  void show() {
    if(col == 1) {
      fill(140,0,210);
    }
    if(col == 2){
      fill(95,60,40);
    }
    if(col == 3){
      fill(15,57,28);
    }
    rect(x,y,w,h);
  }
}
