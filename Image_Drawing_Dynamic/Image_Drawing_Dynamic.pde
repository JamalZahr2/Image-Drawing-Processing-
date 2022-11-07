//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight, nightMode;
PImage pic;
//
void setup () {
size(4000, 600); //Landscape
//Copy Display Algorithm
appWidth = width;
appHeight = height;
//
}
void draw() {
//Population
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
pic = loadImage("../Images Used/download.png");
//
//Rectangular Layout and Image Drawing to CANVAS
rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
//

if ( nightMode == true ) tint(64, 64, 40); //RGB: Night Mode
image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
}
//
void keyPressed () {
  if (keyPressed = 'N') {nightMode = true;}
  if (keyPressed = 'n') {nightMode = false;}
}
