class Follower extends Enemy{

  Follower(int x, int y){
    super(100,50,x,y);  
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
     
     velocity = new PVector (myHero.location.x - location.x, myHero.location.y - location.y);
     velocity.setMag(2.5);
  }
  
  
  
}
