void game(){

  
  drawRoom();
  drawGameObjects();
  drawDarkness();
  //drawLightLayer();
  drawMiniMap();
  
  //int i = 0;
  //while ( i < myObjects.size()) {
  // GameObject myObj = myObjects.get(i);
  // myObj.show();
  // myObj.act();
  //}
  //myHero.show();
  //myHero.act();
  

}

void drawRoom(){
 background(shadow);
 
 //corners
 stroke(stone);
 strokeWeight(3);
 line(0,0,width,height);
 line(width,0,0,height);
 
 //draw exits
 northroom = map.get(myHero.roomX, myHero.roomY-1);
 eastroom = map.get(myHero.roomX+1, myHero.roomY);
 southroom = map.get(myHero.roomX, myHero.roomY+1);
 westroom = map.get(myHero.roomX-1, myHero.roomY);
 
 noStroke();
 fill(0);
 if (northroom != #FFFFFF){
  ellipse(width/2,50,100,100); 
 }
 if (eastroom != #FFFFFF){
  ellipse(width-50,height/2,100,100); 
 }
 if (southroom != #FFFFFF){
  ellipse(width/2,height-50,100,100); 
 }
 if (westroom != #FFFFFF){
  ellipse(50,height/2,100,100); 
 }
 
 
 //floor
 stroke(shadow);
 fill(stone);
 rect(width/2,height/2,width-100,height-75);
}

void drawGameObjects(){
  int i = 0;
  while ( i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
  if (myObj.hp == 0) {
      myObjects.remove(i); 
    } else {
      i++;
    }
  }
}

void drawDarkness(){
  int i = 0;
  while ( i < darkness.size()) {
    DarknessCell myObj = darkness.get(i);
    myObj.show();
    i++;
  } 
}
  
  ////darkness
  //int ii = 0;
  //while (ii < darkness.size()){
  //  darkness.get(i).act();
  //  darkness.get(i).show();
  //  i++;
  

void drawMiniMap(){
  float opacity = 0;
  float size = 50;
  int x = 0;
  int y = 0;
  while(y < map.height){
     opacity = map(50, 0, 30, 0, 100);
     color c = map.get(x,y);
     fill(c,opacity);
     square(x*15+40,y*15+40,size-35);
     x = x + 1;;
     if (x >= map.width){
       x = 0;
       y = y + 1;
     }
  }
  //dot
  if (myHero.roomX == 1 && myHero.roomY == 1){
      fill(255);
      square(x+55,y+45,15);
    }
    //if (eastroom != #FFFFFF && location.x >= width-75 && location.y >= height/2-50 && location.y <= height/2+50){//works
    //  roomX++;
    //  location = new PVector(80,height/2);
    //}
    //if (southroom != #FFFFFF && location.y >= height-60 && location.x >= width/2-50 && location.x <= width/2+50){//works
    //  roomY++;
    //  location = new PVector(width/2,65);
    //}
    //if (westroom != #FFFFFF && location.x <= 75 && location.y >= height/2-50 && location.y <= height/2+50){
    //  roomX--;
    //  location = new PVector(width-80,height/2);
    //}
}
  


void gameClicks(){
  }
