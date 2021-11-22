class GameObject {
  int roomX, roomY;
  PVector location;
  PVector velocity;
  int hp;
  int size;
  boolean UFOBullet;
  
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
    
 //simplify code
 boolean inRoomWith(GameObject obj){
   return(roomX == obj.roomX && roomY == obj.roomY);
   }
    
  boolean isCollidingWith(GameObject obj){
   return(dist(myHero.location.x, myHero.location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2);
  }
    
}
