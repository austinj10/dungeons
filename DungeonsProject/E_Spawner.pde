class Spawner extends Enemy {
  int timer;


  Spawner(int x, int y) {
    super(600, 175, x, y);
    timer = 0;
    xp = 3;
  }

  void show() {
    blackhole.show(location.x,location.y,size*1.25,size*1.25);
    fill(255);
    textSize(20);
    text(hp, location.x, location.y);
  }
  void act() {
    super.act();
    timer++;

    if (timer > 175) {
      myObjects.add(new Follower(roomX, roomY)); 
      timer = 0;
    }
    
    //size = size + 1;
    //if (size >= 300){
    // size = size - 2; 
    //} 
  }
}
