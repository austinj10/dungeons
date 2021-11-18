class Turret extends Enemy{
  
  int shotTimer, threshold;
  float x;
  
  Turret(int x, int y){
    super(250,200,x,y);  
    hp = 10000;
  }
  
  void show(){
    fill(255);
    ellipse(location.x,location.y,5,5);
    fill(0);
    textSize(20);
    text(hp,location.x,location.y);
  }
  
  void act(){
     super.act(); 
     
     shotTimer++;
     if (shotTimer>threshold) {
      shotTimer = 0;
      PVector aim = new PVector();
      aim.setMag(10);
      myObjects.add(new BulletTurret(location.x, location.y, myHero.location.x-location.x, myHero.location.y-location.y));
    }
  
  }
}
