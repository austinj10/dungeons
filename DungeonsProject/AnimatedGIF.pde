class AnimatedGIF {
  PImage[] pics;
  int frame;
  int rate;
  int x,y;
  
  AnimatedGIF(int n, String pre, String suf){
    pics = new PImage[n];
    loadImages(pre,suf);
    frame = 0;
    rate = 1;
  }
  
  AnimatedGIF(int n, int r, String pre, String suf){//nf is temporary
    pics = new PImage[n];
    loadImages(pre,suf);
    frame = 0;
    rate = r;
  }
  
   AnimatedGIF(int n, String prefix, String suffix,int w, int h) {
    pics = new PImage[n];
    loadImages(prefix, suffix);
    frame = 0;
    rate = 1;
    w = x;
    h = y;
  }
   
  //show function
  void show(){
    //imageMode(CENTER);
    if (frame == pics.length) frame = 0;
    image(pics[frame], width/2, height/2, width, height);
    if (frameCount % rate == 0) frame++;
  }
    
  void show(float x, float y, float w, float h){
   if (frame == pics.length) frame = 0;
   image(pics[frame], x, y, w, h);
   if (frameCount % rate == 0) frame++;
  }
  
  void loadImages(String prefix, String suffix) {
    int i = 0;
    while (i < pics.length) {
      String leadingZero = "";
      if (pics.length <= 10) leadingZero = "";
      pics[i] = loadImage(prefix+leadingZero+i+suffix);
      i++;
    }
  }
}
  
  
