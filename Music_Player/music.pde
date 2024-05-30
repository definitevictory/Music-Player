 void MUSICA () {
  //
  //
    if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()!=-1 ) println("There are", playlist[currentSong].loopCount(), "loops left.");
  if ( playlist[currentSong].isLooping() && playlist[currentSong].loopCount()==-1 ) println("Looping Infinitely");
  
  if (!playlist[currentSong].isPlaying()) println("nothing is playing pick a song.");
  if ( playlist[currentSong].isPlaying() && !playlist[currentSong].isLooping() ) println("Play Once");

  //playlist[currentSong].loop(0); //only play beginning over and over
  if ( playlist[currentSong].isPlaying() ) {
    if ( !playlist[currentSong].isPlaying() && looping==true ) looping=false; //stops loop if no song playing
    //Empty IF, IS FALSE
  } else if (looping == false && !playlist[currentSong].isPlaying() && playlist[currentSong].length() < 60000) {
    playlist[currentSong].rewind();//pain minutes in 3 , 180second, 180 000 ms. if time remaining less thatn, restart
    //true if song less than something seconds stop, if greater then restart
  } else if (looping == false && !playlist[currentSong].isPlaying() && (playlist[currentSong].position() > playlist[currentSong].length()*0.8)) {
    playlist[currentSong].rewind();
  }
   println("umu", playlist[currentSong].position(), "songLength", playlist[currentSong].length());
 }
