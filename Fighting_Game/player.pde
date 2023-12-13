//This class is for the 2 characters that the players control.
class player{
  
  //The variables for making realistic gravity
  PVector location;
  PVector velocity;
  PVector gravity;
  
  //Variables
  float playerX;
  float playerY;
  int playerNumber;
  //This is for immunity frames
  boolean hurt;
  int hurtCounter;
  int direction;
  int health;
  //Positions of the arms
  float[] arms = {90, -130, 90, 0, 90, 130};
  
  
  player(int i){
    //The variables that are the same for both players
    hurtCounter=0;
    playerY=700;
    health=100;
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    gravity = new PVector(0,0.1);
    //The variables that are unique for both players
    if (i==1){
      playerX=300;
      playerNumber=1;
      direction=1;
    }
    if (i==0){
      playerX=980;
      playerNumber=2;
      direction=-1;
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    location.add(velocity);
    playerY+=location.y;
    //Adding gravity if the player is off the ground
    if (playerY <= 700) {
      velocity.add(gravity);
      playerY+=location.y;
    }
    else{
      //Stoping gravity if the player is on the ground
      playerY=700;
      velocity.y=0;
      location.y=0;
    }
    if (velocity.y>0){
    velocity=velocity.mult(velocity, 1.1);
    }
    //Lowers the time of immunity by one until you are no longer immune to damage
    hurtCounter-=1;
    if (hurtCounter<0){
      hurt=false;
    }
    //Unique key press actions for the first player
    if (playerNumber==1){
    switch(playerMode1) { 
      case 'a': //moveLeft
        println("x");
        playerX-=20;
        direction=-1;
        break; 
      case 'd': //moveRight
        println("x");  
        playerX+=20;
        direction=1;
        break; 
      case 'w': 
      //Jump
        break; 
      case 'z': //upAttack
      fill(0,166,0);
        rect(playerX+(arms[0])*direction,playerY+(arms[1]),200,40); //Top Arm
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 2 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)/80)-1)*-40*direction;
        }
        break; 
      case 'x': //midAttack
      fill(0,166,0);
        rect(playerX+(arms[2])*direction,playerY+(arms[3]),200,40);//Middle Arm
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 2 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)/80)-1)*-40*direction;
        }
        break; 
      case 'c': //downAttack
      fill(0,166,0);
        rect(playerX+(arms[4])*direction,playerY+(arms[5]),200,40); //Bottom Arm
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 2 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)/80)-1)*-40*direction;
        }
        break; 
      default://Idle
        break;
    }
    playerMode1='0';//Resets to it will not do an action without being told to by the keys
    //Body
    fill(0,166,0);
    rect(playerX,playerY+40, 130, 210);
    ellipse(playerX,playerY-100,130,130);
    //Eyes
    fill(255,255,255);
    ellipse(playerX-30,playerY-110,30,30);
    ellipse(playerX+30,playerY-110,30,30);
    fill(0,0,0);
    ellipse(playerX+40*direction,playerY-110,10,10);
    ellipse(playerX-20*direction,playerY-110,10,10);
    //Eyebrows
    line(playerX,playerY-100,playerX-40,playerY-140);
    line(playerX,playerY-100,playerX+40,playerY-140);
    line(playerX-30,playerY-70,playerX+30,playerY-70);
    }
    //Unique key press actions for the second player
    if (playerNumber==2){
    switch(playerMode2) { 
      case 'j': //moveLeft
        println("x");
        playerX-=20;
        direction=-1;
        break; 
      case 'l': //moveRight
        println("x");  
        playerX+=20;
        direction=1;
        break; 
      case 'i': //jump
        //println("Jump! :D"); 
        //if (playerY >= 700) {
        //  velocity.y -= 1;
        //}
        break; 
      case 'm': //upAttack
      fill(160,0,0);
        rect(playerX+(arms[0])*direction,playerY+(arms[1]),200,40); //Top Arm
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 1 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130)/80)-1)*-40*direction;
        }
        //println(player[1].playerX);
        break; 
      case ',': //midAttack
      fill(160,0,0);
        rect(playerX+(arms[2])*direction,playerY+(arms[3]),200,40); //Middle Arm
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 1 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY)/80)-1)*-40*direction;
        }
        break; 
      case '.': //downAttack
      fill(160,0,0);
        rect(playerX+(arms[4])*direction,playerY+(arms[5]),200,40); //Bottom Arm
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 1 hurt");
          //Starts the immunity frames
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130)/80)-1)*-40*direction;
        }
        break; 
      default://Idle
        break;
    }
    playerMode2='0';//Resets to it will not do an action without being told to by the keys
    //Body
    fill(160,0,0);
    rect(playerX,playerY+40, 130, 210);
    ellipse(playerX,playerY-100,130,130);
    //Eyes
    fill(255,255,255);
    ellipse(playerX-30,playerY-110,30,30);
    ellipse(playerX+30,playerY-110,30,30);
    fill(0,0,0);
    ellipse(playerX+34*direction,playerY-110,20,20);
    ellipse(playerX-26*direction,playerY-110,20,20);
    //Eyebrows
    strokeWeight(8);
    line(playerX+40,playerY-125,playerX-40,playerY-125);
    strokeWeight(2);
    line(playerX-30,playerY-70,playerX+30,playerY-70);
    }
    
    rectMode(CORNER);
  }
  //This is to transfer the key press from the key pressed function to the player one
  void updateMode(char mode) {
    if (playerNumber==1){
      playerMode1=mode;
      
    }
    if (playerNumber==2){
      playerMode2=mode;
    }
  }
}
