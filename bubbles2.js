let bubbles = [];
let numBubs = 100

function setup() {
	h = 1600/2
	w = 900/2
  createCanvas(h,w)
	for(let i = 0; i < numBubs; i++){
		bubbles.push(new Bubble());
	}
	background(100)
	
	
	//to make as big as the available screen space
	//createCanvas(screen.width, screen.height);
}

function draw() {
	background(100)
	noFill()
	beginShape()
	for(let i = 0; i < numBubs; i++){
		curveVertex(bubbles[i].x,bubbles[i].y);
		//ellipse(bubbles[i].x,bubbles[i].y,2,2);
		bubbles.push(new Bubble());
		bubbles[i].move2()

	}

	endShape()
	//print(bubbles[0].x)
}

class Bubble {
	constructor(){
		this.x = cos(randomGaussian(h/2,100))/200
		this.y = sin(randomGaussian(w/2,100))/200
		this.i = 0
		this.j = 0
	}
	move(){
		this.x += 8 * cos(this.i += (this.j += -0.2))
		this.y += 8 * sin(this.i += (this.j += 0.2))
	}
	move2(){
		this.x += randomGaussian()/10 * (20 * sin(randomGaussian()))/100
		this.y +=  randomGaussian()/10 * (20 * sin(randomGaussian()))/100
		if(this.x <= 0 || this.x >= h){
			this.x = randomGaussian(h/2,1)
		}
		if(this.y <= 0 || this.y >= w){
			this.y = randomGaussian(w/2,1)
		}

	}
}
