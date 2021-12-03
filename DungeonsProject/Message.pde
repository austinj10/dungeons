class Message extends GameObject {

  int time;
  String text;

  Message(float x, float y, String _text) {
    hp = 1;
    time = 250;
    text = _text;
    location = new PVector(x, y);
  }

  void show() {
    text("+"+xp, location.x, location.y);
    println("a");
  }


  void act() {
    super.act();
    println("a");
    //location(add
    time = time - 8;
    if (time <= 0) hp = 0;
  }
}
