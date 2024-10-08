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
  String directory = "../" + musicPathway;
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
  //background(200); // Gray Scale: 0-255
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  //fill();
  rect( stopX, stopY, stopWidth, stopHeight );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
