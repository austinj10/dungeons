class GameObject {
  int roomX, roomY;
  PVector location;
  PVector velocity;
  int hp;
  int size;
  
  GameObject(){
    location = new PVector (width/2, height/2);
    velocity = new PVector(0,0);
    hp = 1;
  }
  
  void show(){
    
  }
  
  void act(){
    location.add(velocity);
    
    //hitting wall
    if (location.x < 75) location.x = 75;
    if (location.x > width-75) location.x = width-75;
    if (location.y < 60) location.y = 60;
    if (location.y > height-60) location.y = height-60;
  }
    
}
