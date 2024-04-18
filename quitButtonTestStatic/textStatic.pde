/*awawa
single and multiple executed code
text with rectangles
paste to dynamic program
*/
//Global Variables
float titleX, titleY, titleWidth, titleHeight;
PFont titleFont;
String title="awawawawa";
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
//Single Executed Code: Font SETUP
//Fonts from OS
String[] fontList = PFont.list(); //To list all fonts available on OS
printArray(fontList); //see font use CreateFont
titleFont = createFont("Elephant", 68); //Tools/Create Font/ Find Font/ Use size field/ Dont press OK, bugs
//DIVs and rect()s
rect(titleX, titleY, titleWidth, titleHeight);
//rect (footer)
//Repeated Code: draw()ing text
textFont(titleFont, 20);
text(title, titleX, titleY, titleWidth, titleHeight);
