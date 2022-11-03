class Lane extends Rectangle {
  Obstacle[] obstacles;
  int col;
  int type;
  
  Lane(float index, color c) {
     super(0, index*grid, width, grid);
     type = SAFETY;
     obstacles = new Obstacle[0];
     col = c;
  }
 //Lane(height, what type, how many obs, width of obs * grid, space between obs, speed of obs) 
  Lane(float index, int t, int n, int len, float spacing, float speed){
   super(0, index*grid, width, grid);
   obstacles = new Obstacle[n];
   type = t;
   float offSet = random(0,200);
   for(int i = 0; i < n; i++) {
      obstacles[i] = new Obstacle(offSet + spacing * i, index*grid, grid*len, grid, speed); 
   }
   if(type == 1){
     col = color(0);
   }
   else if(type == 2) {
    col = color(0,0,255); 
   }
  }
  
  void check(Frog frog) {
    //checking if avoiding cars
    if(type == CAR) {
       for(Obstacle o : obstacles) {
         if(frog.intersects(o)){
           resetGame();
         }
       }
       //checking if on log
     } else if(type == LOG) {
         boolean ok = false;
         for(Obstacle o : obstacles) {
          if(frog.intersects(o)) {
           ok = true;
           frog.attach(o);
          }
       }
       //if fall off log
       if(!ok){
        resetGame(); 
       }
     }
  }
  
  void run() {
    fill(col);
    rect(x,y,w,h);
    for(Obstacle o : obstacles){
      o.show();
      o.update();
    }
  }
} 
