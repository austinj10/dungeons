AnimatedGIF myGIF;

class AnimatedGIF {
  PImage[] pics;
  int numberofFrames;//permanent variable
  int frame;
  float x,y,w,h;

  AnimatedGIF(int nf, String pre, String post){
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numberofFrames = nf;
    pics = new PImage[numberofFrames];
    int i = 0;
    while (i < numberofFrames){
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    frame = 0;//start gif starting frame 
  }
  
  AnimatedGIF(int nf, String pre, String post, float locx, float locy, float wth, float hgt){//nf is temporary
    x = locx;
    y = locy;
    w = wth;
    h = hgt;
    numberofFrames = nf;
    pics = new PImage[numberofFrames];
    int i = 0;
    while (i < numberofFrames){
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    frame = 0;//start gif starting frame 
  }
  
  //show function
  void show(){
    imageMode(CENTER);
    if (frame == numberofFrames) frame = 0;
    image(pics[frame], x, y, w, h);
    frame++;
    }
}
  
  
