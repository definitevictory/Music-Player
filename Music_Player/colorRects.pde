void Colouring () {
  float ProgressBarTime;
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
  text(nameText, songNameX*110/100, songNameY, songNameWidth, songNameHeight);
  //

  float bruh;
  bruh = (((playlist[currentSong].length()+0.0001)/60000) - ((playlist[currentSong].position()+0.0001)/60000)); //maybe multiply by loop numbers to find timer when looped
  //println (nf(bruh, 0, 2));
  //println( bruh);
  int something = ((playlistMetaData[0].length()/1000)/60);
  int another =  (playlistMetaData[0].length()/1000)-((playlistMetaData[0].length()/1000)/60 * 60);
  //float awawawawa = (something,another);
  float timeSecond;
  timeSecond =(another - ((playlist[currentSong].position()+0.0001)/60000*60));
  //println(another - ((playlist[currentSong].position()+0.0001)/60000*60));
  float timeMinute;
  timeMinute= (something);
  if (timeSecond<0) {
    while (timeSecond<0)
    {
      timeSecond+=60;
      timeMinute-=1;
    }
  };
  println(timeSecond);
  println(timeMinute);
  textAlign(LEFT, CENTER);
  fill(nameTextColour);
  textFont(TimeFont, size);
  text((nf(int(timeMinute+1-0.1), 0, 0)), timeX, timeY*103/100);
  textAlign(LEFT, CENTER);
  fill(nameTextColour);
  textFont(TimeFont, size);
  text(nf(int(timeSecond), 0, 0), timeX*105/100, timeY*103/100);
  //
  fill(tColour);
  rect(tbarX, tbarY, tbarWidth, tbarHeight);
  //
  fill(green);

  ProgressBarTime=(float)playlist[currentSong].position()/playlist[currentSong].length(); //
  //println(printinhour); test
  rect(tprogressX, tprogressY, tprogressWidth*ProgressBarTime, tprogressHeight);


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
  if (mouseX>menuX && mouseX<menuX+menuWidth && mouseY>menuY && mouseY<menuY+menuHeight) {
    fill(skipHoverColour);
    rect(menuX, menuY, menuWidth, menuHeight);
  }
  //
  if (menuShow == true) {
    fill (blue);
    rect (menuGUIX, menuGUIY, menuGUIWidth, menuGUIHeight);
  }
  //

  if (mouseX>LoopX && mouseX<LoopX+LoopWidth && mouseY>LoopY && mouseY<LoopY+LoopHeight)
  {
    fill(green);
    rect(LoopX, LoopY, LoopWidth, LoopHeight);
  } else {
    fill(otherBackgroundColour);
    rect(LoopX, LoopY, LoopWidth, LoopHeight);
  } //maybe make them all like if else

  //
  //Image
  //
  image(songCoverImageShown, imageXCENTER, imageYCENTER, CoverImageWidthShown, CoverImageHeightShown);
  //
  if (LoopMenu==true) {
    fill(green);
    rect(LoopMX, LoopMY, LoopMWidth, LoopMHeight);
    fill(red);
    rect (LoopMCX, LoopMCY, LoopMCWidth, LoopMCHeight);
  }
}
