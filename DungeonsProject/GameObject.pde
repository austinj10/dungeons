class GameObject {
  int roomX, roomY;
  PVector location;
  PVector velocity;
  int hp, hpMAX;
  int size;
  boolean UFOBullet;
  color c;
  float speed;
  int xp;

  GameObject() {
    location = new PVector (width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 1;
  }

  void show() {
  }

  void act() {
    location.add(velocity);

    //hitting wall
    if (location.x < 75) location.x = 75;
    if (location.x > width-75) location.x = width-75;
    if (location.y < 60) location.y = 60;
    if (location.y > height-60) location.y = height-60;
  }

  //simplify code
  boolean inRoomWith(GameObject myObj) {
    return(roomX == myObj.roomX && roomY == myObj.roomY);
  }

  boolean isCollidingWith(GameObject myObj) {
    float d = dist(location.x, location.y, myObj.location.x, myObj.location.y); 
    return(inRoomWith(myObj) && d < size/2 + myObj.size/2 && hp > 0);
  }

  void explode(int s, int n, int c) {
    int i = 0;
    while (i < n) {
      myObjects.add(new particles(s, location.x, location.y, c));
      i++;
    }
  }
}
