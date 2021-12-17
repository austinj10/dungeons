class Enemy extends GameObject {
  Enemy() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 100;
    roomX = 1; 
    roomY = 1;
    size = 75;
    xp = 1;
  }

  Enemy(int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 100;
    roomX = x; 
    roomY = y;
    size = 75;
    //xp = 1;
  }

  Enemy(int _hp, int s, int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
    xp = 1;
  }


  void show() {
    fill(175);
    ellipse(location.x, location.y, size, size);
    fill(0);

    //hp text
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();

    //velocity.x = 2;
    //velocity.y = 2;

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && isCollidingWith(myObj)) { //myObjBulletTurret){ !BulletTurret){
        hp = hp - int(myObj.velocity.mag());
        myObj.hp = 0;
        if (hp <= 0) { 
          explode(size, 500, red);
          myObjects.add(new DroppedItem(location.x, location.y, roomX, roomY));
          myObjects.add(new Message(location.x, location.y, roomX, roomY, "+"+xp));
          myHero.xp = myHero.xp + xp;
        }
      }
      i++;
    }
  }
}
