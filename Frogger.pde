Frog frog;
Lane[] lanes;
int SAFETY = 0;
int CAR = 1;
int LOG = 2;
int lives = 3;
float grid = 50;
PImage img;
int level = 0;

//If reset game is added, might want to create frog else where at another time
void resetGame() {
  //creating frog, Frog(width location, height location)
  frog = new Frog(width/2-grid/2,height-grid,grid);
  frog.attach(null);
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Game Over..",width/2, height/2);
  fill(255);
  text("Click to play again",width/2, height/2+40);
  if(mousePressed){
     lives = 3;
     resetGame();
  }
}

//Fix the sizing of the win game hahahahahaha
void winGame(){
  background(255,255,0);
 // boolean key = false;
 // while(key != true){
    fill(0);
    textAlign(CENTER,CENTER);
    //text("You win!!!",width/2, height/2);
    //fill(0);
    //text("Click to play again",width/2,height/2+40);
    text("Press any key to reset this level",width/2, height/2+40);
    fill(0);
    text("Or click the mouse to move onto level 2",width/2,height/2+60);
    // if(keyPressed){
    //   lives = 3;
    //   resetGame();
    //   key = true;
    // }
    if(mousePressed){
    //  level++;
      lives = 3;
      resetGame();
    //  key = true;
   // }
  }
}

//Setting up the game
void setup() {
//size of game, make divisible by 50 for better results
  size(500, 550);
  resetGame();
  textSize(20);
  img = loadImage("Frog.png");
  loadLanesRound1();
 // loadGame();
  //number of lanes based on height
  // int totalLanes = int(height/grid +1);
  // lanes = new Lane[totalLanes];
  // if(level == 0){
  //   loadLanesRound1();
  // }
  // if(level == 1){
  //   loadLanesRound2();
}

void draw() {
  background(0);
  for(Lane lane : lanes) {
    lane.run();
  }
  int laneIndex = int(frog.y / grid);
  if(laneIndex > width || laneIndex > height){
    resetGame();
    lives--;
  }
  lanes[laneIndex].check(frog);
  if(laneIndex == 0){
   winGame();
  }
  if(lives <= 0){
    gameOver();
  }else{
    frog.show();
    frog.update();
  }
  //loadGame();
 // scores();
}

void loadGame(){
  if(level == 0){
    loadLanesRound1();
  }
  if(level == 1){
    loadLanesRound2();
  }
}

void scores(){
 fill(10);
 text("Lives: " + lives, width-80, height-35);
}

void loadLanesRound1(){
//Lane(index, what type, how many obs, width of obs * grid, space between obs, speed of obs, type again for color)
//for color lane
//LANE(index, color())
//for win lane
//Lane(index, number of obstacles covering, type to change the color of obs, color)
  int totalLanes = int(height/grid +1);
  lanes = new Lane[totalLanes];
  lanes[0] = new Lane(0, 4, CAR);
  //logs
  lanes[1] = new Lane(1,LOG, 3,1,175,3,LOG);
  lanes[2] = new Lane(2,LOG, 4,1,200,-3,LOG);
  lanes[3] = new Lane(3,LOG, 3,2,225,4,LOG);
  lanes[4] = new Lane(4,LOG, 4,1,175,-2,LOG);
  //safety
  lanes[5] = new Lane(5, color(220,220,70));
  //road with cars
  lanes[6] = new Lane(6,CAR, 3,2,255,1,CAR);
  lanes[7] = new Lane(7,CAR, 2,1,150,-2,CAR);
  lanes[8] = new Lane(8,CAR, 2,3,350,3,CAR);
  lanes[9] = new Lane(9,CAR, 1,2,175,2,CAR);
  //start
  lanes[10] = new Lane(10, color(220,220,70));
  //lane so that they can't go below bottom row.
  lanes[11] = new Lane(11, color(0));
}

void loadLanesRound2(){
  /*
  Lane(index, what type, how many obs, width of obs * grid, space between obs, speed of obs, type again for color)
  for color lane
  LANE(index, color())
  for win lane
  Lane(index, number of obstacles covering, type to change the color of obs, color)
  */
  //Passed in log this time to match the color of the road
  int totalLanes = int(height/grid +1);
  lanes = new Lane[totalLanes];
  lanes[0] = new Lane(0, 4, LOG);
  lanes[1] = new Lane(1,CAR, 3,1,175,3,CAR);
  lanes[2] = new Lane(2,CAR, 4,1,200,-3,CAR);
  lanes[3] = new Lane(3,CAR, 3,2,225,4,CAR);
  lanes[4] = new Lane(4,CAR, 4,1,175,-2,CAR);
  lanes[5] = new Lane(5, color(220,220,70));
  lanes[6] = new Lane(6,LOG, 3,2,255,1,LOG);
  lanes[7] = new Lane(7,LOG, 2,1,150,-2,LOG);
  lanes[8] = new Lane(8,LOG, 2,3,350,3,LOG);
  lanes[9] = new Lane(9,LOG, 1,2,175,2,LOG);
  lanes[10] = new Lane(10, color(220,220,70));
  lanes[11] = new Lane(11, color(0));
}

void keyPressed() {
  int laneIndex = int(frog.y / grid);
  if(laneIndex != 0){
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
}
