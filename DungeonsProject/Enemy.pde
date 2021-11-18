class Enemy extends GameObject {
  Enemy(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    hp = 100;
    roomX = 1; 
    roomY = 1;
    size = 75;
  }
  
  Enemy(int _hp, int s, int x, int y){
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y; 
  }
  
  
  void show(){
    fill(255);
    ellipse(location.x,location.y,size,size);
    fill(0);
    
    //hp text
    textSize(20);
    text(hp,location.x,location.y);
  }
  
  void act(){
    super.act();
    
    int i = 0;
    while(i < myObjects.size()){
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && !myObj.UFOBullet){ //myOjBulletTurret){ !BulletTurret){
        float d = dist(myObj.location.x,myObj.location.y,location.x,location.y);
        if (d <= size/2 + myObj.size/2){
          hp = hp - int(myObj.velocity.mag());
          if (hp <= 0){
            myObj.hp = 0;
          }  
        }
      }
      i++;
    }
  }
}
