//Test
//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float imageX, imageY, imageWidth, imageHeight;
float songNameX, songNameY, songNameWidth, songNameHeight;
float tbarX, tbarY, tbarWidth, tbarHeight;
float timeX, timeY, timeWidth, timeHeight;
float playX, playY, playWidth, playHeight;
float quitX, quitY, quitWidth, quitHeight;
float pauseX, pauseY, pauseWidth, pauseHeight;
float rewindX, rewindY, rewindWidth, rewindHeight;
float forwardX, forwardY, forwardWidth, forwardHeight;
float volbarX, volbarY, volbarWidth, volbarHeight;
float volPicX, volPicY, volPicWidth, volPicHeight;
//
void setup() {
  //println("HelloWorld");
  //Concatenation & Inspecting Variables with Character Escapes
  println("Width: "+width+ "\tHeight: "+height+ "\tDisplay Width: "+displayWidth+ "\t\tDisplay Height: "+displayHeight);
  //NULL: all values are null until size(), arithmetic errors
  println("Example Formula: add 1 to the width", width+1); 
  //
  //Display:CANVAS  & Full Screen
  //size(600,500); //width,  height
  fullScreen(); //displayWidth, displayHeight
  appWidth= displayWidth;
  appHeight= displayHeight;
  //println(appWidth, appHeight);
  //Display geometry: Landscape, Portrait, Square
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Turn your phone"; 
  println (displayInstructions);
  //
  //Population
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  imageX = appWidth*15/100;
  imageY = appHeight*3/32;
  imageWidth = appWidth*70/100;
  imageHeight = appHeight*5/10;
  songNameX = appWidth*15/100;
  songNameY = appHeight*3/99;
  songNameWidth = appWidth*1/10;
  songNameHeight = appHeight*1/20;
  tbarX = appWidth*18/100;
  tbarY = appHeight*63/100;
  tbarWidth = appWidth*6/10;
  tbarHeight = appHeight*1/25;
  timeX = appWidth*78/100;
  timeY = appHeight*63/100;
  timeWidth = appWidth*1/25;
  timeHeight = appHeight*1/25;
  playX = appWidth*52/100;
  playY = appHeight*75/100;
  playWidth = appWidth*3/100;
  playHeight= appHeight*4/100;
  quitX = appWidth*92/100 ;
  quitY = appHeight*1/100;
  quitWidth = appWidth*7/100 ;
  quitHeight = appHeight*5/100 ;
  pauseX = appWidth*43/100 ;
  pauseY = appHeight*75/100 ;
  pauseWidth = appWidth*3/100 ;
  pauseHeight = appHeight*4/100 ;
  rewindX = appWidth*34/100 ;
  rewindY = appHeight*75/100 ;
  rewindWidth = appWidth*3/100 ;
  rewindHeight = appHeight*4/100 ;
  forwardX = appWidth*61/100 ;
  forwardY = appHeight*75/100 ;
  forwardWidth = appWidth*3/100 ;
  forwardHeight = appHeight*4/100 ;
  volbarX = appWidth*12/100 ;
  volbarY = appHeight*8/64 ;
  volbarWidth = appWidth*1/100 ;
  volbarHeight = appHeight*43/100 ;
  volPicX = appWidth*12/100;
  volPicY = appHeight*55/100;
  volPicWidth = appWidth*1/100;
  volPicHeight = appHeight*2/100;
  
  //Layout DIVs
  //rect(X, Y, Width, Height);
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  //rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  rect(imageX, imageY, imageWidth, imageHeight);
  rect(songNameX, songNameY, songNameWidth, songNameHeight);
  rect(tbarX, tbarY, tbarWidth, tbarHeight);
  rect(timeX, timeY, timeWidth, timeHeight);
  rect(playX, playY, playWidth, playHeight);
  rect(quitX, quitY, quitWidth, quitHeight);
  rect(pauseX, pauseY, pauseWidth, pauseHeight);
  rect(rewindX, rewindY, rewindWidth, rewindHeight);
  rect(forwardX, forwardY, forwardWidth, forwardHeight);
  rect(volbarX, volbarY, volbarWidth, volbarHeight);
  rect(volPicX, volPicY, volPicWidth, volPicHeight);
  /*
  rect(volX, volY, volWidth, volHeight);
  rect(nextX, nextY, nextWidth, nextHeight);
  rect(skipX, skipY, skipWidth, skipHeight);
  rect(menuX, menuY, menuWidth, menuHeight);
  rect(menuGUIX, menuGUIY, menuGUIWidth, menuGUIHeight);
  */
} //End setup
//
void draw() {
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End MAIN Program
