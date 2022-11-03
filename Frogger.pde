Frog frog;
Lane[] lanes;
int SAFETY = 0;
int CAR = 1;
int LOG = 2;
//PImage img;

float grid = 50;
//If reset game is added, might want to create frog else where at another time
void resetGame() {
  //creating frog, Frog(width location, height location)
  frog = new Frog(width/2-grid/2,height-grid,grid);
  frog.attach(null);
}  
//Setting up the game
void setup() {
  //size of game, make divisible by 50 for better results
  size(500, 550);
 // img = loadImage("Frog.png");
  resetGame();
  //number of lanes based on height
  int totalLanes = int(height/grid +1);
  lanes = new Lane[totalLanes];
//Lane(height, what type, how many obs, width of obs * grid, space between obs, speed of obs)
  lanes[0] = new Lane(0, color(100));
  //logs
  lanes[1] = new Lane(1,LOG, 3,1,150,2);
  lanes[2] = new Lane(2,LOG, 4,1,150,-3);
  lanes[3] = new Lane(3,LOG, 3,2,150,4);
  lanes[4] = new Lane(4,LOG, 4,1,150,-2);
  //safety
  lanes[5] = new Lane(5, color(100));
  //road with cars
  lanes[6] = new Lane(6,CAR, 3,2,250,1);
  lanes[7] = new Lane(7,CAR, 2,1,150,-2);
  lanes[8] = new Lane(8,CAR, 2,3,350,3);
  lanes[9] = new Lane(9,CAR, 1,2,175,2);
  //start
  lanes[10] = new Lane(10, color(100));
  //lane so that they can't go below bottom row.
  lanes[11] = new Lane(11, color(0));
}
void draw() {
  background(0);
  //image(img,grid,width/2-grid/2,height-grid,grid);
 // image(img,0,0);
  for(Lane lane : lanes) {
    lane.run(); 
  }
  int laneIndex = int(frog.y / grid);
  if(laneIndex > width || laneIndex > height){
    resetGame();
  }
  lanes[laneIndex].check(frog);
  frog.update();
  frog.show();
}

void keyPressed() {
  switch(keyCode) {
    //uses the move method in frog
    case UP: frog.move(0,-1);
      break;
    case DOWN: frog.move(0,1);
      break;
    case RIGHT: frog.move(1,0);
      break;
    case LEFT:  frog.move(-1,0);
      break;
  }
}
