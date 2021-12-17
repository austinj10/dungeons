class BulletTurret extends GameObject {
  int timer;


  //constructor(s)
  BulletTurret() {
    timer = 10;
    location = new PVector(location.x, location.y);
    velocity = new PVector(myHero.location.x, myHero.location.y);
    velocity.setMag(10);
    size = 25;
  }

  BulletTurret(PVector aim,float locx, float locy) {
    timer = 60;
    hp = 1;
    location = new PVector(locx, locy);
    velocity = aim;
    velocity.setMag(7);
    size = 25;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    image(fireball,location.x,location.y,size,size);
    stroke(0);
    fill(0);
    //ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    timer--;
    if (timer == 0) {
      hp = 0;
    }
  }
}
