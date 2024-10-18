import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X=0.0, musicButtonDIV_Y=0.0, musicButtonDIV_Width=0.0, musicButtonDIV_Height=0.0;
float musicButtonSquareX=0.0, musicButtonSquareY=0.0, musicButtonSquareWidth=0.0, musicButtonSquareHeight=0.0;
float stopX=0.0, stopY=0.0, stopWidth=0.0, stopHeight=0.0;
float quitThicknessLine, quitButtonX1, quitButtonY1, quitButtonX2, quitButtonY2;
float quitButtonX3, quitButtonY3, quitButtonX4, quitButtonY4;
//
color purple=#DB05FF, yellow=#FAFF00, white=#FFFFFF, black=#000000, orange=#C61429, blue=#03CCFC, lightblue=#17D18E;
color dayForeground=lightblue, dayHoverover=blue, dayBackground=white;
color darkForeground=yellow, darkHoverover=orange, darkBackground=black;
color nightForeground=lightblue, nightHoverover=yellow, nightBackground=black;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverOver, quitButtonLineColour;
//
Boolean colorNightMode=true;
//
void setup()
{
  size(1000, 800);
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
  //Work out a case Study:
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
    println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
    println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
    println ( padding1 );
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
    println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
    println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
    println ( padding1 );
  }
  stopWidth = musicButtonSquareWidth*3/5;
  stopHeight = stopWidth;
  stopX = musicButtonSquareX + musicButtonSquareX*1/4;
  stopY = musicButtonSquareY + musicButtonSquareY*2/5;
  println( stopX, stopY, stopWidth, stopHeight );
  quitThicknessLine = musicButtonSquareWidth / musicButtonSquareWidth + musicButtonSquareX*1/4*1/4;
  quitButtonX1 = stopX;
  quitButtonY1 = stopY;
  quitButtonX2 = stopX+stopWidth;
  quitButtonY2 = stopY+stopHeight;
  /*
  quitButtonX3 = ;
  quitButtonY4 = ;
  quitButtonX4 = ;
  quitButtonY4 = ;
  */
  quitButtonX3 = quitButtonX2;
  quitButtonY3 = quitButtonY1;
  quitButtonX4 = quitButtonX1;
  quitButtonY4 = quitButtonY2;
  //
  /* Music Button Square Formulae for IF Statement Above
   // Use Paper Folding and Case Study
   float padding = 1.0/5.0;
   float stopButtonSize = musicButtonSquareWidth*3/5;
   stopWidth = stopButtonSize;
   stopHeight = stopButtonSize;
   stopX = musicButtonSquareX + musicButtonSquareX*padding;
   stopY = musicButtonSquareY + musicButtonSquareY*padding;
   */
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
  String directory = "../.././" + musicPathway;
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
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  //
  if ( hour()<=7 || hour ()>=17)  {
    //Night Mode
    appColorForeground = nightForeground;
    appColorHoverover = nightHoverover;
    appColorBackground = nightBackground;
  } else if ( colorNightMode==false && ( hour()>7 || hour()<17 ) ) {
    //Day Mode
    appColorForeground = dayForeground;
    appColorHoverover = dayHoverover;
    appColorBackground = dayBackground;
  } else {
    //Dark Mode 
    appColorForeground = darkForeground;
    appColorHoverover = darkHoverover;
    appColorBackground = darkBackground;
  }
  //
} //End setup
//
void draw() {
  background(0); // Gray Scale: 0-255
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver = appColorHoverover; // See SetUp;
    quitButtonLineColour = appColorHoverover;
  } else {
    stopButtonHoverOver = appColorForeground; // See SetUp;
    quitButtonLineColour = appColorForeground;
  }
  fill(stopButtonHoverOver);
  //noStroke(); //Colour
  stroke(quitButtonLineColour);
  strokeWeight(quitThicknessLine);
  line( quitButtonX1, quitButtonY1, quitButtonX2, quitButtonY2 ); 
  //line( quitButtonX3, quitButtonY4, quitButtonX4, quitButtonY4 );
  line( quitButtonX3, quitButtonY3, quitButtonX4, quitButtonY4 );
  fill(255); //noFill();
  //stroke(1); //Reset default
  stroke(1); //Reset default
} //End draw
//
void mousePressed() {
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause(); //single tap
    } else {
      song[currentSong].rewind(); //double tap
    }
  }
} //End mousePressed
//
void keyPressed() {
  //if ( key=='P' || key=='p' ) song[currentSong].loop(); //Simple Play, no double tap possible
  //if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //if ( key=='s' || key=='S' ) song[currentSong].pause(); //Simple Play, no double tap possible
  if ( key=='S' | key=='s' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause(); //single tap
    } else {
      song[currentSong].rewind(); //double tap
    }
  }
} //End KeyPressed
//
// End Main Program
