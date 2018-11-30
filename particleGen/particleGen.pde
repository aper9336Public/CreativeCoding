import peasy.*;

Planet sun;
PeasyCam cam;

//PImage img;

void setup() {
  size(600,600, P3D);
  //img = loadImage("img4.jpg");
  cam = new PeasyCam(this,100);
  sun = new Planet(1,0, 0);
  sun.spawnMoons(100000, 1000);
}

void draw(){
    background(0);
    //lights();
    //pointLight(255,255,255,0,0,0);
    sun.show();
    sun.orbit();
}
