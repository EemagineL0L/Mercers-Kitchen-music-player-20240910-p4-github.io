/* META Data - strings
*/
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
//
int appWidth, appHeight;
float metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1;
float metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2;
float metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3;
//
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playlist = new AudioPlayer [numberOfSongs];
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs]; //might change
AudioMetaData[] playListPostionMetaData = new AudioMetaData[numberOfSongs]; //might change
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //might change
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //might change
int currentSong = numberOfSongs - numberOfSongs;
//REview it more meta data needed
void setup()
{
 fullScreen();
 appWidth = displayWidth;
 appHeight = displayHeight;
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
  //population
  metaDataX1 = appWidth*1/10; // Title
  metaDataY1 = appHeight*4/10;
  metaDataWidth1 = appWidth*8/10;
  metaDataHeight1 = appHeight*1/10;
  metaDataX2 = appWidth*1/10; //Song Postition
  metaDataY2 = appHeight*3/10;
  metaDataWidth2 = appWidth*3/10;
  metaDataHeight2 = appHeight*1/10;
  metaDataX3 = appWidth*6/10; //Total Song Length | Time Remaining
  metaDataY3 = appHeight*5/10;
  metaDataWidth3 = appWidth*3/10;
  metaDataHeight3 = appHeight*1/10;
  //
  //DIV //X, Y, Width, Height
  rect(metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1 );
  rect(metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2 );
  rect(metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3 );
}
void draw() {
} //End draw
//
void mousepressed() {} //End mousepressed
//
void keyPressed() {} //End keypressed
//End MAIN
