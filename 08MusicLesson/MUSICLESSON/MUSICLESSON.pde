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
int numberMusicSongs = 3;
String[] filePathNameMusic = new String[numberMusicSongs];
String[] filePathNameSoundEffect = new String[numberSoundEffects];
AudioPlayer playlist; // [numberMusicSongs];
AudioPlayer soundEffects;// [numberSoundEffects];
AudioMetaData[] playlistMetaData = new AudioMetaData[numberMusicSongs];
int currentSong = 0;
Boolean looping = false;
Boolean pause=true;
Boolean randomMusic=false;
int skip;
PFont generalFont;
//String testingOnly ="1";
color black = 0, white = 255, nightInk=#FFFF00;


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
  String UNOwen = "U.N OwenWasHer";
  String GoldenNocturne = "Golden Nocturne";
  //print(pathwaysoundEffects+quitButtonSound+extensionMusic);
  //println("relative path", pathwayMusic+ALIVE+extensionMusic);
  String path = sketchPath(pathwaysoundEffects+quitButtonSound+extensionMusic);//absolute path
  String pathMusicAlive = sketchPath(pathwayMusic+ALIVE+extensionMusic);//absolute path
  String pathMusicUNOwen = sketchPath(pathwayMusic+UNOwen+extensionMusic);
  String pathMusicGoldenNocturne = sketchPath(pathwayMusic+GoldenNocturne+extensionMusic);
  //println ( path );
  currentSong= 0;
  //println("absolute path", pathMusicAlive);
  filePathNameSoundEffect[0] = pathwaysoundEffects+ quitButtonSound+extensionMusic;
  filePathNameMusic[currentSong] = pathMusicAlive;
  filePathNameMusic[1] = pathMusicUNOwen;
  filePathNameMusic[2] = pathMusicGoldenNocturne;
  soundEffects = minim.loadFile( filePathNameSoundEffect[0] );
  currentSong= 0;

  
  //

  //Note: Music starts before CANVAS ... Purpose of Player
  //Note: See Easter Egg about Time-On and Looping Songs
  //playlist[currentSong].loop(0);
  //
  generalFont =createFont("Elephant", appHeight);
  playlist =  minim.loadFile( filePathNameMusic[currentSong] );
  println (minim.loadFile( filePathNameMusic[currentSong] ));
  soundEffects = minim.loadFile( filePathNameSoundEffect[0] );
  currentSong = numberMusicSongs - numberMusicSongs;

  // println( int(random(0, 3)) );
}//End setup
void draw() {
  // see End-Brace first if tinhgs are busteed
  //println("umu", playlist[currentSong].position(), "songLength", playlist[currentSong].length());
  /*loop feature can show how much loops
   Easter egg program time for number of song loops
   attention to timer for music player, times to the end of a song*/
  //if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()!=-1 ) println("There are", playlist[currentSong].loopCount(), "loops left.");
  //if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()==-1 ) println("Looping Infinitely");

  // if (!playlist[currentSong].isPlaying()) println("nothing is playing pick a song.");
  //if ( playlist[currentSong].isPlaying() && !playlist[currentSong].isLooping() ) println("Play Once");

  //playlist[currentSong].loop(0); //only play beginning over and over
  // Auto Play Code for Future Use
  // Contains instructions from Key Board Short Cuts
  /* if ( playlist[currentSong].isPlaying() ) {
   if ( !playlist[currentSong].isPlaying() && looping==true ) looping=false; //stops loop if no song playing
   //Empty IF, IS FALSE
   } else if (looping == false && !playlist[currentSong].isPlaying() && playlist[currentSong].length() < 60000) {
   playlist[currentSong].rewind();//pain minutes in 3 , 180second, 180 000 ms. if time remaining less thatn, restart
   //true if song less than 30 seconds stop, if greater then restart
   } else if (looping == false && !playlist[currentSong].isPlaying() && (playlist[currentSong].position() > playlist[currentSong].length()*0.8)) {
   playlist[currentSong].rewind();
   }
   //
   //if ( playlist[currentSong].isMuted() ) println( "Muted" ); */

  //true = 75% played we stop and rewind
  // } else {
  //currentSong at end of FILE
  //println(skip);
  //currentSong = currentSong + 1; //currentSong++; currentSong+=1
  //playlist[currentSong].play();
  //

  //Printing text to console / canvas

  background (black); //Reminder of OS-Level Button
  fill(white);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(black); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  int size =60; //Change number to fit the text
  textFont(generalFont, size); //Size is hardcoded so needs to be changed manually
  //println("Title of Song:", playlistMetaData[0].title());
  //text(playlistMetaData[0].title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program
  //
  //printArray(playlistMetaData); //hard drive access to specific var

  //
  //println((playlistMetaData[0].length()/1000)/60, (playlistMetaData[0].length()/1000)-((playlistMetaData[0].length()/1000)/60 * 60), " seconds" );
  //currentSong =2; // 0 = alive 1 = UNowen 2 =goldennocturne

  //println(currentSong);
  //println( int(random(0, 3)) );



  //if ( playlist.isLooping() && playlist.loopCount()!=-1 ) println("There are", playlist.loopCount(), "loops left.");
  //if ( playlist.isLooping() && playlist.loopCount()==-1 ) println("Looping Infinitely");

  //if (!playlist.isPlaying()) println("nothing is playing pick a song.");
  //if ( playlist.isPlaying() && !playlist.isLooping() ) println("Play Once");

  //playlist[currentSong].loop(0); //only play beginning over and over
  if ( playlist.isPlaying() && pause==true ) {
    if ( !playlist.isPlaying() && looping==true ) looping=false; //stops loop if no song playing
    //Empty IF, IS FALSE
  } else if (looping == false && !playlist.isPlaying() && playlist.length() < 60000) {
    playlist.rewind();//pain minutes in 3 , 180second, 180 000 ms. if time remaining less thatn, restart
    //true if song less than something seconds stop, if greater then restart
  } else if (looping == false && !playlist.isPlaying() && (playlist.position() > playlist.length()*0.8)) {
    playlist.rewind();
  } /*else {
    if (currentSong >=numberMusicSongs-1) {
      currentSong=0;println("dop");
   } else {
      currentSong+=1;
    }
    playlist =  minim.loadFile( filePathNameMusic[currentSong] );
    playlist.play();
    println(currentSong);
    println("aw");
  }*/
  //
  if ( !playlist.isPlaying() && pause==false ) { // error: else required , stop and pause do same thing broken. Boolean will fix
    playlist.pause();
    playlist.rewind();

    if (currentSong >=numberMusicSongs-1) {
      currentSong=0; println("dopp");
    } else {
      currentSong+=1;  println("dowpp");
    }
    playlist =  minim.loadFile( filePathNameMusic[currentSong] );
    playlist.play();
    println(currentSong);
    println("awaaa");
  } else { //empty no code, means ignores Next Feature in draw
  }
  //println(currentSong);
}



