//Fighting Game (Title in progress)
//To do
//Make game states. Start, end...
//Draw background and UI
//Make the tiles 
//Push the file
//Make the croud (All of it)
//Done

String gameState="start";


//Ground class. All 60 boxes.
crowd[] crowd = new crowd[60];

void setup(){
  //Basic setup.
  size(1280, 1024);
  frameRate(30);
  background(0,153,255);
  strokeWeight(2);
  //Starting values.
  
  //remove later
  gameState="main";
  
}

void draw(){
  //The 3 states of the game
  if (gameState=="start"){
    start();
  }
  if (gameState=="main"){
    //This is for the main gameplay
    main();
    for (int i=0; i<60; i++) {
      crowd[i]= new crowd(i);
    }
  }
  if (gameState=="end"){
    end();
  }
  
  
}

void start(){
  
  
  
}

void main(){
  //println("Works");
  drawBackground();
  
}

void end(){
  
  
  
}



void drawBackground(){
  fill (160, 160, 160);
  rect(0,824,1280,1024);
  tiles(); //This will be redone when I add the interaciblty. This is just to see how it looks.
  
}


void tiles(){
  for (int i = 0; i < 4; i = i+1){
    for (int j = 0; j < 12; j = j+1){
      fill(255,160,50+50*(j%2));
      rect(0+j*106.66666666666666666666666666667,824+i*50,106.66666666666666666666666666667,50);
    }
    
  }
  
}
