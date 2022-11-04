class Lane extends Rectangle {
  Obstacle[] obstacles;
  int col;
  int type;
  
  //This is for the safe rows
  Lane(float index, color c) {
     super(0, index*grid, width, grid);
     type = SAFETY;
     obstacles = new Obstacle[0];
     col = c;
  }
  
  //This is for the end zone
  Lane(float index, int n, int t){
    super(0, index*grid, width,grid);
    obstacles = new Obstacle[n];
    type = t;
    float offset = 150;
    for(int i = 0; i < n; i++) {
       obstacles[i] = new Obstacle(offset * i, index*grid * i, grid + 25, grid, 0, 3); 
    }
    if(type == 1){
     col = color(3,0,64);
    }
    if(type == 2) {
      col = color(0);
    }
  }
  
 //Lane(height, what type, how many obs, width of obs * grid, space between obs, speed of obs) 
 //This is for the logs and cars
  Lane(float index, int t, int n, int len, float spacing, float speed, float col2){
   super(0, index*grid, width, grid);
   obstacles = new Obstacle[n];
   type = t;
   float offSet = random(0,200);
   for(int i = 0; i < n; i++) {
      obstacles[i] = new Obstacle(offSet + spacing * i, index*grid, grid*len, grid, speed, col2); 
   }
   if(type == 1){
     col = color(0);
   }
   else if(type == 2) {
    col = color(3,0,64); 
   }
  }
  
  void check(Frog frog) {
    //checking if avoiding cars
    scores();
    if(type == CAR) {
       for(Obstacle o : obstacles) {
         if(frog.intersects(o)){
           resetGame();
           lives--;
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
        lives--;
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
