
class player{
  
  //vector
  PVector location;
  PVector velocity;
  PVector gravity;
  
  
  float playerX;
  float playerY;
  int playerNumber;
  boolean hurt;
  int hurtCounter;
  int direction;
  
  player(int i){
    if (i==1){
      playerX=300;
      playerY=700;
      playerNumber=1;
      hurt=false;
      hurtCounter=0;
      direction=1;
    }
    if (i==0){
      playerX=980;
      playerY=700;
      playerNumber=2;
      hurt=false;
      hurtCounter=0;
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    //println(playerMode1);
    hurtCounter-=1;
    if (hurtCounter<0){
      hurt=false;
    }
    if (playerNumber==1){
    switch(playerMode1) { 
      case 'a': //moveLeft
        println("x");
        playerX-=10;
        direction=-1;
        break; 
      case 'd': //moveRight
        println("x");  
        playerX+=10;
        direction=1;
        break; 
      case 'w': //jump
        println("Jump! :D"); 
        break; 
      case 'z': //upAttack
        rect(playerX+90*direction,playerY-130,200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=50;
        }
        //println(player[1].playerX);
        break; 
      case 'x': //midAttack
        rect(playerX+90*direction,playerY,200,40);
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=50;
        }
        break; 
      case 'c': //downAttack
        rect(playerX+90*direction,playerY+130,200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=50;
        }
        break; 
      default://idle
        break;
    }
    playerMode1='0';
    rect(playerX,playerY, 130, 260);
    ellipse(playerX+175*direction,playerY,40,40);//mid
    ellipse(playerX+175*direction,playerY-130,40,40);//high
    ellipse(playerX+175*direction,playerY+130,40,40);//low
    fill(255,0,0);
    }
    if (playerNumber==2){
      
    }
    
    rectMode(CORNER);
  }
  
  void updateMode(char mode) {
    if (playerNumber==1){
      playerMode1=mode;
      
    }
    if (playerNumber==2){
      playerMode2=mode;
      
    }
  
  }
  
  
  
  
}
