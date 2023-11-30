
class player{
  
  float playerX;
  float playerY;
  int playerNumber;
  
  player(int i){
    if (i==1){
      playerX=300;
      playerY=700;
      playerNumber=1;
    }
    if (i==0){
      playerX=980;
      playerY=700;
      playerNumber=2;
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    println(playerMode1);
    switch(playerMode1) { 
      case 'a': //moveLeft
        println("x"); 
        break; 
      case 'd': //moveRight
        println("x");  
        break; 
      case 'w': //jump
        println("Jump! :D"); 
        break; 
      case 'z': //upAttack
        println("x");  
        break; 
      case 'x': //midAttack
        println("x"); 
        break; 
      case 'c': //downAttack
        println("x");  
        break; 
      default://idle
        break;
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
