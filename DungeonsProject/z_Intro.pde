

void intro() {

  //introbutton.show();
  myGIF.show();

  //title text
  fill(shadow);
  textFont(VampireZone);
  textSize(80);
  text("exit the dungeon", width/2, 200);

  //buttons
  click();

  introbutton = new Button("start", 400, 400, 150, 100, shadow, unity);
  introbutton.show();

  if (introbutton.clicked) {
    mode = game;
  }
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {//was pressed but not currently pressing
    mouseReleased =  true;
    wasPressed = false;
  }
}






void introClicks() {
}
