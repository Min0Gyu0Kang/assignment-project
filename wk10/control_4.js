let canvas = document.getElementById("myCanvas");
let ctx = canvas.getContext("2d");
let file1 = document.getElementById("file1");
file1.addEventListener("change", loadImage);
function loadImage(e) {
let file = e.target.files[0];
let reader = new FileReader();
reader.onload = function(fileObject) {
let data = fileObject.target.result;
let img = new Image();
img.onload = function() {
ctx.drawImage(img, 30, 30, 280, 300);
}
img.src = data;
};
reader.readAsDataURL(file);
}