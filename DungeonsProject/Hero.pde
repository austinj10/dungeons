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
  fill(unity);
  strokeWeight(3);
  stroke(shadow);
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
    
    
  }
  
}
  
