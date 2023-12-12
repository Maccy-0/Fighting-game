
class water{
  
  PVector location;
  PVector velocity;
  PVector gravity;
  
  water(){
    //starting=PVector.random2D();
    location = new PVector(870,825);
    velocity = new PVector(0,0);
    gravity = new PVector(0,0.2);
    velocity.add(PVector.random2D());
    
  }
  
  
  
  
  float drawWater(){
    location.add(velocity);
    velocity.add(gravity);
    
    fill(0,0,200);
    ellipse(location.x,location.y,10,10);
    
    return location.y;
  }
  
  
  
  
  
  
  
}
