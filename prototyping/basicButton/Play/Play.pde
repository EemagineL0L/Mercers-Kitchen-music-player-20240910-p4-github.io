import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
float musicButtonDIV_X=0.0, musicButtonDIV_Y=0.0, musicButtonDIV_Width=0.0, musicButtonDIV_Height=0.0;
float musicButtonSquareX=0.0, musicButtonSquareY=0.0, musicButtonSquareWidth=0.0, musicButtonSquareHeight=0.0;
float stopX=0.0, stopY=0.0, stopWidth=0.0, stopHeight=0.0;
color pink = #E502AD;
color blue = #0207E5;
void setup()
{
  size(1000, 800);
  //size(400, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study: Landscape
  musicButtonSquareWidth = musicButtonDIV_Height;
  musicButtonSquareHeight = musicButtonDIV_Height;
  float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
  float padding2 = padding1*1/2; ////working out value needed, with formulae
  musicButtonSquareX = musicButtonDIV_X + padding2; //note: minus moves it the wrong way, difficult to see
  musicButtonSquareY = musicButtonDIV_Y;
  println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  println ( padding1 );
  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;
  //
  //Work out a case Study: Portrait
  /*
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { //error: square does not go in the middle
   //Work out a case Study:
   if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
   // musicButtonWidth needs to change
   musicButtonSquareWidth = musicButtonDIV_Height;
   musicButtonSquareHeight = musicButtonDIV_Height;
   musicButtonSquareX = musicButtonDIV_X + ( ( musicButtonDIV_Width - musicButtonDIV_Height )*1/2 );
   musicButtonSquareWidth = musicButtonDIV_Height ;
   musicButtonSquareHeight = musicButtonDIV_Height ;
   float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
   float padding2 = padding1*1/2; ////working out value needed, with formulae
   musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
   musicButtonSquareY = musicButtonDIV_Y;
   } else {
   println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
   println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
   println ( padding1 );
   } else { //Portrait
   // musicButtonHeight needs to change
   musicButtonSquareWidth = musicButtonDIV_Width;
   musicButtonSquareWidth = musicButtonDIV_Width ;
   musicButtonSquareHeight = musicButtonDIV_Width;
   musicButtonSquareX = musicButtonDIV_X;
   musicButtonSquareY = musicButtonDIV_Y + musicButtonDIV_Width*1/2;
   float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
   float padding2 = padding1*1/2; ////working out value needed, with formulae
   musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
   musicButtonSquareY = musicButtonDIV_Y + padding2;
   println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
   println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
   println ( padding1 );
   }
   */
  //float padding = 1.0/4.0;
  //float stopButtonSize = 1.0-(1.0/4.0);
  /*
  stopWidth = musicButtonDIV_Width*stopButtonSize; //stopButtonSize
   stopHeight = musicButtonDIV_Height*stopButtonSize; //stopButtonSize
   stopX = musicButtonDIV_X+padding;
   stopY = musicButtonDIV_Y+padding;
   */
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String ariamath = "ariamath";
  String miceonvenus = "miceonvenus";
  String otherside = "otherside";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + ariamath + mp3FileName;
  song[currentSong] = minim.loadFile( file );
  file = directory + miceonvenus + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + otherside + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
} //End setup
//
void draw() {
  background(0); //Gray Scale: 0-255, full BLUE Colour
  //
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  //
  /* Note: 3 types of colour, in pairs for hoverover
   - Day: TBA-foreground | TBA-background (Hoverover)
   - Dark: TBA-foreground | TBA-background (Hoverover)
   - Night, no blue: TBA-foreground | TBA-background (Hoverover)
   - Dark Mode is for all the time, how bright the screen is and eye strain
   - API: when does sunrise, when does sunset, is the system time within those hours
   - Night mode is for all the time or just
   - Note: preferences are hardcoded here but can be choices in CS20
   */
  //if ( day ) {} else if ( dark ) {} else {}
  //
  //Hoverover IF - Used in all other buttons too
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopX = pink;
  } else {
    stopY = blue;
  }
  fill(blue);
  //stroke(); //Colour
  noStroke(); //Colour
  //
  rect( stopX, stopY, stopWidth, stopHeight ); //(X, Y, width, height, roundedEdge1, roundedEdge2, roundedEdge3, roundedEdge4, )
  fill(255); //noFill();
  //noStroke();
  stroke(1); //Reset default
  //
  //Music Buttons Interactions: cascading IFs can become AND Statements
  //Note: keypressed must have click on screen
  //
} //End draw
//
void mousePressed() {
  //Boolean for Click
  //if() {} else {}
  //
  /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  /* if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
   if ( song[currentSong].isPlaying() ) {
   song[currentSong].pause(); //single tap
   } else {
   song[currentSong].rewind(); //double tap
   }
   }
   */
  //
} //End mousePressed
//
void keyPressed() {
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //
  //if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Simble is two triangles
   This changes what the button might become after it is pressed
   */
  if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  /* if ( key=='S' | key=='s' ) {
   if ( song[currentSong].isPlaying() ) {
   song[currentSong].pause(); //single tap
   } else {
   song[currentSong].rewind(); //double tap
   }
   }
   */
} //End keyPressed
//
// End Main Program
