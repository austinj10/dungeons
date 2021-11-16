class Hero extends GameObject{

  float speed; 
  Weapon myWeapon;
  boolean immunity;
  int immunitytimer;
  
  Hero(){
    super();//gameobject constructor
    hp = 5;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 50;
    myWeapon = new Pistol();
    
    immunity = true;
    immunitytimer = 0;
  }
 
  void show(){    
    if (immunity == true){
      fill(255);
    } else {
      fill(unity);
    }

    strokeWeight(3);
    stroke(shadow);
    ellipse(location.x,location.y,size,size);
  }

  void act(){
    super.act();
    
    //move
    if (upkey) velocity.y = -speed;
    if (leftkey) velocity.x = -speed; 
    if (downkey) velocity.y = speed;
    if (rightkey) velocity.x = speed; 
    
    //same diagonal speed
    if(velocity.mag() > 5) velocity.setMag(speed);
    
    //stop
    if (!leftkey && !rightkey) velocity.x = 0;
    if (!downkey && !upkey) velocity.y = 0;
    
    //check exits
    if (northroom != #FFFFFF && location.y <= 60 && location.x >= width/2-50 && location.x <= width/2+50){
      roomY--;
      location = new PVector(width/2,height-65);
    }
    if (eastroom != #FFFFFF && location.x >= width-75 && location.y >= height/2-50 && location.y <= height/2+50){//works
      roomX++;
      location = new PVector(80,height/2);
    }
    if (southroom != #FFFFFF && location.y >= height-60 && location.x >= width/2-50 && location.x <= width/2+50){//works
      roomY++;
      location = new PVector(width/2,65);
    }
    if (westroom != #FFFFFF && location.x <= 75 && location.y >= height/2-50 && location.y <= height/2+50){
      roomX--;
      location = new PVector(width-80,height/2);
    }
    
    //weapon
    myWeapon.update();
    if (spacekey) myWeapon.shoot();
    
    //immunity
    if (immunity == true){
      immunitytimer++;
    } 
    if (immunitytimer > 150){
      immunity = false;
      immunitytimer = 0;
    }
    
  //lose lives
  int i = 0;  
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Enemy && roomX == obj.roomX && roomY == obj.roomY){//|| obj instanceof Bullet && obj.Enemybullet) {
        if (dist(myHero.location.x, myHero.location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) {
          if (immunity == false) {
            myHero.hp--;
            immunitytimer = 0;
            immunity = true;
            //for (int j=0; j<random(10, 20); j++) myObjects.add(new particles(location.x, location.y, 245));
            }
         }
      }
      i++;
    }
    if (myHero.hp == 0) mode = gameover;
  }
}
  
