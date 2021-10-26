//Austin Jeon
//October 20, 2021
//1-4

//Roleplay Project

//colour scheme https://www.colourlovers.com/palette/73893/dungeon

boolean upkey,leftkey,downkey,rightkey,spacekey;

ArrayList<GameObject> myObjects;
Hero myHero;

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

//text and font
PFont VampireZone;

void setup(){
  mode = intro;
  
  size(800,600,FX2D);
  imageMode(CENTER);
  rectMode(CENTER);
   
  //text and font
  textAlign(CENTER,CENTER);
  VampireZone = createFont("Vampire Zone.ttf",200);
  
  //gif
  myGIF = new AnimatedGIF(10,"frame_" , "_delay-0.07s.gif", width/2, height/2, width, height);
  
  //create objects
  myObjects = new ArrayList<GameObject>(1000);
  myHero = new Hero();
  myObjects.add(myHero);
}



void draw(){
  if (mode == intro){
    intro();
  } else if (mode == game){
    game();
  } else if (mode == pause){
    pause();
  } else if (mode == gameover){
    gameover();
  } else if (mode == win){
    win();
  } else {
    println("Error: Mode = " + mode);
  }
}



void keyPressed() {
  if (keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true; 
  if (keyCode == LEFT) leftkey = true; 
  if (keyCode == RIGHT) rightkey = true; 
  if (key == ' ') spacekey = true;
}



void keyReleased() {
  if (keyCode == UP) upkey = false; 
  if (keyCode == DOWN) downkey = false; 
  if (keyCode == LEFT) leftkey = false; 
  if (keyCode == RIGHT) rightkey = false; 
  if (key == ' ') spacekey = false;
}
