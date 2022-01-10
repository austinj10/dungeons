class Follower extends Enemy {
 
  AnimatedGIF currentAction;
  
  
  Follower(int x, int y) {
    super(100, 50, x, y);
    xp = 1;
    currentAction = skeletonDOWN;
  }

  void show() {
    fill(255);
    //ellipse(location.x, location.y, size, size);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y);
    currentAction.show(location.x, location.y, size/1.5, size);
  }

  void act() {
    super.act(); 

    velocity = new PVector (myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(2.9);
    
     if (abs(velocity.y) > abs(velocity.x)) {
      if (velocity.y > 0) currentAction = skeletonDOWN;
      else currentAction = skeletonUP;
    } else {
      if (velocity.x > 0) currentAction = skeletonRIGHT;
      else currentAction = skeletonLEFT;
    }
  }
}
