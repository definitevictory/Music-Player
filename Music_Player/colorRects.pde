void Colouring () {
  float ProgressBarTime;
  String Inf = "Infinite";
  backgroundImage = loadImage(path) ;
  image(backgroundImage, backimageX, backimageY, backimageWidth, backimageHeight);
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
  textFont(QuitFont, size); //change this font later look bad
  String nameText1 = "Alive";
  String nameText2 = "UN Owen Was Her";
  String nameText3 = "Golden Nocturne";
  if (currentSong ==0)nameText=nameText1;
  if (currentSong ==1)nameText=nameText2;
  if (currentSong ==2)nameText=nameText3;
  text(nameText, songNameX*110/100, songNameY, songNameWidth, songNameHeight);
  //

  float bruh;
  bruh = (((playlist.length()+0.0001)/60000) - ((playlist.position()+0.0001)/60000)); //maybe multiply by loop numbers to find timer when looped
  //println (nf(bruh, 0, 2));
  //println( bruh);
  int something = ((playlistMetaData[currentSong].length()/1000)/60);
  int another =  (playlistMetaData[currentSong].length()/1000)-((playlistMetaData[currentSong].length()/1000)/60 * 60);
  //float awawawawa = (something,another);
  float timeSecond;
  timeSecond =(another*(LoopTimes) - ((playlist.position()+0.0001)/60000*60));
  //println(another - ((playlist.position()+0.0001)/60000*60));
  float timeMinute;
  timeMinute= (something*(LoopTimes));
  if (timeSecond<0) {
    while (timeSecond<0)
    {
      timeSecond+=60;
      timeMinute-=1;
    }
  };
  if (timeSecond>60) {
    while (timeSecond>60)
    {
      timeSecond-=60;
      timeMinute+=1;
    }
  };
  // println(timeSecond);
  //println(timeMinute);
  if (Infinite ==false) {
    println(playlistMetaData[currentSong].length());
    textAlign(LEFT, CENTER);
    fill(nameTextColour);
    textFont(TimeFont, size);
    text((nf(int(timeMinute+1-0.1), 0, 0)), timeX*99.75/100, timeY*103/100);
    textAlign(LEFT, CENTER);
    fill(nameTextColour);
    textFont(TimeFont, size);
    String TimerThing = ":";
    text(TimerThing, timeX*102.5/100, timeY*102.45/100);
    fill(nameTextColour);
    textFont(TimeFont, size);
    textAlign(LEFT, CENTER);
    text(nf(int(timeSecond), 0, 0), timeX*104/100, timeY*103/100);
  } else {
    text(Inf, timeX*99.75/100, timeY, timeWidth*2, timeHeight);
  }
  //
  fill(tColour);
  rect(tbarX, tbarY, tbarWidth, tbarHeight);
  //
  fill(green);

  ProgressBarTime=(float)playlist.position()/(playlist.length()); //
  println(ProgressBarTime);
  println(playlist.position());
  rect(tprogressX, tprogressY, tbarWidth*ProgressBarTime, tprogressHeight);


  fill(otherBackgroundColour);
  rect(playX, playY, playWidth, playHeight);
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    fill(orange);
    rect(playX+playWidth*8/100, playY+playHeight*8/100, playWidth*86/100, playHeight*86/100);
  }
  PImage playImage;
  String playpic ="play3.png";
  playImage=loadImage(pathway+playpic);

  float smallerPicDimension1 = (playWidth < playHeight)? playWidth:playHeight ;
  float picImageWidthPixel1=225.0 ;
  float picImageHeightPixel1= 225.0;
  float picAspectRatio1 = picImageWidthPixel1/picImageHeightPixel1;
  float largerPicDimension1 =smallerPicDimension1*picAspectRatio1; //Aspect Ratio
  if ( picImageWidthPixel1 < largerPicDimension1) {
    while (  picImageWidthPixel1 < largerPicDimension1) {
      largerPicDimension1-=1;
      smallerPicDimension1 -=1;
    }
  }
  image(playImage, playX, playY, playWidth, playHeight); //background not transparent for no reason
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
  PImage reverseImage;
  String reversePic ="reverse2.png";
  reverseImage=loadImage(pathway+reversePic);

  float smallerPicDimension2 = (rewindWidth < rewindHeight)? rewindWidth:rewindHeight ;
  float picImageWidthPixel2=200.0 ;
  float picImageHeightPixel2= 200.0;
  float picAspectRatio2 = picImageWidthPixel2/picImageHeightPixel2;
  float largerPicDimension2 =smallerPicDimension2*picAspectRatio2; //Aspect Ratio
  if ( picImageWidthPixel2 < largerPicDimension2) {
    while (  picImageWidthPixel2 < largerPicDimension2) {
      largerPicDimension2-=1;
      smallerPicDimension2 -=1;
    }
  }
  image(reverseImage, rewindX, rewindY, rewindWidth, rewindHeight);

  //
  fill(otherBackgroundColour);
  rect(forwardX, forwardY, forwardWidth, forwardHeight);
  if (mouseX>forwardX && mouseX<forwardX+forwardWidth && mouseY>forwardY && mouseY<forwardY+forwardHeight) {
    fill(orange);
    rect(forwardX, forwardY, forwardWidth, forwardHeight);
  }
  PImage forwardImage;
  String forwardPic ="forward2.png";
  forwardImage=loadImage(pathway+forwardPic);

  float smallerPicDimension3 = (forwardWidth < forwardHeight)? forwardWidth:forwardHeight ;
  float picImageWidthPixel3=450.0 ;
  float picImageHeightPixel3= 450.0;
  float picAspectRatio3 = picImageWidthPixel3/picImageHeightPixel3;
  float largerPicDimension3 =smallerPicDimension3*picAspectRatio3; //Aspect Ratio
  if ( picImageWidthPixel3 < largerPicDimension3) {
    while (  picImageWidthPixel3 < largerPicDimension3) {
      largerPicDimension3-=1;
      smallerPicDimension3 -=1;
    }
  }
  image(forwardImage, forwardX, forwardY, forwardWidth, forwardHeight);
  //
  //
  //
  fill(otherBackgroundColour);
  rect(volbarX, volbarY, volbarWidth, volbarHeight);
  PImage volImage;
  String volPic ="volume2.png";
  volImage=loadImage(pathway+volPic);

  float smallerPicDimension4 = (volPicWidth < volPicHeight)? volPicWidth:volPicHeight ;
  float picImageWidthPixel4=225.0 ;
  float picImageHeightPixel4= 225.0;
  float picAspectRatio4 = picImageWidthPixel4/picImageHeightPixel4;
  float largerPicDimension4 =smallerPicDimension4*picAspectRatio4; //Aspect Ratio
  if ( picImageWidthPixel4 < largerPicDimension4) {
    while (  picImageWidthPixel4 < largerPicDimension4) {
      largerPicDimension4-=1;
      smallerPicDimension4 -=1;
    }
  }
  image(volImage, volPicX, volPicY, volPicWidth, volPicHeight);

  //
  /*fill(skipColour);
  rect(skipX, skipY, skipWidth, skipHeight);
  if (mouseX>skipX && mouseX<skipX+skipWidth && mouseY>skipY && mouseY<skipY+skipHeight) {
    fill(skipHoverColour);
    rect(skipX, skipY, skipWidth, skipHeight);
  }*/
  //

  fill(skipColour);
  rect(menuX, menuY, menuWidth, menuHeight);
  if (mouseX>menuX && mouseX<menuX+menuWidth && mouseY>menuY && mouseY<menuY+menuHeight) {
    fill(skipHoverColour);
    rect(menuX, menuY, menuWidth, menuHeight);
  }
  //
  if (menuShow == true) {
    fill (blue);
    rect (menuGUIX, menuGUIY, menuGUIWidth, menuGUIHeight);
    fill(green);
  }
  //

  if (mouseX>LoopX && mouseX<LoopX+LoopWidth && mouseY>LoopY && mouseY<LoopY+LoopHeight)
  {
    fill(green);
    rect(LoopX, LoopY, LoopWidth, LoopHeight);
    fill(blue);
    rect(LoopX+LoopWidth*10/100, LoopY+LoopHeight*23/100, LoopWidth*80/100, LoopHeight*1/8);
    fill(blue);
    rect(LoopX+LoopWidth*10/100, LoopY+LoopHeight*48/100, LoopWidth*80/100, LoopHeight*1/8);
    fill(blue);
    rect(LoopX+LoopWidth*10/100, LoopY+LoopHeight*73/100, LoopWidth*80/100, LoopHeight*1/8);
  } else {
    fill(otherBackgroundColour);
    rect(LoopX, LoopY, LoopWidth, LoopHeight);
  } //maybe make them all like if else

  //Image
  //
  image(songCoverImageShown, imageXCENTER, imageYCENTER, CoverImageWidthShown, CoverImageHeightShown);
  //
  if (LoopMenu==true) {
    fill(green);
    rect(LoopMX, LoopMY, LoopMWidth, LoopMHeight);
    fill(yellow);
    rect (LoopMCX, LoopMCY, LoopMCWidth, LoopMCHeight);
    fill(yellow);
    rect(LoopaddX, LoopaddY, LoopaddWidth, LoopaddHeight);
    fill(yellow);
    rect(LoopInfX, LoopInfY, LoopInfWidth, LoopInfHeight);
   PImage InfImage;
  String InfPic ="InfiniteSymbol.png";
  InfImage=loadImage(pathway+InfPic);

  float smallerPicDimension5 = (LoopInfWidth< LoopInfHeight)? LoopInfWidth: LoopInfHeight ;
  float picImageWidthPixel5=225.0 ;
  float picImageHeightPixel5= 225.0;
  float picAspectRatio5 = picImageWidthPixel5/picImageHeightPixel5;
  float largerPicDimension5 =smallerPicDimension5*picAspectRatio5; //Aspect Ratio
  if ( picImageWidthPixel5 < largerPicDimension5) {
    while (  picImageWidthPixel5 < largerPicDimension5) {
      largerPicDimension5-=1;
      smallerPicDimension5 -=1;
    }}
    image(InfImage, LoopInfX, LoopInfY, LoopInfWidth, LoopInfHeight);
    fill(yellow);
    rect (SkipSwitchX, SkipSwitchY, SkipSwitchWidth, SkipSwitchHeight);
    textAlign(LEFT, CENTER);
    fill(yellow);
    textFont(TimeFont, size);
    int LoopCountShow =playlist.loopCount();
    LoopCountShow =playlist.loopCount();
    String Looptext = "Loops left:";
    text(Looptext, LoopInfX, LoopInfY*120/100, LoopInfWidth*3, LoopInfHeight);
    if (Infinite == false)
      text(LoopCountShow, LoopInfX, LoopInfY*130/100);
    else {
      text(Inf, LoopInfX, LoopInfY*125/100, LoopInfWidth*3, LoopInfHeight);
    }
    fill(yellow);
    rect(LightModeX, LightModeY, LightModeWidth, LightModeHeight);
    fill(yellow);
  rect(NightModeX, NightModeY, NightModeWidth, NightModeHeight);
  } 
}
