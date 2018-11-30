Wave[] w = new Wave[10000];
float mover;
float spread;
int b = 0;
void setup(){
  frameRate(120);
  size(640,360);
  background(0);
  for (int i =0; i < w.length; i++){
    w[i] = new Wave();
  }
}

void draw() {
  //if(millis() % 10 == 0){
  //    background(0);
  //}
  background(0);
  strokeWeight(2);
  translate(width/2, height/2);
    for (int i =0; i < w.length; i++){
      mover+= 0.1;
      spread+= 1;
      if(second() % 1 == 0){
          stroke(255,0,b++);
      }
      w[i].move();
      w[i].show(sin(mover) + mover, spread);
    }
}
