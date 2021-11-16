class Turret extends Enemy{
  
  int shotTimer, threshold;
  float x;
  
  Turret(int x, int y){
    super(250,200,x,y);  
  }
  
  void show(){
    fill(255);
    ellipse(location.x,location.y,size,size);
    fill(0);
    textSize(20);
    text(hp,location.x,location.y);
  }
  
  void act(){
     super.act(); 
     
     if (shotTimer>threshold) {
      shotTimer = 0;
      myObjects.add(new Bullet(location.x, location.y, myHero.location.x-location.x, myHero.location.y-location.y));
    }
  
  }
}
