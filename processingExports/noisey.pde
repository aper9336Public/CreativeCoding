import java.time.LocalDateTime;
import peasy.*;
PeasyCam cam;

private ArrayList<Point> points;

private final int NUM_POINTS = 30000;

private final float NOISE_INCREMENT = 0.01;

float r = 0;

float t;

void setup() {
  background(0);
  //size(700,700, P3D);
  fullScreen(P3D);
  stroke(255,255,255,10);
   translate(width/2, height/2); 
   cam = new PeasyCam(this,1000);
   r = random(-0.01, 0.01);
   randomize();
}

void randomize(){
    points = new ArrayList<Point>();
    for(int i = 0; i < NUM_POINTS; i++) {
    PVector loc = new PVector(width/2, height/2);
    float r = randomGaussian() * 2;
    float theta = randomGaussian() + (2 * PI);
    PVector vel = new PVector(r * cos(theta), r * sin(theta));
    points.add(new Point(loc, vel));
    r = random(-0.01, 0.01);
  }
  
}

void draw() {
  cam.rotateZ(r);
  //background(0);
  if(t == 60 * 15){
    background(0);
    frameCount = -1;
    t = 0;
  }
  t++;
  pushMatrix();
  for (Point point : points) {
    line(point.prevLoc.x, point.prevLoc.y, point.loc.x, point.loc.y);
    point.update(); 
  }
  popMatrix();
    //cam.rotateX(0.01);
    //cam.rotateY(0.02);
    
    //saveFrame();
  
}

void mousePressed() {
  saveFrame(LocalDateTime.now() + ".png");
}

public class Point {
  public PVector loc;
  public PVector vel;
  public PVector prevLoc;
  public float noiseCounter = 0;
  
  public Point(PVector loc, PVector vel) {
    this.loc = loc;
    this.vel = vel;
    this.prevLoc = loc.get();
  }
  
  public void update() {
    prevLoc.set(loc.x,loc.y,0);
    float noiseVal = noise(loc.x * NOISE_INCREMENT, loc.y * NOISE_INCREMENT, noiseCounter += NOISE_INCREMENT);
    float angle = noiseVal * 2 * PI;
    loc.set(loc.x + (vel.x * cos(angle)), loc.y + (vel.y * sin(angle)), 0); 
  }
}
