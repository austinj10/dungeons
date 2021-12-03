class particles extends GameObject { 

  int time;
  int colour;
  int size;

  particles(int _s, float x, float y, color c) {
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(3, 3);
    velocity.rotate(random(360));//180 degrees change
    velocity.setMag(random(-2, 2));
    time = 250;
    size = _s;
    colour = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    noStroke();
    fill(colour, time);
    rect(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    time = time - 8;
    if (time <= 0) hp = 0;
  }
}
