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
int numberSoundEffects = 1;//OS able to count
int numberMusicSongs = 2;
AudioPlayer[] playlist = new AudioPlayer [numberMusicSongs];
AudioPlayer[] soundEffects= new AudioPlayer [numberSoundEffects];
int currentSong = 0;
Boolean looping = false


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
  soundEffects[0] = minim.loadFile( path );
  playlist[0] = minim.loadFile (pathMusicAlive);//if no code it'll breaks
  //
  //Note: Music starts before CANVAS ... Purpose of Player
  //Note: See Easter Egg about Time-On and Looping Songs
  //playlist[currentSong].loop(0);
  //
}//End setup
void draw() {
  println("umu", playlist[currentSong].position(), "songLength", playlist[currentSong].length());
  /*loop feature can show how much loops
   Easter egg program time for number of song loops
   attention to timer for music player, times to the end of a song*/
  if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()!=-1 ) println("There are", playlist[currentSong].loopCount(), "loops left.");
  if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()==-1 ) println("Looping Infinitely");
  
  if (!playlist[currentSong].isPlaying()) println("nothing is playing pick a song.");
  if ( playlist[currentSong].isPlaying() && !playlist[currentSong].isLooping() ) println("Play Once");

  //playlist[currentSong].loop(0); //only play beginning over and over
  // Auto Play Code for Future Use
  // Contains instructions from Key Board Short Cuts
  if ( playlist[currentSong].isPlaying() ) {
    //Empty IF, IS FALSE
  } else if (looping == false && !playlist[currentSong].isPlaying() && playlist[currentSong].length() < 60000) {
    playlist[currentSong].rewind();//pain minutes in 3 , 180second, 180 000 ms. if time remaining less thatn, restart
    //true if song less than 30 seconds stop, if greater then restart
  } else if (looping == false && !playlist[currentSong].isPlaying() && (playlist[currentSong].position() > playlist[currentSong].length()*0.8)) {
    playlist[currentSong].rewind();
  }
  //true = 75% played we stop and rewind
  // } else {
  //currentSong at end of FILE

  //currentSong = currentSong + 1; //currentSong++; currentSong+=1
  //playlist[currentSong].play();
}



void keyPressed () {
  if (key== 'P'|| key== 'p') { //play and pause button;
    if (playlist[currentSong].isPlaying()) {
      playlist [currentSong].pause();
    } else {
      playlist[currentSong].play();
    }
  }
  if (key== 'E'|| key== 'e') {//End loop once
    playlist[currentSong].loop(1);
    looping = true;
  }
  if (key== 'R'|| key== 'r') {// end loop infinite
    playlist[currentSong].loop();
    looping = true;
  }
  if (key== 'S'|| key== 's') {
    looping = false;
    playlist[currentSong].pause();
    playlist[currentSong].rewind(); //affects loop
  }
}
void mousePressed() {
}
