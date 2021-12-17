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
Weapon myWeapon;

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
PImage fireball;
PImage shrink;
PImage gun;

//GIF
AnimatedGIF myGIF;

AnimatedGIF blackhole;

AnimatedGIF manUP;
AnimatedGIF manDOWN;
AnimatedGIF manLEFT;
AnimatedGIF manRIGHT;

AnimatedGIF heart;

AnimatedGIF coin;

AnimatedGIF skeletonUP;
AnimatedGIF skeletonDOWN;
AnimatedGIF skeletonLEFT;
AnimatedGIF skeletonRIGHT;

AnimatedGIF zombieUP;
AnimatedGIF zombieDOWN;
AnimatedGIF zombieLEFT;
AnimatedGIF zombieRIGHT;

AnimatedGIF dragonUP;
AnimatedGIF dragonDOWN;
AnimatedGIF dragonLEFT;
AnimatedGIF dragonRIGHT;

//buttons
Button introbutton;
Button hpbutton;
Button backbutton;
Button speedbutton;
Button damagebutton;
Button brightnessbutton;

//settings: dropped items
final int SIZE = 0;
final int HEALTH = 1;
final int GUN = 2;

//variables
int dmg = 1;
float b;
int number = 0;

void setup() {
  mode = intro;

  size(800, 600, FX2D);
  imageMode(CENTER);
  rectMode(CENTER);

  //text and font
  textAlign(CENTER, CENTER);
  VampireZone = createFont("Vampire Zone.ttf", 200);

  //gif
  myGIF = new AnimatedGIF(35, 3, "intro/frame_", "_delay-0.07s.gif");//2nd number is how fast gif is
  
  manUP = new AnimatedGIF(4, 15, "man/_up/sprite_", ".png");
  manDOWN = new AnimatedGIF(4, 15, "man/_down/sprite_", ".png");
  manLEFT = new AnimatedGIF(4, 15, "man/_left/sprite_", ".png");
  manRIGHT = new AnimatedGIF(4, 15, "man/_right/sprite_", ".png");

  heart = new AnimatedGIF(1, 15, "heart", ".png");
  
  skeletonUP = new AnimatedGIF(4,15,"skeleton/up/Skeleton_", ".png");
  skeletonDOWN = new AnimatedGIF(4,15,"skeleton/down/Skeleton_", ".png");
  skeletonRIGHT = new AnimatedGIF(4,15,"skeleton/right/Skeleton_", ".png");
  skeletonLEFT = new AnimatedGIF(4,15,"skeleton/left/Skeleton_", ".png");
  
  zombieUP = new AnimatedGIF(4,15,"zombie/up/Zombie_", ".png");
  zombieDOWN = new AnimatedGIF(4,15,"zombie/down/Zombie_", ".png");
  zombieLEFT = new AnimatedGIF(4,15,"zombie/left/Zombie_", ".png");
  zombieRIGHT = new AnimatedGIF(4,15,"zombie/right/Zombie_", ".png");
  
  dragonUP = new AnimatedGIF(3,15,"dragon/up/dragon_", ".png");
  dragonDOWN = new AnimatedGIF(3,15,"dragon/down/dragon_", ".png");
  dragonLEFT = new AnimatedGIF(3,15,"dragon/left/dragon_", ".png");
  dragonRIGHT = new AnimatedGIF(3,15,"dragon/right/dragon_", ".png");
  
  blackhole = new AnimatedGIF(8,5,"blackhole/frame_", "_delay-0.1s.gif");
  
  //coin = new AnimatedGIF(13,15,"","");

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

  //fireball
  fireball = loadImage("fireball.png");
  
  //shrink
  shrink = loadImage("shrink.png");
  
  //gun
  gun = loadImage("gun.png");
  
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
      myObjects.add(new Enemy(100, 50, x, y));
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
