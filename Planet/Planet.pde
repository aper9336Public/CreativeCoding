class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;
  
  Planet(float r, float d, float o) {
    radius = r;
    angle = random(TWO_PI);
    orbitSpeed = o;
    distance = d;
  }
  
  void spawnMoons(int total, int level){
    planets = new Planet[total];
    for(int i =0; i< planets.length; i++){
      float r = radius/(level*2);
      float d = random((radius+r), (radius + r)*2);
      float o = random(-0.1, 0.1);
      planets[i] = new Planet(r,d,o);
      if(level < 3){
        int num = int(random(0,4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    if(planets != null){
      for(int i =0; i < planets.length; i++){
        planets[i].orbit ();
      }
    }
  }
  
  void show(){
    pushMatrix();
    rotate(angle);
    translate(distance,0);
    fill(255,100, 100);
    ellipse(0,0, radius * 2, radius*2);
    if(planets != null){
    for(int i =0; i < planets.length; i++){
      planets[i].show(); 
     }
   }
   popMatrix();
 }
  
}
