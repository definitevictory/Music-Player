import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Minim Library
//
//Global Variables
Minim minim;
AudioPlayer playlist1;
AudioPlayer soundEffects1;

//
void setup() {
  int appWidth, appHeight;
  //
  fullScreen();
  appWidth = displayWidth;
  appHeight= displayHeight;
  //
  //String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bru, turn your phun";
  //println(displayInstructions);
  //
  minim = new Minim(this);
  String extensionMusic = ".mp3";
  String quitButtonSound = "Notification";
  String pathwaysoundEffects = "../../soundEffects/"; //relative path
  String pathwayMusic = "../../Music/"; //Relative Path
  String ALIVE = "ALIVE";
  //print(pathwaysoundEffects+quitButtonSound+extensionMusic);
  //println("relative path", pathwayMusic+ALIVE+extensionMusic);
  String path = sketchPath(pathwaysoundEffects+quitButtonSound+extensionMusic);//absolute path
  String pathMusicAlive = sketchPath(pathwayMusic+ALIVE+extensionMusic);//absolute path
  //println ( path );
  //println("absolute path", pathMusicAlive);
  soundEffects1 = minim.loadFile( path );
  playlist1 = minim.loadFile (pathMusicAlive);//if no code breaks
  //
  //playlist1.loop(0);
  //
}//End setup
void draw() {
  println("umu", playlist1.position(), "songLength", playlist1.length());
    playlist1.loop(0);
}

void keyPressed () {
}

void mousePressed() {
}
