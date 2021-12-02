class BulletTurret extends GameObject {
  int timer;


  //constructor(s)
  BulletTurret() {
    timer = 25;
    location = new PVector(location.x, location.y);
    velocity = new PVector(myHero.velocity.x+(myHero.location.x-location.x), myHero.velocity.y+(myHero.location.y-location.y));
    velocity.setMag(10);
    size = 10;
  }


  BulletTurret(float locx, float locy, float velx, float vely) {
    timer = 60;
    hp = 1;
    location = new PVector(locx, locy);
    velocity = new PVector(velx, vely);
    velocity.setMag(7);
    size = 10;
  }

  void show() {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, size, size);
    println("a");
  }

  void act() {
    //location.add(velocity);
    timer--;
    if (timer == 0) {
      hp = 0;
    }
  }
}
