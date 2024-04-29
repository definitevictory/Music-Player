void soundeffect_1() {
  int loopOnce = 0;
  int timeForSoundEffect = 1500; //Parameter:milliseconds
  soundEffects1.loop(loopOnce);
  delay(timeForSoundEffect); 
  exit() ;
} //End soundeffect_1
void soundeffect_2() {
  String awa="awa";
  int loopOnce = 0;
  int timeForSoundEffect = 1000;
  soundEffects2.loop(loopOnce);
  delay(timeForSoundEffect);
  println(awa);
  return;
}
