class Spawner extends Enemy {
  int timer;
  
  
  Spawner(int x, int y){
    super(1000,175,x,y);
    timer = 0;
  }
    
 void show() {
    fill(0);
    ellipse(location.x, location.y, 175, 175);
    fill(255);
    textSize(20);
    text(hp, location.x, location.y);
  }
  void act() {
    super.act();
    timer++;
    
    if (timer > 175){
     myObjects.add(new Follower(roomX,roomY)); 
     timer = 0;
    } 
  }
    
    
  
  
  
  
  
  
  
  
}
