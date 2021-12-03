void pause() {
  background(dirt);

  //upgrades text
  fill(shadow);
  textSize(100);
  text("upgrades", width/2, height/6);

  textSize(60);
  //textMode(CENTER/2);

  //hp text
  click();
  textSize(60);
  fill(shadow);
  text("max hp: "+myHero.hpMAX, width/2.5, height/3);

  hpbutton = new Button("hp+", 100, 200, 50, 50, shadow, unity);
  hpbutton.show();
  if (myHero.xp >= 1){
    if (hpbutton.clicked){
      myHero.hp++;
      myHero.hpMAX = myHero.hpMAX + 1;
      myHero.xp = myHero.xp - 1;
    } else myHero.hpMAX = myHero.hpMAX;
  }

  //back
  backbutton = new Button("back", width-100, height-50, 100, 50, dirt, unity);
  backbutton.show();
  if (backbutton.clicked) {
    mode = game;
  }


  //speed text
  textSize(60);
  fill(shadow);
  text("speed: "+myHero.speed, width/2.5, height/2);

  speedbutton = new Button("Speed+", 100, 300, 50, 50, shadow, unity);
  speedbutton.show();
  if (myHero.xp >= 1){
    if (speedbutton.clicked) {
      myHero.speed = myHero.speed + 0.25;
      myHero.xp = myHero.xp - 1;
    }
  }

  //damage text
  textSize(60);
  text("damage", width/2.65, height/1.5);

  //xp text
  textSize(60);
  text("XP: "+myHero.xp, width/2, height/1.15);
}



void pauseClicks() {
  //if (mouseX > width-150 && mouseX < width-50 && mouseY > height-75 && mouseY < height-25) {
  //  mode = game;
  //}
}
