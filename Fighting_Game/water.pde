//This class is for the drops that come form the leak in the ground 
class water{
  //The variables for making realistic gravity
  PVector location;
  PVector velocity;
  PVector gravity;
  
  water(){
    //Assigning the variables
    location = new PVector(870,825);
    velocity = new PVector(0,0);
    gravity = new PVector(0,0.2);
    //Makingit so the drops are random
    velocity.add(PVector.random2D());
  }
  
  
  float drawWater(){
    //Adding gravity
    location.add(velocity);
    velocity.add(gravity);
    
    //Drawing the drops
    fill(0,0,200);
    ellipse(location.x,location.y,10,10);
    
    //This is so the function knows if the drop is low enough to delete
    return location.y;
  }
}
