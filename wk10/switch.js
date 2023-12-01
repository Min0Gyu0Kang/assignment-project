let canvas = document.getElementById("myCanvas");
let ctx = canvas.getContext("2d");
let file1 = document.getElementById("file1");
let file2 = document.getElementById("file2");

let currentImage = 1; // Initialize with the first image

file1.addEventListener("change", loadImage);
file2.addEventListener("change", loadImage);

function loadImage(e) {
  let file = e.target.files[0];
  let reader = new FileReader();
  
  reader.onload = function(fileObject) {
    let data = fileObject.target.result;
    let img = new Image();
    
    img.onload = function() {
      ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
      ctx.drawImage(img, 30, 30, 280, 300);
    }
    
    img.src = data;
  };

  reader.readAsDataURL(file);
}

canvas.addEventListener("mouseover", function() {
  currentImage = currentImage === 1 ? 2 : 1; // Toggle between image 1 and 2
  updateCanvas();
});

canvas.addEventListener("mouseout", function() {
  currentImage = 1; // Return to the first image when mouse is not over the canvas
  updateCanvas();
});

function updateCanvas() {
  let fileInput = currentImage === 1 ? file1 : file2;
  let file = fileInput.files[0];

  if (file) {
    let reader = new FileReader();

    reader.onload = function(fileObject) {
      let data = fileObject.target.result;
      let img = new Image();

      img.onload = function() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(img, 30, 30, 280, 300);
      }

      img.src = data;
    };

    reader.readAsDataURL(file);
  }
}
