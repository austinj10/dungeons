class DroppedItem extends GameObject {

  int type;
  int guns;
  Weapon w;

  DroppedItem(float x, float y, int rx, int ry) {
    type = (int)random(3);
    if (type == 0) type = SIZE;
    if (type == 1) type = HEALTH;
    if (type == 2) type = GUN;
    { 
      guns = (int)random(4);
      if (guns == 0) w = new Shotgun();
      if (guns == 1) w = new Pistol();
      if (guns == 2) w = new Sniper();
      if (guns == 3) w = new MachineGun();
    }
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c  = yellow;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    if (type == HEALTH) {
      //fill(red);
      //circle(location.x, location.y, size);
      heart.show(location.x, location.y, size*1.5, size*1.5);
    }
    if (type == SIZE) {
      fill(black);
      image(shrink, location.x, location.y,size*1.75,size*1.75);
    }
    if (type == GUN) {
      fill(purple);
      image(gun,location.x,location.y,size*1.5,size*1.5);
    }
  }

  void act() {
  }
}
