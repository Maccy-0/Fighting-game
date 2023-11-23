
class crowd{
  int placeX;
  int placeY;
  int colour;
  int animation;
  crowd(int i){
    placeX=(i%6)*200+100;
    placeY=(int(i/6))*240+280;
    colour=int(random(1,4));
  }
  
  void drawCrowd(){
    //Later this should be a drawing but for now placholder rectangle
    fill(0,255,0);
    rect(placeX,placeY,80,100);
    
    if (millis()%10==0){
      animation=int(random(1,4));
    }
    //This will be 3 diffrent animations proper but for now this is just making sure it works. 
      if (animation==1) {
        triangle(placeX,placeY,placeX+80,placeY,placeX+0,placeY-80);
      }
      else if (animation==2) {
        triangle(placeX,placeY,placeX+80,placeY,placeX+80,placeY-80);
      }
      else{
        triangle(placeX,placeY,placeX+80,placeY,placeX+40,placeY-80);
      }
    
    
  }
  
  
  
  
}
