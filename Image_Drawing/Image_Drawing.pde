//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic;
//
size(1000, 600); //Landscape
//Copy Display Algorithm
appWidth = width;
appHeight = height;
//
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
// tint(255, 50); //use 1/2 tint value for white (i.e. 128/256=1/2)
tint(255, 255, 255); //Night Mode
image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
