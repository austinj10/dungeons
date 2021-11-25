class DarknessCell {
  float opacity;
  float x,y,size;
  float d;
  
  DarknessCell(float _x, float _y, float s){
    size = s;
    x = _x;
    y = _y;
    d = 10;
    opacity = 0;
  }
  
  void show(){
    noStroke();
    d = dist(myHero.location.x,myHero.location.y,x,y);
    opacity = map(d, 0, 150, 0, 155);
    rectMode(CENTER);
    fill(0,opacity);
    square(x,y,size);
  }
  
  void act(){
    
  }
  
}
