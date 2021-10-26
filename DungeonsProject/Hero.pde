class Hero extends GameObject{
 
  float speed; 
  int roomX, roomY;
  
  Hero(){
    super();//gameobject constructor
    speed = 5;
    roomX = 1;
    roomY = 1;
  }
 
  void show(){    
  fill(shadow);
  strokeWeight(3);
  ellipse(location.x,location.y,50,50);
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
  }
  
}
  
