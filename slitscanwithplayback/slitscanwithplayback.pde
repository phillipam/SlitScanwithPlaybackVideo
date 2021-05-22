// HELLO :) THIS IS SELEKTOR HERE AKA PHILLIP MUZZALL
// WELCOME TO MY SLIT SCAN CODE
// YOU WILL SEE THAT I HAVE ADDED SOME EXTENSIVE NOTES JUST INCASE YOU AREN'T
// FLUENT IN UNDERSTANDING GENERAL CODE (I'M VERY NOT)
// I RECCOMEND PUTTING EVERYTHING YOU DO WITH THIS PROGRAM ON A 
// EXPANSIVE SEPARATE STORAGE DEVICE AS, ESPECIALLY THE USE OF VIDEO AND RECORDING
// TAKES UP A TON OF DATA!!

//
// ADDED THE FEATURE TO RECORD VIA SCREENSHOTS
// """""""""""""""""""""""""""""""" TO USE PLAYBACK FOOTAGE INSTEAD OF INPUT VIDEO

// IF YOU HAVE ANY THING TO FIX OR ADD ON PLEASE SHARE WITH OTHERS :) 

import processing.video.*;

Movie video;

int x = 0; 

void setup() {
  //IMPORTANT TO CHANGE THIS RESOLUTION SIZE TO THE SAME AS YOUR INTENDED VIDEO
  size(2580, 1080);
  //CHANGE RGB COLOUR MODE - CURRENTLY IT IS BLUE 
  background(0, 128, 255);
  //                      CHANGE THIS TO THE TITLE OF UR VIDEO
  //                      THAT IS IN YOUR PROCESSING FOLDER
  //                        VVVVVV
  video = new Movie(this, "your video mate.mov");
  video.play();
  video.noLoop();
  //THE LOWER SPEED VALUE THE MORE STRETCHED OUT THE SCAN WILL BE
  //THE HIGHER "" THE SHORTER IT WILL BECOME, BUT VERY DETAILED
  video.speed(.15);
}

void movieEvent(Movie video) {
  video.read();
}

void draw() {
  //image(myMovie, 0, 0);
  int w = video.width;
  int h = video.height;
  //         CHANGE TO WHERE YOU WANT THE PIXELS TO COPY FROM (VERTICALLY)
  //          VVVV
  copy(video, 1920, 0, 1, h, x, 0, 1, h); 
  
  x = x + 1;
  //to repeat it over the existing scan
  if (x > width) {
    x = 0;
    //actually unsure if this does anything,
    //but i include it just incase...
    frameRate(24);
  }
  //OUTPUT FOLDER WOULD BE WHERE YOU SAVED YOUR .pde FILE AT
  //YOU ARE ABLE TO CHANGE THE NAME BEFORE THE _####
  //.tiff FILES ARE THE BEST QUALITY YOU WILL GET OUT OF THIS
  saveFrame("output/whatever_####.tiff");
}
