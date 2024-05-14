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
   attention to timer for music player, times to the end of a song
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()!=-1 ) println("There are", playList[currentSong].loopCount(), "loops left.");
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()==-1 ) println("Looping Infinitely");
   */
  if (!playlist[currentSong].isPlaying()) println("nothing is playing pick a song.");
  if ( playlist[currentSong].isPlaying() && !playlist[currentSong].isLooping() ) println("Play Once");

  //playlist[currentSong].loop(0); //only play beginning over and over
}

void keyPressed () {
  if (key== 'P'|| key== 'p') { //play and pause button
    playlist[currentSong].play();
    if (!playlist[currentSong].isPlaying()) {
      playlist[currentSong].play();
    } else {
      playlist [currentSong].pause();

      
    }
  }
}

void mousePressed() {
}
