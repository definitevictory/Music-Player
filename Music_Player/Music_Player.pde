//Test
//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float imageX, imageY, imageWidth, imageHeight;
float songNameX, songNameY, songNameWidth, songNameHeight;
float barX, barY, barWidth, barHeight;
float timeX, timeY, timeWidth, timeHeight;
//
void setup() {
  println("HelloWorld");
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
  imageX = appWidth*1/10;
  imageY = appHeight*1/16;
  imageWidth = appWidth*8/10;
  imageHeight = appHeight*5/10;
  songNameX = appWidth*1/10;
  songNameY = appHeight*1/99;
  songNameWidth = appWidth*1/10;
  songNameHeight = appHeight*1/20;
  barX = appWidth*2/10;
  barY = appHeight*6/10;
  barWidth = appWidth*6/10;
  barHeight = appHeight*1/20;
  timeX = appWidth*8/10;
  timeY = appHeight*6/10;
  timeWidth = appWidth*1/25;
  timeHeight = appHeight*1/20;
  
  //Layout DIVs
  //rect(X, Y, Width, Height);
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  rect(imageX, imageY, imageWidth, imageHeight);
  rect(songNameX, songNameY, songNameWidth, songNameHeight);
  rect(barX, barY, barWidth, barHeight);
  rect(timeX, timeY, timeWidth, timeHeight);
  /*
  rect(playX, playY, playWidth, playHeight);
  rect(pauseX, pauseY, pauseWidth, pauseHeight);
  rect(rewindX, rewindY, rewindWidth, rewindHeight);
  rect(forwardX, forwardY, forwardWidth, forwardHeight);
  rect(volbarX, volbarY, volbarWidth, volbarHeight);
  rect(volPicX, volPicY, volPicWidth, volPicHeight);
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
