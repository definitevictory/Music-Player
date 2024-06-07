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
AudioPlayer soundEffects2;
AudioPlayer playList1;
int numberSoundEffects = 1;//OS able to count
int numberMusicSongs = 3;
String[] filePathNameMusic = new String[numberMusicSongs];
String[] filePathNameSoundEffect = new String[numberSoundEffects];
AudioPlayer playlist; // [numberMusicSongs];
AudioPlayer soundEffects;// [numberSoundEffects];
AudioMetaData[] playlistMetaData = new AudioMetaData[numberMusicSongs];
int currentSong = 0;
Boolean looping = false;
int LoopNumber = 0;
//
int appWidth, appHeight;


//
PFont QuitFont;
PFont TimeFont;
int size;
color red=#FF0000;
String Quittext="Quit";
String nameText="nameofsong";
//
PImage backgroundImage;
String backgroundImage2Name = "whiteModeBackground";
String backgroundImageName ="darkModeBackground";
String extension =".jpg";
String pathway ="../imagesFolder/";
String path = pathway+backgroundImageName+extension;
//
float CoverImageHeightAdjusted, CoverImageWidthAdjusted, CoverImageHeightAdjusted2, CoverImageWidthAdjusted2, CoverImageHeightShown, CoverImageWidthShown, imageYCENTER ;
float imageXLEFT, imageXCENTER;
PImage songCoverImage, songCoverImage2, songCoverImageShown;

//
color foregroundColour;
color white=255, yellow=#F0F000, black=0, grey=#121212, blue=#6BD0EA, purple=#FF00FF, green=#58DE00, weakRed=#E10000, orange=#FF9600,
  lightGrey=#E8E8E8, darkYellow=#969600, darkBlue=#08A4C9;//Hexadecimals in color selector
