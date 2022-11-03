class Frog extends Rectangle {
  Obstacle attached = null;
  Frog(float x, float y, float w) {
    super(x,y,w,w);
  }
  
  void attach(Obstacle log) {
   attached = log; 
  }

  void show() {
    fill(0, 255, 0, 200);
    rect(x,y,w,w);
  }
  
  void terminate(){
     fill(0,0,0,0);
  }
  
  void update() {
    if (attached != null) {
     frog.x += attached.speed; 
    }
    frog.x = constrain(x,0,width-w);
    frog.y = constrain(y, 0,height-w);
  }
  //This is the frog moving
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
    frog.attach(null);
  }
}
