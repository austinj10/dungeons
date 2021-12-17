class Bullet extends GameObject {

  int timer;

  //constructor(s)
  Bullet() {
    timer = 25;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = new PVector(0, 0);
    //velocity.setMag(10);
    size = 10;
  }

  Bullet(PVector mouse, int color1, int size1) {
    timer = 50;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = mouse;
    //velocity.setMag(20);
    size = size1;
    stone = color1;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }


  void show() {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    timer--;
    if (timer == 0) {
      hp = 0;
    }
  }
}
