let bubbles = [];
let numBubs = 10
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
	//background(0)
	for(let i = 0; i < numBubs; i++){
		ellipse(bubbles[i].x,bubbles[i].y,2,2);
		bubbles.push(new Bubble());
		bubbles[i].move2()

	}
	//print(bubbles[0].x)
}

class Bubble {
	constructor(){
		this.x = randomGaussian(h/2,100)
		this.y = randomGaussian(w/2,100)
		this.i = 0
		this.j = 0
	}
	move(){
		this.x += 8 * cos(this.i += (this.j += -0.2))
		this.y += 8 * sin(this.i += (this.j += 0.2))
	}
	move2(){
		this.x += 10 * randomGaussian()
		this.y +=  10 * randomGaussian()
		if(this.x <= 0 || this.x >= h){
			this.x = randomGaussian(h,1)
		}
		if(this.y <= 0 || this.y >= w){
			this.y = randomGaussian(w,1)
		}

	}
}
