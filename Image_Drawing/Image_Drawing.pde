//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topX, topY, topWidth, topHeight;
float bottomX, bottomY, bottomWidth, bottomHeight;
float largerDimension, smallDimension, imageWidthRatio=0.0, imageHeightRatio=0.0; 
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
float picWidthAdjusted3=0.0, picHeightAdjusted3=0.0;
PImage pic, pic2, pic3;
Boolean nightMode=false, widthLarger=false, heightLarger=false;
int tintDayMode=255, tintDayModeOpacity=50, tintR=64, tintG=64, tintB=40, tintNightModeOpacity=85;
//
void setup() {
  size(800, 600); //Landscape
  //Copy Display Algorithm
  appWidth = width;
  appHeight = height;
  //
  //Aspect Ratio of Background Image
  //imagefilehere
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800; //Amogus
  int picHeight = 600;
  int picWidth2 = ; //Amogus2
  int picHeight2 = ;
  int picWidth3 = ; //Amogus3
  int picHeight3 = ;
  /*
  int picWidth3 = 325; //Portrait
   int picHeight3 = 485; //Portrait
   */
  //Image Orientation: Landscape, Square, Portrait
  float smallDimension, largerDimension, imageWidthRatio=0.0, imageHeightRatio=0.0;
  float smallDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;
  float smallDimension3, largerDimension3, imageWidthRatio3=0.0, imageHeightRatio3=0.0;
  Boolean widthLarger = false, heightLarger = false, widthLarger2 = false, heightLarger2 = false;
  Boolean widthLarger3 = false, heightLarger3 = false;
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
  //Better Image Stretch Algorithm
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = picWidth; //Stretching larger dimension
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    //
    if ( appHeight >= picHeight ) {
      //Calculated Dimension because smaller than width
      if ( widthLarger == true ) imageHeightRatio = smallDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
      if ( appHeight < picHeightAdjusted ) {
        println("Stop: Image is too big for CANVAS");
        exit(); //Stop further use of the App
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
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
  topX = appWidth * 1/4;
  topY = appHeight * 1/20;
  topWidth = appWidth * 1/2;
  topHeight = appHeight * 13/20;
  bottomX = appWidth * 1/2;
  bottomY = appHeight * 3/4;
  bottomWidth = appWidth * 1/3;
  bottomHeight = appHeight * 4/20;
  pic = loadImage("../Images Used/Landscape/amogus.png");
  pic2 = loadImage("../Images Used/Landscape/amogus2.png");
  pic3 = loadImage("../Images Used/Portrait/amogus.png");
  //
  //Verify Variable Values after Algorithm
  println("App Width", appWidth, " and App Height:", appHeight);
  println("Image dimensions are:", picWidth, picHeight);
  println("Larger Image Dimension is:", largerDimension);
  println("Adjusted Image Dimensions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
  //Rectangular Layout and Image Drawing to CANVAS
  //rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  rect( topX, topY, topWidth, topHeight ); //Top Half
  rect( bottomX, bottomY, bottomWidth, bottomHeight ); //Bottom Half
  //
  //Algorithm uses rect-variables
  if ( picWidth2 >= picHeight2 ) { //True if Landscape or Square
    largerDimension2 = picWidth2;
    smallDimension2 = picHeight2;
    widthLarger2 = true;
    //Landscape large Image to larger space OR smaller space
    picWidthAdjusted2 = picWidth2; //Stretch or reduce
    imageHeightRatio2 = smallDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
    println("here", picWidthAdjusted2, picHeightAdjusted2);
    if ( picHeightAdjusted2 > topHeight ) {
      println("Stop: Image is too big for rectangle layout");
      exit(); //Stop further use of the app
    }
  } else { //False if Portrait
    largerDimension2 = picHeight2;
    smallDimension2 = picWidth2;
    heightLarger2 = true;
    //Portrait Image larger image to smaller rectangle (or larger)
    picHeightAdjusted2 = bottomHeight; //Stretch or reduce
    imageWidthRatio2 = smallDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
    println("Here", picWidthAdjusted2, picHeightAdjusted2);
    if (picWidthAdjusted2 > topWidth ) {
      println("Stop: Image is too big for rectangle layout");
      exit(); //Stop further use of the App
    }
  }
  if ( picWidth3 >= picHeight3 ) { //True if Landscape or Square
    largerDimension3 = picWidth3;
    smallDimension3 = picHeight3;
    widthLarger3 = true;
    //Landscape Image larger image to smaller rectangle (or larger)
    picWidthAdjusted3 = bottomWidth; //stretch or reduce
    imageHeightRatio3 = smallDimension3 / largerDimension3;
    picHeightAdjusted3 = picWidthAdjusted3 * imageHeightRatio3;
    println("here", picWidthAdjusted3, picHeightAdjusted3);
    if ( picHeightAdjusted3 > bottomHeight ) {
      println("STOP: image height is too big for rectangle layout");
      exit(); //stop further use of the APP
    }
  } else { //False if Portrait
    largerDimension3 = picHeight3;
    smallDimension3 = picWidth3;
    heightLarger3 = true;
    //Portrait Image larger image to smaller rectangle (or larger)
    //Students to create
    picHeightAdjusted3 = bottomHeight; //stretch or reduce
    imageWidthRatio3 = smallDimension3 / largerDimension3;
    picWidthAdjusted3 = picHeightAdjusted3 * imageWidthRatio3;
    println("here", picWidthAdjusted3, picHeightAdjusted3);
    if ( picWidthAdjusted3 > bottomWidth ) {
      println("STOP: image width is too big for rectangle layout");
      exit(); //stop further use of the APP
    }
  }
  //Background Image must be single executed code
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //use 1/2 tint value for white (i.e. 128/256=1/2)
  else {
    tint(tintR, tintG, tintB, tintNightModeOpacity);
  } //RGB: Night Mode
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
} //End Setup
void draw() {
  image(pic2, topX, topY, picWidthAdjusted2, picHeightAdjusted2);
  image(pic3, bottomX, bottomY, bottomWidth, bottomHeight);
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
