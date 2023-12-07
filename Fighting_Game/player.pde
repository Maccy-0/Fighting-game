
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
  int health;
  
  player(int i){
    hurtCounter=0;
    playerY=700;
    health=100;
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    gravity = new PVector(0,0.1);
    if (i==1){
      playerX=300;
      playerNumber=1;
      direction=1;
    }
    if (i==0){
      playerX=980;
      playerNumber=2;
      direction=2;
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    location.add(velocity);
    println(location.y);
    playerY+=location.y;
    println(playerY);
    if (playerY <= 700) {
      velocity.add(gravity);
      playerY+=location.y;
    }
    else{
      playerY=700;
      velocity.y=0;
      location.y=0;
    }
    if (velocity.y>0){
    //????
    //velocity.muti(1.01, velocity);
      
    }
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
        //println("Jump! :D"); 
        //if (playerY >= 700) {
        //  velocity.y -= 1;
        //}
        break; 
      case 'z': //upAttack
        rect(playerX+90*direction,playerY-130,200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
        }
        //println(player[1].playerX);
        break; 
      case 'x': //midAttack
        rect(playerX+90*direction,playerY,200,40);
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
        }
        break; 
      case 'c': //downAttack
        rect(playerX+90*direction,playerY+130,200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
          
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
