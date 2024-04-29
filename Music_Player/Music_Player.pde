//Library:use sketch.
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Test
//Global Variables
Minim minim;  //object to access all functions
AudioPlayer soundEffects1;
AudioPlayer playList1;
AudioPlayer soundEffects2;
//
int appWidth, appHeight;

float printinhour;
//
PFont QuitFont;
int size;
color red=#FF0000;
String Quittext="Quit";
String nameText="nameofsong";
//
color foregroundColour;
color white=255, yellow=#F0F000, black=0, grey=#121212, blue=#6BD0EA, purple=#FF00FF, green=#58DE00, weakRed=#E10000, orange=#FF9600,
lightGrey=#E8E8E8,darkYellow=#969600, darkBlue=#08A4C9;//Hexadecimals in color selector
color backgroundColour, whiteBackground=255, darkBackground=0, nameColour, nameTextColour, tColour=weakRed, otherBackgroundColour, skipColour, skipHoverColour; //Grayscale, much smaller than color
Boolean whiteMode=false;
//
void setup() {
  //println("HelloWorld");
  //Concatenation & Inspecting Variables with Character Escapes
  println("Width: "+width+ "\tHeight: "+height+ "\tDisplay Width: "+displayWidth+ "\t\tDisplay Height: "+displayHeight);
  //NULL: all values are null until size(), arithmetic errors
  //println("Example Formula: add 1 to the width", width+1);
  //
  //Display:CANVAS  & Full Screen
  //size(600,500); //width,  height
  fullScreen(); //displayWidth, displayHeight
  appWidth= displayWidth;
  appHeight= displayHeight;
  //println(appWidth, appHeight);
  //Display geometry: Landscape, Portrait, Square
  //Landscape is HARDCODED
  //String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Turn your phone";
  //println (displayInstructions);
  //
  minim = new Minim(this);
  String extension = ".mp3";
  String quitButtonSound = "Punch";
  String pathwaysoundEffects = "../soundEffects/"; //relative path
  print(pathwaysoundEffects+quitButtonSound+extension);
  String path = sketchPath(pathwaysoundEffects+quitButtonSound+extension);//absolute path
  //println (path) ;
  soundEffects1 = minim.loadFile(path);
  //playList1 = minim.loadFile(path);
  minim = new Minim(this);
  String pingSound= "Notification";
  String path2 = sketchPath(pathwaysoundEffects+pingSound+extension);
  soundEffects2 = minim.loadFile(path2);
  //

  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //see font use CreateFont
  size=40;
  QuitFont = createFont("Elephant", size); //Tools/Create Font/ Find Font/ Use size field/ Dont press OK, bugs
  //
  divs();
  drawRects();
  //Variable population
  //whiteMode= true; //must ask to see blue light
  //if ( hour ()>=9 && hour()<=17  ) backgroundColour = whiteBackground ;
  //if ( hour ()<9 && hour()>17  ) backgroundColour = darkBackground ;

  if (whiteMode==true && hour ()>=9 && hour()<=17) {
    backgroundColour = whiteBackground;
    foregroundColour = black; //black
    nameColour=blue;
    nameTextColour=white;
    otherBackgroundColour = lightGrey;
    skipColour=blue;
    skipHoverColour=darkBlue;
  } else {
    backgroundColour = darkBackground;
    foregroundColour = yellow; //yellow,  hour ()<9 && hour()>17)
    nameColour=grey;
    nameTextColour=yellow;
    otherBackgroundColour = grey;
    skipColour = yellow;
    skipHoverColour = darkYellow;
    if ( hour ()>=9 && hour()<=17)foregroundColour = white;
  }
  //
  //soundEffects1.loop();
} //End setup
//
void draw() {
  background(backgroundColour);
  fill(foregroundColour);
  fill(purple);
  rect(quitX, quitY, quitWidth, quitHeight);
  if (mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitHeight) {
    fill(yellow);
    rect(quitX+quitWidth*1/9, quitY+quitHeight*1/9, quitWidth*7/9, quitHeight*7/9);
  } else {
    fill(purple);
  }
  //Text
  fill(purple);

  textAlign(CENTER, CENTER); //align X+Y in processing reference (left, center, right| top, center, Bottom ,baseline.
  size=20;
  textFont(QuitFont, size);
  text(Quittext, quitX, quitY, quitWidth, quitHeight);

  fill(foregroundColour); //to default
  fill(otherBackgroundColour);
  rect(imageX, imageY, imageWidth, imageHeight);
  //
  fill(nameColour);
  rect(songNameX, songNameY, songNameWidth, songNameHeight);
  //
  textAlign(LEFT, CENTER);
  fill(nameTextColour);
  textFont(QuitFont, size);
  text(nameText, songNameX*110/100, songNameY, songNameWidth, songNameHeight);
  //
  fill(tColour);
  rect(tbarX, tbarY, tbarWidth, tbarHeight);
  //
  fill(green);
  printinhour=minute(); //replace with the song timer
  //println(printinhour); test
  rect(tprogressX, tprogressY, tprogressWidth*printinhour/60, tprogressHeight);
  //

  fill(otherBackgroundColour);
  rect(playX, playY, playWidth, playHeight);
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    fill(orange);
    rect(playX+playWidth*8/100, playY+playHeight*8/100, playWidth*86/100, playHeight*86/100);
  }
  //
  fill(otherBackgroundColour);
  rect(pauseX, pauseY, pauseWidth, pauseHeight);
  if (mouseX>pauseX && mouseX<pauseX+pauseWidth && mouseY>pauseY && mouseY<pauseY+pauseHeight) {
    fill(orange);
    rect(pauseX+pauseWidth*8/100, pauseY+pauseHeight*8/100, pauseWidth*86/100, pauseHeight*86/100);
  }
  //
  fill(otherBackgroundColour);
  rect(rewindX, rewindY, rewindWidth, rewindHeight);
  if (mouseX>rewindX && mouseX<rewindX+rewindWidth && mouseY>rewindY && mouseY<rewindY+rewindHeight) {
    fill(orange);
    rect(rewindX, rewindY, rewindWidth, rewindHeight);
  }
  //
  fill(otherBackgroundColour);
  rect(forwardX, forwardY, forwardWidth, forwardHeight);
  if (mouseX>forwardX && mouseX<forwardX+forwardWidth && mouseY>forwardY && mouseY<forwardY+forwardHeight) {
  fill(orange);
  rect(forwardX, forwardY, forwardWidth, forwardHeight);
  }
  fill(otherBackgroundColour);
  rect(volbarX, volbarY, volbarWidth, volbarHeight);
  //
  fill(skipColour);
  rect(skipX, skipY, skipWidth, skipHeight);
    if (mouseX>skipX && mouseX<skipX+skipWidth && mouseY>skipY && mouseY<skipY+skipHeight) {
      fill(skipHoverColour);
      rect(skipX, skipY, skipWidth, skipHeight);
    }
  //
  fill(skipColour);
  rect(menuX, menuY, menuWidth, menuHeight);
  if (mouseX>menuX && mouseX<menuX+menuWidth && mouseY>menuY && mouseY<menuY+menuHeight){
  fill(skipHoverColour);
  rect(menuX, menuY, menuWidth, menuHeight);
  }
  //
  fill(orange);
  rect(LoopX, LoopY, LoopWidth, LoopHeight);
} //End draw
//
void keyPressed() { //Listener
  if (key=='Q' || key=='q') {
    soundeffect_1();
  };
  if (key==CODED && keyCode==ESC) exit();
  if (key=='E' || key=='e')
    ; //for whitemode
} //End keyPressed
//
void mousePressed() { //Listener
  if ( mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitHeight)
  {
    soundeffect_1();
  }
  //play button
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    soundeffect_2(); //REPLACE WITH PLAY button function
    return;
  }
} //End mousePressed

//
// End MAIN Program
