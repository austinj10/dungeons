class Turret extends Enemy{
  
  int shotTimer, threshold;
  float x;
  
  Turret(int x, int y){
    super(500,50,x,y);  
    shotTimer = threshold = 200;
  }
  
  void show(){
    fill(255);
    ellipse(location.x,location.y,50,50);
    fill(0);
    textSize(20);
    text(hp,location.x,location.y);
  }
  
  void act(){
     super.act(); 

     shotTimer++;
     if (shotTimer>threshold) {
      myObjects.add(new BulletTurret());
      shotTimer = 0;
    } 
  
  }
}
