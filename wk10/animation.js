let canvas = document.getElementById("myCanvas");
let ctx = canvas.getContext("2d");
let x = 80;
let y = 80;
flag = 1;
draw();

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);//clear canvas
    if (x > 400){flag = 0;}
    else if (x < 100) {flag = 1;}
    if (flag == 1) {
    x += 10;
    ctx.fillRect(x, y, 80, 80);
    }
    else if (flag == 0){
    x -= 10;
    ctx.fillRect(x, y, 80, 80);
    }
    window.requestAnimationFrame(draw);
    }