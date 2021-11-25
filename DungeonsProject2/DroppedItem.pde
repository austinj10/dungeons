class DroppedItem extends GameObject {
  
  int type;
  int guns;
  Weapon w;
  
  DroppedItem(float x, float y, int rx, int ry){
    type = (int)random(3);
    if (type == 0) type = AMMO;
    if (type == 1) type = HEALTH;
    if (type == 2) type = GUN;{
      guns = (int)random(4);
      if (guns == 0) w = new Shotgun();
      if (guns == 1) w = new Pistol();
      if (guns == 2) w = new Sniper();
      if (guns == 3) w = new MachineGun();
      }
    hp = 1;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c  = yellow;
  }
  
  void show(){
    stroke(black);
    strokeWeight(2);
    if (type == HEALTH){
      fill(red);
    }
    if (type == AMMO){
      fill(black);
    }
    if (type == GUN){
      fill(purple);
    }
    circle(location.x, location.y, size);
  }
  
  void act(){
    
  }
  
  
  
}
