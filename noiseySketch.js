scl = 10

function setup() {
	createCanvas(200, 200);
	background(100);
	rows = floor(windowWidth/scl)
	cols = floor(windowHeight/scl)

}

function draw() {
	for(var y = 0; y < rows; y++){
		for(var x = 0; x < rows; x++){				
			fill(100 * randomGaussian())
			rect(x * scl, y * scl,scl,scl)
		}
	}
}