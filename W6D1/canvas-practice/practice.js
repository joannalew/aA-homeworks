document.addEventListener("DOMContentLoaded", function(){
	
	// set up canvas element
	let canvas = document.getElementById("mycanvas");
	canvas.height = 500;
	canvas.width = 500;

	// draw a rectangle
	let ctx = canvas.getContext("2d");
	ctx.fillStyle =  "#1E58BC";
	ctx.fillRect(0, 0, 500, 500);

	// draw a circle
	ctx.beginPath();
	ctx.arc(250, 250, 100, 0, 360);
	ctx.strokeStyle = '#000000';
	ctx.lineWidth = 3;
	ctx.stroke();

	// fill in circle
	ctx.fillStyle = '#FFFFFF';
	ctx.fill();

	// draw a triangle
	ctx.beginPath();
	ctx.moveTo(25, 225);
	ctx.lineTo(150, 25);
    ctx.lineTo(150, 225);
    ctx.fillStyle = 'orange';
    ctx.fill();
});
