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
float stopX, stopY, stopWidth, stopHeight;
//
void setup()
{
  size(900, 900);
 appWidth = width;
 appHeight = height;
  //variables for any music buttons
  stopWidth = appWidth*1/2;
  stopHeight = appHeight*1/2;
  stopX = stopWidth - stopWidth*1/2; 
  stopY = stopWidth - stopHeight*1/2; 
 if ( stopWidth > stopHeight) {
 } else {
 }
//
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String ariamath = "ariamath";
  String miceonvenus = "miceonvenus";
  String otherside = "otherside";
  //
  //Add Reading into Array
  String directory = "../../" + musicPathway;
  println ( currentSong, directory );
  String file = directory + ariamath + mp3FileName;
  println (file);
  song[currentSong] = minim.loadFile( file );
  file = directory + miceonvenus + mp3FileName;
  println (file);
  song[currentSong+=1] = minim.loadFile( file );
  println( currentSong, song[currentSong] );
  file = directory + otherside + mp3FileName;
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y,, Width, Height );
   rect( stopX, stopY, stopHeight, stopWidth );
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