color backgroundColour, whiteBackground=255, darkBackground=0, nameColour, nameTextColour, tColour=weakRed, otherBackgroundColour, skipColour, skipHoverColour; //Grayscale, much smaller than color
Boolean dayMode=false; //starts at night mode
Boolean lightMode=false;
Boolean menuShow=false;//dark mode start can be changed if user preference is made
Boolean LoopMenu =false;
//


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
  String extensionMusic = ".mp3";
  String quitButtonSound = "Punch";
  String pathwaysoundEffects = "../soundEffects/"; //relative path
  print(pathwaysoundEffects+quitButtonSound+extensionMusic);
  String path = sketchPath(pathwaysoundEffects+quitButtonSound+extensionMusic);//absolute path
  //println (path) ;
  soundEffects1 = minim.loadFile(path);
  //playList1 = minim.loadFile(path);
  minim = new Minim(this);
  String pingSound= "Notification";
  String path2 = sketchPath(pathwaysoundEffects+pingSound+extensionMusic);
  soundEffects2 = minim.loadFile(path2);
  //
  // just put image X for right
  //

  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //see font use CreateFont
  size=40;
  QuitFont = createFont("Elephant", size); //Tools/Create Font/ Find Font/ Use size field/ Dont press OK, bugs
  TimeFont = createFont("Arial Black", size);
  //
  divs();
  drawRects();
  //Variable population
  String songCoverImagePath; //put this after divs or no work
  String coverPikachu ="Pokémon_Pikachu_art.png"; //change pic when you know what to put here
  String pathway ="../../imagesFolder/";
  songCoverImagePath = pathway+coverPikachu;
  songCoverImage=loadImage(songCoverImagePath);

  float smallerCoverDimension = (imageWidth < imageHeight)? imageWidth:imageHeight ;
  float CoverImageWidthPixel=548.0 ;
  float CoverImageHeightPixel= 512.0;
  float CoverAspectRatio = CoverImageWidthPixel/CoverImageHeightPixel;
  float largerCoverDimension =smallerCoverDimension*CoverAspectRatio; //Aspect Ratio
  if ( CoverImageWidthPixel < largerCoverDimension) {
    while (  CoverImageWidthPixel < largerCoverDimension) {
      largerCoverDimension-=1;
      smallerCoverDimension -=1;
    }
  }
  CoverImageWidthAdjusted=largerCoverDimension;
  CoverImageHeightAdjusted=smallerCoverDimension;
  ///////
  ///////
  String coverMansion ="mansion.jpg";
  songCoverImage2=loadImage(pathway+coverMansion);

  float smallerCoverDimension2 = (imageWidth < imageHeight)? imageWidth:imageHeight ;
  float CoverImageWidthPixel2=800.0 ;
  float CoverImageHeightPixel2= 400.0;
  float CoverAspectRatio2 = CoverImageWidthPixel2/CoverImageHeightPixel2;
  float largerCoverDimension2 =smallerCoverDimension2*CoverAspectRatio2; //Aspect Ratio
  if ( CoverImageWidthPixel2 < largerCoverDimension2) {
    while (  CoverImageWidthPixel2 < largerCoverDimension2) {
      largerCoverDimension2-=1;
      smallerCoverDimension2 -=0.5;
    }
  }
  CoverImageWidthAdjusted2=largerCoverDimension2;
  CoverImageHeightAdjusted2=smallerCoverDimension2;
  //
  //Music stuff
  String ALIVE = "ALIVE.mp3";
  String UNOwen = "U.N OwenWasHer.mp3";
  String GoldenNocturne = "Golden Nocturne.mp3";
  String PathwayMusic = "../Music/";

  //
  
  String pathMusicAlive = sketchPath(PathwayMusic+ALIVE);//absolute path
  String pathMusicUNOwen = sketchPath(PathwayMusic+UNOwen);
  String pathMusicGoldenNocturne = sketchPath(PathwayMusic+GoldenNocturne);
  //println ( path );
  //println("absolute path", pathMusicAlive);
  currentSong=0;
  filePathNameSoundEffect[0] = pathwaysoundEffects+ quitButtonSound+extensionMusic;
  filePathNameMusic[currentSong] = pathMusicAlive;
  filePathNameMusic[1] = pathMusicUNOwen;
  filePathNameMusic[2] = pathMusicGoldenNocturne;
  soundEffects = minim.loadFile( filePathNameSoundEffect[0] );
  currentSong= 0;
  //
  playlist =  minim.loadFile( filePathNameMusic[currentSong] );
  //println (minim.loadFile( filePathNameMusic[currentSong] ));
  soundEffects = minim.loadFile( filePathNameSoundEffect[0] );
  currentSong = numberMusicSongs - numberMusicSongs;
  playlistMetaData[0] = minim.loadFile(filePathNameMusic[0]).getMetaData();
  playlistMetaData[1] = minim.loadFile(filePathNameMusic[1]).getMetaData();
  playlistMetaData[2] = minim.loadFile(filePathNameMusic[2]).getMetaData();

  //
  //whiteMode= true; //must ask to see blue light
  //if ( hour ()>=9 && hour()<=17  ) backgroundColour = whiteBackground ;
  //if ( hour ()<9 && hour()>17  ) backgroundColour = darkBackground ;

  /* if (hour ()>=9 && hour()<=17) { dayMode=true;}
   
   if ( dayMode==true){foregroundColour = white;
   //change between light/dark modes
   lightMode=true;
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
   if ( hour ()>=9 && hour()<=17)foregroundColour = white; delete these later idk
   } */
  //
  //soundEffects1.loop();
} //End setup
//
void draw() {
  //background(backgroundColour); goes byebye cuz image is below, need image go away to show

  if (dayMode == true) {
    path = pathway+backgroundImage2Name+extension;
  }//change image
  if (dayMode == false) {
    path = pathway+backgroundImageName+extension;
  }
  if (lightMode == true) {
    backgroundColour = whiteBackground;
    foregroundColour = black; //black
    nameColour=blue;
    nameTextColour=black;
    otherBackgroundColour = lightGrey;
    skipColour=blue;
    skipHoverColour=darkBlue;
    songCoverImageShown = songCoverImage;
    CoverImageWidthShown = CoverImageWidthAdjusted;
    CoverImageHeightShown = CoverImageHeightAdjusted;
    imageXCENTER = imageX + (imageWidth-CoverImageWidthAdjusted)/2 ;
    imageXLEFT = imageWidth + imageX - CoverImageWidthAdjusted;
    imageYCENTER = imageY + (imageHeight-CoverImageHeightAdjusted)/2;
  } else {
    backgroundColour = darkBackground;
    foregroundColour = yellow; //yellow,  hour ()<9 && hour()>17)
    nameColour=grey;
    nameTextColour=white;
    otherBackgroundColour = grey;
    skipColour = yellow;
    skipHoverColour = darkYellow;
    songCoverImageShown = songCoverImage2;
    CoverImageWidthShown = CoverImageWidthAdjusted2;
    CoverImageHeightShown = CoverImageHeightAdjusted2;
    imageXCENTER = imageX + (imageWidth-CoverImageWidthAdjusted2)/2 ;
    imageXLEFT = imageWidth + imageX - CoverImageWidthAdjusted2;
    imageYCENTER = imageY + (imageHeight-CoverImageHeightAdjusted2)/2;
  }


    playlistMetaData[currentSong] =playlist.getMetaData();
  //printArray(filePathNameMusic[0]);
  println(playlistMetaData[currentSong].length());
  println(currentSong);
  Colouring();
  MUSICA();

  //


  //println(dayMode);
  //println(lightMode);
} //End draw
//
void keyPressed() { //Listener
  if (key=='Q' || key=='q') {
    soundeffect_2();
  };
  if (key==CODED && keyCode==ESC) exit();
  if (key=='E' || key=='e') {
    if (dayMode == false) {
      dayMode = true;
    } else {
      dayMode = false;
    }
  }
  if (key=='O' || key=='o') {
    if (lightMode == false) {
      lightMode = true;
    } else {
      lightMode = false;
    }
  }
  if (key=='A' || key=='a') {
    playlist.loop();
    ;
  }

  if (key== 'E'|| key== 'e') {//End loop once
    playlist.loop(LoopNumber);
    looping = true;
  }
  if (key== 'R'|| key== 'r') {// end loop infinite
    playlist.loop();
    looping = true;
  }
  if (key== 'S'|| key== 's') {
    looping = false;
    playlist.pause();
    playlist.rewind(); //affects loop
  }
  int skip;
  skip = 5000;
  if (key== 'G'|| key== 'g') playlist.skip(skip);
  if (key== 'B'|| key== 'b') currentSong+=1;
      if (key== 'C'|| key== 'c') currentSong = int(random(numberMusicSongs - numberMusicSongs, numberMusicSongs));
            if (key== 'L'|| key== 'l')       playlist.pause();
      playlist.rewind();
      currentSong = int(random(numberMusicSongs - numberMusicSongs, numberMusicSongs));
            playlist =  minim.loadFile( filePathNameMusic[currentSong] );
      playlist.play();
}


//for whitemode
//End keyPressed
//


void mousePressed() { //Listener
  if ( mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitHeight)
  {
    soundeffect_1();
  }
  //play button
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    if (playlist.isPlaying()) {
      playlist.pause();
    } else {
      playlist.play();
    }
  }
  if (mouseX>menuX && mouseX<menuX+menuWidth && mouseY>menuY && mouseY<menuY+menuHeight) {
    if (menuShow == false) {
      menuShow = true;
    } else {
      menuShow=false;
    }
  }
  if (mouseX>LoopX && mouseX<LoopX+LoopWidth && mouseY>LoopY && mouseY<LoopY+LoopHeight) if (LoopMenu==false) {
    LoopMenu=true;
  } else {
    LoopMenu=false;
  }
  if (mouseX>LoopMCX && mouseX<LoopMCX+LoopMCWidth && mouseY>LoopMCY && mouseY<LoopMCY+LoopMCHeight) if (LoopMenu==true) {
    LoopMenu=false;



    //
    //
  } //End mousePressed
}

//
// End MAIN Program
