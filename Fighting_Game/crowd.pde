
class crowd{
  int placeX;
  int placeY;
  int colour;
  int animation;
  crowd(int i){
    placeX=(i%6)*200+100;
    placeY=(int(i/6))*240+280;
    colour=int(random(1,4));
    animation=2;
  }
  
  void drawCrowd(){
    //Later this should be a drawing but for now placholder rectangle
    fill(255,255,255);
    ellipse(placeX+20,placeY+30,20,20);
    ellipse(placeX+60,placeY+30,20,20);
    
    if (millis()%16==0){
      animation=int(random(1,4));
    }
    //This will be 3 diffrent animations proper but for now this is just making sure it works. 
      if (animation==1) {
        fill(0,255,0);
        rect(placeX,placeY,80,100);
        triangle(placeX,placeY,placeX+80,placeY,placeX+0,placeY-80);
        fill(255,255,255);
        ellipse(placeX+20,placeY+30,20,20);
        ellipse(placeX+60,placeY+30,20,20);
        fill(0);
        ellipse(placeX+15,placeY+30,10,10);
        ellipse(placeX+55,placeY+30,10,10);
      }
      else if (animation==2) {
        fill(255,255,0);
        rect(placeX,placeY,80,100);
        triangle(placeX,placeY,placeX+80,placeY,placeX+40,placeY-40);
        fill(255,255,255);
        ellipse(placeX+20,placeY+30,20,20);
        ellipse(placeX+60,placeY+30,20,20);
        fill(0);
        ellipse(placeX+20,placeY+35,10,10);
        ellipse(placeX+60,placeY+35,10,10);
      }
      else{
        fill(255,0,0);
        rect(placeX,placeY,80,100);
        triangle(placeX,placeY,placeX+80,placeY,placeX+80,placeY-80);
        fill(255,255,255);
        ellipse(placeX+20,placeY+30,20,20);
        ellipse(placeX+60,placeY+30,20,20);
        fill(0);
        ellipse(placeX+25,placeY+30,10,10);
        ellipse(placeX+65,placeY+30,10,10);
      }
    
    
  }
  
  
  
  
}
