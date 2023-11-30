
class player{
  
  float playerX;
  float playerY;
  int playerNumber;
  String playerMode1;
  
  player(int i){
    if (i==1){
      playerX=300;
      playerY=700;
      playerNumber=1;
      playerMode1="idle";
    }
    if (i==0){
      playerX=980;
      playerY=700;
      playerNumber=2;
      playerMode2="idle";
    }
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    if (playerNumber==1){
      if (playerMode1=="idle"){
        //Doing nothing
        rect(playerX,playerY, 130, 260);
      }
      if (playerMode1=="moveLeft"){
        
      }
      if (playerMode1=="moveRight"){
        
      }
      if (playerMode1=="jump"){
        println("Jump! :D");
        rect(playerX,playerY, 130, 260);
      }
      if (playerMode1=="upAttack"){
        
      }
      if (playerMode1=="midAttack"){
        
      }
      if (playerMode1=="downAttack"){
        
      }
    }
    else {
    
    rect(playerX,playerY, 130, 260);
    
    
    }
    
    
    rectMode(CORNER);
  }
  
  void updateMode(String mode) {
    if (playerNumber==1){
      playerMode1=mode;
      
    }
    if (playerNumber==2){
      playerMode2=mode;
      
    }
  
  }
  
  
  
  
}
