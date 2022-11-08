//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float largerDimension, smallDimension, imageWidthRatio=0.0, imageHeightRatio=0.0; 
PImage pic;
Boolean nightMode=true, widthLarger=false, heightLarger=false;
//
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
/*Aspect Ratio Calculations, Older Calculations
 if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
 if ( widthLarger == true ) imageHeightRatio = smallDimension / largerDimension;
 if ( heightLarger == true ) imageWidthRatio = smallDimension / largerDimension;
 if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
 */
//
//Better Image Stretch Algorithm
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
//We know the width is the larger dimension
if ( appWidth >= picWidth ) {
  picWidthAdjusted = picWidth;
  //
  if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
  if ( heightLarger == true ) imageWidthRatio = smallDimension / largerDimension;
  //
  if ( appHeight >= picHeight ) {
    //Calculated Dimension because smaller than width
    if ( widthLarger == true ) imageHeightRatio = smallDimension / largerDimension;
    if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
    picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
  } else {
    //Image smaller than CANVAS needs separate algorithm
  }
} else {
  //Image smaller than CANVAS, needs separate algorithm
}
//
//Population
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
pic = loadImage("../Images Used/download.png");
//
//
println( appWidth, picWidth, picWidthAdjusted );
println( appHeight, picHeight, picHeightAdjusted );
//
//Rectangular Layout and Image Drawing to CANVAS
//rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
//
if ( nightMode == false ) tint(255, 50); //use 1/2 tint value for white (i.e. 128/256=1/2)
if ( nightMode == true) tint(64, 64, 40); //RGB: Night Mode
image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
