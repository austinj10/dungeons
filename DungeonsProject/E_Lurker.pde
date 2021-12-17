class Lurker extends Enemy {
  AnimatedGIF currentAction;
  
  Lurker(int x, int y) {
    super(200, 25, x, y);
    xp = 2;
    currentAction = zombieDOWN;
    size = 50;
  }

  void show() {
    fill(100);
    fill(0);
    textSize(15);
    text(hp, location.x, location.y);
    currentAction.show(location.x,location.y,size/2,size);
  }
  
  void act() {
    super.act();
    
    if (abs(velocity.y) > abs(velocity.x)) {
      if (velocity.y > 0) currentAction = zombieDOWN;
      else currentAction = zombieUP;
    } else {
      if (velocity.x > 0) currentAction = zombieRIGHT;
      else currentAction = zombieLEFT;
    }
   
    if ((dist(myHero.location.x, myHero.location.y, location.x, location.y) <= b)) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    } else {
      velocity = new PVector(0, 0);
    }
    velocity.setMag(3.5);
  }
}
