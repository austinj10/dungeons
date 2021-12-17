class Turret extends Enemy {
  AnimatedGIF currentAction;
  int shotTimer, threshold;
  float x;

  Turret(int x, int y) {
    super(500, 50, x, y);  
    shotTimer = threshold = 50;
    currentAction = dragonDOWN;
    xp = 2;
    size = 100;
  }

  void show() {
    fill(255);
    //ellipse(location.x, location.y, 50, 50);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y);
    currentAction.show(location.x, location.y, size, size);
  }

  void act() {
    super.act(); 

    shotTimer++;
    if (shotTimer>threshold) {
      PVector aimVector = new PVector (myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(1.5);
      myObjects.add(new BulletTurret(aimVector, location.x, location.y));
      shotTimer = 0;
    }
    
    if (myHero.location.x > 300 && myHero.location.x < 500) currentAction = dragonRIGHT;
    if (myHero.location.x < width/2) currentAction = dragonLEFT;
    //else currentAction = dragonLEFT;
  }
}
