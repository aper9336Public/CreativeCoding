
class Wave {
  float x;
  float y;
  float r = 100;
  float spread;
  float t;

  void move() {
    spread+=0.0001;
  }

  void show(float delta, float spread) {
    delta+=spread;
    x = r * sin(TWO_PI * t + spread)/cos(delta);
    y = r * sin(TWO_PI * t - TWO_PI/delta + spread);
    line(x, y, x, y);
  }
}
