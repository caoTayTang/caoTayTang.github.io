const imgs = [
    "assets/maiyeu.jpg",
    "assets/hihi.jpg",
    "assets/cutie.jpg",
    "assets/anhgif.gif",
];

function changeImg() {
  const index = Math.floor(Math.random() * imgs.length);
  document.getElementById("imgId").src = imgs[index];
}

changeImg();
setInterval(changeImg, 1500);
