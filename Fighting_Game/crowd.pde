//This class is for the 12 audience members in the background
class crowd{
  // Declaring variables
  int placeX;
  int placeY;
  int animation;
  crowd(int i){
    //This math problem makes the crowd go in the grid formation on the screen
    placeX=(i%6)*200+100;
    placeY=(int(i/6))*240+280;
    //Default yellow
    animation=2;
  }
  
  void drawCrowd(){
    
    if (millis()%16==0){
      animation=int(random(1,4));
    }
    //This is the 3 different drawings the crowd can have
      if (animation==1) {
        //Green and on the left
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
        //Yellow and in the middle
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
        //Red and on the right
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
