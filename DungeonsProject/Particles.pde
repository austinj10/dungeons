class particles extends GameObject { 
  
  int time;
  int shade;
  
  particles(float x, float y, int colour){
    hp = 1;
    location = new PVector(x,y);
    velocity = new PVector(random(3, 5), random(3, 5));
    velocity.rotate(random(360));//180 degrees change
    velocity.setMag(10);
    time = 250;
    size = 7;
    hp = 1;
    shade = colour;
  }
  
  void show(){
    noStroke();
    fill(shade, time);
    rect(location.x,location.y,size,size);
    //square(location.x, location.y, size);
  }
  
  void act(){
    noStroke();
    fill(255, time);
    super.act();
    time = time - 8;
    if (time <= 0) hp = 0;
  }
  
  
}
