
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
  float[] arms = {90, -130, 90, 0, 90, 130};
  
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
      println("Hello1");
    }
    if (i==0){
      playerX=980;
      playerNumber=2;
      direction=-1;
      println("Hello2");
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    location.add(velocity);
    //println(location.y);
    playerY+=location.y;
    //println(playerY);
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
    velocity=velocity.mult(velocity, 1.1);
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
        playerX-=20;
        direction=-1;
        break; 
      case 'd': //moveRight
        println("x");  
        playerX+=20;
        direction=1;
        break; 
      case 'w': //jump
        //println("Jump! :D"); 
        //if (playerY >= 700) {
        //  velocity.y -= 1;
        //}
        break; 
      case 'z': //upAttack
      fill(0,166,0);
        rect(playerX+(arms[0])*direction,playerY+(arms[1]),200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY-130)/80)-1)*-40*direction;
        }
        //println(player[1].playerX);
        break; 
      case 'x': //midAttack
      fill(0,166,0);
        rect(playerX+(arms[2])*direction,playerY+(arms[3]),200,40);
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY)/80)-1)*-40*direction;
        }
        break; 
      case 'c': //downAttack
      fill(0,166,0);
        rect(playerX+(arms[4])*direction,playerY+(arms[5]),200,40); 
        println(dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130));
        if (dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 2 hurt");
          hurt=true;
          hurtCounter=30;
          player[0].playerX+=((dist(player[0].playerX,player[0].playerY,playerX+175*direction,playerY+130)/80)-1)*-40*direction;
        }
        break; 
      default://idle
        break;
    }
    playerMode1='0';
    fill(0,166,0);
    rect(playerX,playerY+40, 130, 210);
    ellipse(playerX,playerY-100,130,130);
    fill(255,255,255);
    ellipse(playerX-30,playerY-110,30,30);
    ellipse(playerX+30,playerY-110,30,30);
    fill(0,0,0);
    ellipse(playerX+40*direction,playerY-110,10,10);
    ellipse(playerX-20*direction,playerY-110,10,10);
    line(playerX,playerY-100,playerX-40,playerY-140);
    line(playerX,playerY-100,playerX+40,playerY-140);
    line(playerX-30,playerY-70,playerX+30,playerY-70);
    //ellipse(playerX+175*direction,playerY,40,40);//mid
    //ellipse(playerX+175*direction,playerY-130,40,40);//high
    //ellipse(playerX+175*direction,playerY+130,40,40);//low
    fill(255,0,0);
    }//yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
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
        rect(playerX+(arms[0])*direction,playerY+(arms[1]),200,40); 
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130)<80 && !hurt){
          print("Player 1 hurt");
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY-130)/80)-1)*-40*direction;
        }
        //println(player[1].playerX);
        break; 
      case ',': //midAttack
      fill(160,0,0);
        rect(playerX+(arms[2])*direction,playerY+(arms[3]),200,40);
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY)<80 && !hurt){
          print("Player 1 hurt");
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY)/80)-1)*-40*direction;
        }
        break; 
      case '.': //downAttack
      fill(160,0,0);
        rect(playerX+(arms[4])*direction,playerY+(arms[5]),200,40); 
        println(dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130));
        if (dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130)<80 && !hurt){
          print("Player 1 hurt");
          hurt=true;
          hurtCounter=30;
          player[1].playerX+=((dist(player[1].playerX,player[1].playerY,playerX+175*direction,playerY+130)/80)-1)*-40*direction;
        }
        break; 
      default://idle
        break;
    }
    playerMode2='0';
    fill(160,0,0);
    rect(playerX,playerY+40, 130, 210);
    ellipse(playerX,playerY-100,130,130);
    fill(255,255,255);
    ellipse(playerX-30,playerY-110,30,30);
    ellipse(playerX+30,playerY-110,30,30);
    fill(0,0,0);
    ellipse(playerX+34*direction,playerY-110,20,20);
    ellipse(playerX-26*direction,playerY-110,20,20);
    //line(playerX,payerY-100,playerX-40,playerY-140);
    //line(playerX,playerY-100,playerX+40,playerY-140);
    strokeWeight(8);
    line(playerX+40,playerY-125,playerX-40,playerY-125);
    strokeWeight(2);
    line(playerX-30,playerY-70,playerX+30,playerY-70);
    //ellipse(playerX+175*direction,playerY,40,40);//mid
    //ellipse(playerX+175*direction,playerY-130,40,40);//high
    //ellipse(playerX+175*direction,playerY+130,40,40);//low
    fill(255,0,0);
    }
    
    rectMode(CORNER);
  }
  
  void updateMode(char mode) {
    if (playerNumber==1){
      playerMode1=mode;
      println("wor1");
      
    }
    if (playerNumber==2){
      playerMode2=mode;
      println("wor2");
    }
  
  }
  
  
  
  
}
