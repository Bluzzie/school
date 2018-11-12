PImage myMagicHat;
PImage myBackground;
 
int dinox = 0;
int deaths = 0;
int ballSize;
 
int paddleSize = 70;
 
int x = 0;
int y = 0;
 
int ySpeed = 5;
int xSpeed = 5;
  
 
void image1(PImage i1, float x, float y ) {
  fill(255, 2, 2); 
  if (i1==null)
    rect(x, y, 124, 24);
}
 
void setup() {
  size(500, 500);
 
  myBackground = loadImage("MiddleEast.jpg");
 
  background(255);
  newGame();
}
 
 
void draw ()
{
  if(x > 500){
    deaths += 1;
    text(deaths, 200,30);
  }
  if(deaths > 3){
    background(0);
    text("you lose",255,255);
  }
    
 
  x = x + xSpeed;
  y = y + ySpeed;
  if (x > width) {
    xSpeed = -5;
  }
  if (x < 0) {
    xSpeed = 5;
  }
  if (y < 0) {
    ySpeed = 5;
  }
  if (y > (height - 35)) {
    newGame();    
  }
 
  
  if (ballHitPaddle()) {
    ySpeed = -abs(ySpeed);
 
   
    y = (height - 50) - (ballSize / 2);  
    
  }
 
  dinox += (mouseX - dinox) / 2;   
 
  if (myBackground!=null)
    image(myBackground, 0, 0, 900, 800); 
  else  background(255);
 
  
  image1(myMagicHat, dinox, height - 50);
 

  noStroke();
  ballSize = 18;
  ellipse(x, y, ballSize, ballSize);
}
 
boolean ballHitPaddle() {
 
  int ballLeft = x - (ballSize / 2);
  int ballRight = x + (ballSize / 2);
  int ballTop = y - (ballSize / 2);
  int ballBottom = y + (ballSize / 2); 
 
  float  padLeft = (dinox);
  float  padRight = (dinox) + paddleSize;
  float padTop = height - 50;
 
  if (ballBottom < padTop+5) {
    return false;
  }
  if (ballRight < padLeft) {
    return false;
  }
  if (ballLeft > padRight) {
    return false;
  }
  return true;
}
 
void newGame() {
  x = int(random(50, width - 50));
  y = 50;
  xSpeed = 5;
  ySpeed = 5;
  text(deaths,200,30);
}
