//Farben
int mainColor = 0;
int secColor = 255;

//Planeten Werte
float x = 0;
float y = 0;
float radius = 60;
float winkel = 0;
float speed = 0.003;

//Mauseffekt
int mouseEffectDiameter = 0;

//Timer
float timeCounter = 0;

void setup() {
  size(200, 200);
  frameRate(60);
}

void draw() {
  background(mainColor);
  
  //Berechnung der X und Y Werte der Planeten
  x = radius * sin(winkel) + width/2;
  y = radius * cos(winkel) + height/2;
  float otherX = width - x;
  float otherY = height - y;
  
  //Linien zum Mauszeiger
  stroke(secColor);
  line(x, y, mouseX, mouseY);
  line(otherX, otherY, mouseX, mouseY);
  
  //MouseEffect
  fill(mainColor);
  stroke(secColor);
  mouseEffectDiameter %= 30;
  ellipse(mouseX, mouseY, mouseEffectDiameter, mouseEffectDiameter);
  mouseEffectDiameter++;
  
  //Counter
  fill(secColor);
  arc(width - 20, height - 20, 20, 20, radians(-90), radians(timeCounter/frameRate * 360 - 90));
  timeCounter++;
  if (timeCounter > frameRate) {
    timeCounter = 0;
  }
  noFill();
  stroke(secColor);
  ellipse(width - 20, height - 20, 20, 20);
  
  //Text in der Mitte
  fill(secColor);
  textAlign(CENTER);
  textSize(15);
  text("q = schneller, e = langsamer\n space = farbe", width/2, height/2);
  
  //Speed Text
  fill(secColor);
  textAlign(CENTER);
  textSize(15);
  text("Speed: "+speed, width/2, 3*height/4);
  
  //Planeten die Fliegen
  fill(255, 255, 0);
  ellipse(x, y, 10, 10);
  fill(0, 255, 255);
  ellipse(otherX, otherY, 10, 10);
  winkel = winkel + speed;
  
}

void mousePressed() {
  
}

void keyPressed() {
  if (key == 'q') {
    speed *= 2;            // Schneller 
  } else if (key == 'e') {
    speed /= 2;            // Langsamer
  } else if (key == ' ') {
    if (mainColor == 255) {
      mainColor = 0;
      secColor = 255;      // Farbenänderung
    } else {
      mainColor = 255;
      secColor = 0;
    }
  }
  
}
