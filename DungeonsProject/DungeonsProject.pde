//Austin Jeon
//October 20, 2021
//1-4

//Roleplay Project

//colour scheme https://www.colourlovers.com/palette/73893/dungeon

boolean upkey, leftkey, downkey, rightkey, spacekey;

//gameobjects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;

//mode framework
int mode;
final int intro = 1;
final int game = 2;
final int pause = 3;
final int gameover = 4;
final int win = 5;

//colour scheme pallette
color undone  = #443939;
color shadow = #302222;
color unity = #473B2B;
color stone = #5E4B34;
color dirt = #6B5B45;
color black = #000000;
color white = #FFFFFF;
color yellow = #DBFF56;
color green = #2EA62F;
color blue = #2E59A6;
color red = #931212;
color orange = #E8980A;
color purple = #D60AE8;

//text and font
PFont VampireZone;

//images and rooms
PImage map;
PImage map2;
color northroom, eastroom, southroom, westroom;

//GIF
AnimatedGIF myGIF;
AnimatedGIF manUP;
AnimatedGIF manDOWN;
AnimatedGIF manLEFT;
AnimatedGIF manRIGHT;

AnimatedGIF heart;

//buttons
Button introbutton;
Button hpbutton;
Button backbutton;
Button speedbutton;

//settings: dropped items
final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;


void setup() {
  mode = intro;

  size(800, 600, FX2D);
  imageMode(CENTER);
  rectMode(CENTER);

  //text and font
  textAlign(CENTER, CENTER);
  VampireZone = createFont("Vampire Zone.ttf", 200);

  //gif
  myGIF = new AnimatedGIF(35, 15, "frame_", "_delay-0.07s.gif");
  manUP = new AnimatedGIF(4, 15, "man/_up/sprite_", ".png");
  manDOWN = new AnimatedGIF(4, 15, "man/_down/sprite_", ".png");
  manLEFT = new AnimatedGIF(4, 15, "man/_left/sprite_", ".png");
  manRIGHT = new AnimatedGIF(4, 15, "man/_right/sprite_", ".png");

  heart = new AnimatedGIF(1, 15, "heart", ".png");

  //create objects
  myObjects = new ArrayList<GameObject>(1000);
  myHero = new Hero();
  myObjects.add(myHero);

  //buttons
  introbutton = new Button("start", 400, 400, 150, 100, shadow, unity);
  hpbutton = new Button("+", 100, 200, 50, 50, shadow, unity);
  backbutton = new Button("back", width-100, height-50, 100, 50, dirt, unity);
  speedbutton = new Button("Speed+", 100, 300, 50, 50, shadow, unity);

  //map
  map = loadImage("map2.0.png");
  map2 = loadImage("map.png");

  //darkness
  darkness = new ArrayList<DarknessCell>(1000);
  float size = 4;
  int x = 0;
  int y = 0;
  while (y < height) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x >= width) {
      x = 0;
      y += size;
    }
  }

  //loading enemies on map
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == orange) {
      myObjects.add(new Follower(x, y));
    }
    if (roomColor == blue) {
      myObjects.add(new Enemy(x, y));
    }
    if (roomColor == red) {
      myObjects.add(new Turret(x, y));
    }
    if (roomColor == green) {
      myObjects.add(new Lurker(x, y));
    }
    if (roomColor == yellow) {
      myObjects.add(new Spawner(x, y));
    }
    if (roomColor == purple) {
      //add more
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}



void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == win) {
    win();
  } else {
    println("Error: Mode = " + mode);
  }
}



void keyPressed() {
  if (keyCode == 'w' || keyCode == 'W') upkey = true; 
  if (keyCode  == 's' || keyCode == 'S') downkey = true; 
  if (keyCode  == 'a' || keyCode == 'A') leftkey = true; 
  if (keyCode == 'd' || keyCode == 'D') rightkey = true; 
  if (key == ' ') spacekey = true;
}



void keyReleased() {
  if (keyCode == 'w' || keyCode == 'W') upkey = false; 
  if (keyCode == 's' || keyCode == 'S') downkey = false; 
  if (keyCode == 'a' || keyCode == 'A') leftkey = false; 
  if (keyCode == 'd' || keyCode == 'D') rightkey = false; 
  if (key == ' ') spacekey = false;
}