void keyPressed () {
  if (key== 'P'|| key== 'p') { //play and pause button;
    if (playlist.isPlaying()) {
      pause=true;
      playlist.pause();
    } else {
      playlist.play();
      pause=false;
    }
  }
  if (key== 'E'|| key== 'e') {//End loop once
    playlist.loop(1);
    pause=false;
    looping = true;
  }
  if (key== 'R'|| key== 'r') {// end loop infinite
    playlist.loop();
    pause=false;
    looping = true;
  }
  if (key== 'S'|| key== 's') {
    looping = false;
    pause=true;
    playlist.pause();
    playlist.rewind(); //affects loop
  }

  //preferences might need to be in void draw
  int skip= 5000; //local might need global

  if (key== 'K'|| key== 'k') if (skip==5000) {
    skip = 50000;
  } else {
    skip=5000;
  }


  //if (key== 'F'|| key== 'f') playlist.skip(skip); //SKIP FORWARD 1 SECOND (100MILISECONDS)
  if (key== 'G'|| key== 'g') playlist.skip(-skip); //SKIP REVERSE 1 SECOND (100MILISECONDS)
  //
  if (key== 'M'|| key== 'm') if (playlist.isMuted()) {
    playlist.unmute();
  } else {
    playlist.mute();
  } //mutes individual song
  if (key== 'C'|| key== 'c') {
    currentSong =int(random(0, 3));
    playlist.pause();//pc plays harddrive file
    playlist.rewind();//multiple files play same time
    playlist =  minim.loadFile( filePathNameMusic[currentSong] );
    playlist.play();
    pause=false;
     println(currentSong);
  }
  println(currentSong);
  if ( key=='F' || key=='f' ) {
    /* NEXT Code
     - Order of Nested IFs: <10 seconds, between 10 & 75%, >75%, then else allows for regular skip on any file when not playing
     - Create a void next() to group this code if needing to use it other places
     - NEXT Button
     */
    if (playlist.position() < 100) {pause =true;playlist.pause();
    playlist.rewind();
          if (currentSong >=2) {
        currentSong=0; println("dopc");
      } else {
        currentSong+=1;println("dopb");
      } 
      
    playlist =  minim.loadFile( filePathNameMusic[currentSong] );
    playlist.play();
    pause=false; }
    //println(currentSong);
    if (playlist.position() >= 100 && playlist.position()<=playlist.length()*0.75 ) {playlist.skip(skip); println("au");}
    //
    if (playlist.position()>playlist.length()*0.75);
    {
      println(playlist.position());
      println(playlist.length()*0.75);
      playlist.pause();
      playlist.rewind();
      //trycatch solves arrayListOutOfBounds
      if (randomMusic==true) currentSong =int(random(numberMusicSongs - numberMusicSongs, numberMusicSongs)); else{
      if (currentSong >=2) {
        currentSong=0; println("dopa");
      } else {
        currentSong+=1;
      } 
      
      println("longer osition");
      println(currentSong);
      playlist =  minim.loadFile( filePathNameMusic[currentSong] );
      playlist.play();
      playlist.skip( skip ) ; //SKIP Forward 1 second (1000 milliseconds)
      //println ( "New Value of SKIP", skip, "Position:", playlist.position(), "Crossed Last 75%", playlist.position()>playlist.length()*0.75, "\t\tLast 75% starts at:", playlist.length()*0.75, "Song Ends at:", playlist.length() ) ;
    } } }
    if ( key=='R' || key=='r' ) {
      /* Previous Code
       - Order of Nested IFs: <10 seconds, between 10 & 75%, >75%, then else allows for regular skip on any file when not playing
       - Create a void next() to group this code if needing to use it other places
       */
      playlist.skip( -skip ) ; //SKIP Reverse 1 second (1000 milliseconds)
      //println ( "New Value of SKIP", skip, "Position:", playlist.position(), "Crossed Last 75%", playlist.position()>playlist.length()*0.75, "\t\tLast 75% starts at:", playlist.length()*0.75, "Song Ends at:", playlist.length() ) ;
    }
  }


void mousePressed() {
}
