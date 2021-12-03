void game() {


  drawRoom();
  drawGameObjects();
  drawDarkness();
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

void drawRoom() {
  background(shadow);

  //corners
  stroke(stone);
  strokeWeight(3);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //draw exits
  northroom = map.get(myHero.roomX, myHero.roomY-1);
  eastroom = map.get(myHero.roomX+1, myHero.roomY);
  southroom = map.get(myHero.roomX, myHero.roomY+1);
  westroom = map.get(myHero.roomX-1, myHero.roomY);

  noStroke();
  fill(0);
  if (northroom != #FFFFFF) {
    ellipse(width/2, 50, 100, 100);
  }
  if (eastroom != #FFFFFF) {
    ellipse(width-50, height/2, 100, 100);
  }
  if (southroom != #FFFFFF) {
    ellipse(width/2, height-50, 100, 100);
  }
  if (westroom != #FFFFFF) {
    ellipse(50, height/2, 100, 100);
  }


  //floor
  stroke(shadow);
  fill(stone);
  rect(width/2, height/2, width-100, height-75);
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject myObj = myObjects.get(i);
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {
      myObj.show();
      myObj.act();
      if (myObj.hp <= 0) {
        myObjects.remove(i); 
        i--;
        //println(1);
      }
    }
  }
}

void drawDarkness() {
  int i = 0;
  while ( i < darkness.size()) {
    DarknessCell myObj = darkness.get(i);
    myObj.show();
    i++;
  }
}


void drawMiniMap() {
  float opacity = 0;
  float size = 50;
  int x = 0;
  int y = 0;
  while (y < map.height) {//change to map2 later
    opacity = map(50, 0, 30, 0, 100);
    color c = map.get(x, y);//change to map2 later
    fill(c, opacity);
    square(x*15+40, y*15+40, size-35);
    x = x + 1;
    ;
    if (x >= map.width) {//change to map2 later
      x = 0;
      y = y + 1;
    }
  }
  //dot
  fill(255);
  square(myHero.roomX*15+40, myHero.roomY*15+40, 15);

  //hero text
  textSize(50);
  text(myHero.hp, 25, height-25);
}




void gameClicks() {
  if (mouseX > 0 && mouseX <  width && mouseY > 0 && mouseY < height) {
    mode = pause;
  }
}
