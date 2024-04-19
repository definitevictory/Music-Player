/*awawa
single and multiple executed code
text with rectangles
paste to dynamic program
*/
//Global Variables
float titleX, titleY, titleWidth, titleHeight;
float footerX, footerY,footerWidth,footerHeight;
PFont titleFont;
String title="awawawawa";
String footer="Tuesday";
int size; //int=number, float=decimal
color red=#FF0000, black=0;
//

//display geometry + orientation, landscape,portrait, square
fullScreen();
//Concatenation + Inspection of Variables
println("Displayer monitor:", "width:"+displayWidth, "\tHeight"+displayHeight);
int appWidth=displayWidth;
int appHeight=displayHeight;
//Population
titleX = appWidth*1/10;
titleY = appHeight*1/10;
titleWidth = appWidth*8/10;
titleHeight = appHeight*1/10;
footerX = appWidth*2/10;
footerY = appHeight*8/10;
footerWidth = appWidth*6/10;
footerHeight = appHeight*5/100;
//Single Executed Code: Font SETUP
//Fonts from OS
String[] fontList = PFont.list(); //To list all fonts available on OS
printArray(fontList); //see font use CreateFont
size=40;
titleFont = createFont("Elephant", size); //Tools/Create Font/ Find Font/ Use size field/ Dont press OK, bugs
//DIVs and rect()s
rect(titleX, titleY, titleWidth, titleHeight);
rect(footerX, footerY,footerWidth,footerHeight);
//rect (footer) assignment
//Repeated Code: draw()ing text
fill(red);
textAlign(CENTER, CENTER); //align X+Y in processing reference (left, center, right| top, center, Bottom ,baseline.
size=60;
textFont(titleFont, size);
text(title, titleX, titleY, titleWidth, titleHeight);
//
fill(black);
size=25;
textAlign(LEFT,CENTER);
textFont(titleFont,size);
text(footer, footerX, footerY,footerWidth,footerHeight);

