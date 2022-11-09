//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float largerDimension, smallDimension, imageWidthRatio=0.0, imageHeightRatio=0.0; 
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
PImage pic;
Boolean nightMode=false, widthLarger=false, heightLarger=false;
int tintDayMode=255, tintDayModeOpacity=50, tintR=64, tintG=64, tintB=40, tintNightModeOpacity=85;
//
void setup() {
  size(1000, 800); //Landscape
  //Copy Display Algorithm
  appWidth = width;
  appHeight = height;
  //
  //Aspect Ratio of Background Image
  //
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800;
  int picHeight = 600;
  //Image Orientation: Landscape, Square, Portrait
  if ( picWidth >= picHeight ) { //True if Landscape or Square
    largerDimension = picWidth;
    smallDimension = picHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = picHeight;
    smallDimension = picWidth;
    heightLarger = true;
  }
  //
  //Teaching Example: Width is known to be larger
  //
  //Better Image Stretch Algorithm
  //We know the width is the larger dimension
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = picWidth; //Stretching larger dimension
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
    if ( appHeight < picHeightAdjusted ) {
      println("Stop: Image is too big for CANVAS");
      exit(); //Stop further use of the App
    }
    //
    if ( appHeight >= picHeight ) {
      //Calculated Dimension because smaller than width
      if ( widthLarger == true ) imageHeightRatio = smallDimension / largerDimension;
      if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
    } else {
      //Image smaller than CANVAS, needs separate algorithm
      println("CANVAS is smaller than Image");
    }
  } else {
    //Image smaller than CANVAS, needs separate algorithm
    println("CANVAS is smaller than Image");
  }
  //
  /*Aspect Ratio Calculations, Older Calculations
   if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
   if ( widthLarger == true ) imageHeightRatio = smallDimension / largerDimension;
   if ( heightLarger == true ) imageWidthRatio = smallDimension / largerDimension;
   if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
   */
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  pic = loadImage("../Images Used/download.png");
  //
  //Verify Variable Values after Algorithm
  println("App Width", appWidth, " and App Height:", appHeight);
  println("Image dimensions are:", picWidth, picHeight);
  println("Larger Image Dimension is:", largerDimension);
  println("Adjusted Image Dimensions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
  //Rectangular Layout and Image Drawing to CANVAS
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
  //Background Image must be single executed code
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //use 1/2 tint value for white (i.e. 128/256=1/2)
  else {
    tint(tintR, tintG, tintB, tintNightModeOpacity);
  } //RGB: Night Mode
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
} //End Setup
void draw() {
} //End draw

void keyPressed() {
  if ( key == 'N' ) { 
    nightMode = true;
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    tint(64, 64, 40, 85); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
  if ( key == 'n' ) { 
    nightMode = false;
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    tint(255, 50); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
} //End keyPressed
//
void mousePressed() {
  //
  //Mouse Pressed will control background image
  if ( mouseButton == LEFT ) { 
    nightMode = true;
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    tint(64, 64, 40, 85); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
  if ( mouseButton == RIGHT ) { 
    nightMode = false;
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    tint(255, 50); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
} //End mousePressed
//
//End Main Program
