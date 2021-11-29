class Hero extends GameObject{

  float speed; 
  Weapon myWeapon;
  boolean immunity;
  int immunitytimer;
  AnimatedGIF currentAction;
  
  Hero(){
    super();//gameobject constructor
    hp = 5;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 50;
    myWeapon = new MachineGun();
    immunity = true;
    immunitytimer = 0;
    //action
    currentAction = manDOWN; 
  }
 
  void show(){    
    if (immunity == true){
      fill(255);
    } else {
      fill(unity);
    }
    currentAction.show(location.x, location.y, size/1.5, size);
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
    
    if (abs(velocity.y) > abs(velocity.x)){
      if(velocity.y > 0) currentAction = manDOWN;
      else currentAction = manUP;
    } else {
      if (velocity.x > 0) currentAction = manRIGHT;
      else currentAction = manLEFT;
    }
    
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
    if (immunitytimer > 90){
      immunity = false;
      immunitytimer = 0;
    }
    
  //lose lives
  int i = 0;  
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Enemy && isCollidingWith(obj)){//|| obj instanceof Bullet && obj.Enemybullet) {
        if (dist(myHero.location.x, myHero.location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) {
          if (immunity == false) {
            myHero.hp--;
            explode(500,110,white);
            immunity = true;
            }
         }
      }
      if (obj instanceof DroppedItem && isCollidingWith(obj)){
        DroppedItem item = (DroppedItem) obj;
        if(item.type == GUN){
          myWeapon = item.w;
          item.hp = 0;
      }
        if(item.type == AMMO){
          //myWeapon = item.w;
          //item.hp = 0;
        }
        if(item.type == HEALTH){
          myHero.hp = myHero.hp + 1;
          item.hp = 0;
        }
      }
     i++;
    if (myHero.hp == 0) mode = gameover;
    }
  }
  }
  
