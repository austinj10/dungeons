class Message extends GameObject {

  int time;
  String text_;

  Message(float x, float y, int rx, int ry, String text) {
    hp = 1;
    time = 250;
    //text = _text;
    location = new PVector(x, y);
    roomX = rx;
    roomY = ry;
    text_ = text;
  }

  void show() {
    fill(white);
    textSize(30);
    text(text_, location.x, location.y);
  }

  void act() {
    super.act();
    time = time - 7;
    if (time <= 0) hp = 0;
    location.y = location.y + 0.75;
  }
}
