///////////////LIBRARIES////////////////
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

///////////////VARIABLES////////////////
private DigitalOutput[] digPinArray = new DigitalOutput[10];
int[] row= {
  30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
};
int powerLED = 10;
DigitalInput glove;
boolean gloveState = false;
AnalogInput photoresistor;
static final int BLACKOUT = 0;
static final int POWER = 1;
static final int PAUSE = 2;
static final int SHOOT = 3;
static final int SHIMMER = 4;
float value;
int photo;
/////////////////////FUNCTIONS/////////////////////////////////

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  photoresistor = ioio.openAnalogInput(45);
  glove = ioio.openDigitalInput(10, DigitalInput.Spec.Mode.PULL_DOWN);

  for (int i=0;i<digPinArray.length;i++) {
    digPinArray[i]= ioio.openDigitalOutput(row[i], true);
  }
}

synchronized void ioioLoop(IOIO ioio) throws ConnectionLostException {
  background(0);
  
  println("photo: " +photo);
  println("phoneVal1: " + phoneVal1 + ", powerLED: "+powerLED);
  
  /////////////////////TANK MAINTENANCE/STATUS///////////////////////////
  tankEmpty = 0;
  
  //DEPLETING TANK-------------------------------- 
  if (phoneVal1 == POWER) { //when powering the gauntlet, you lose power from tank
    powerLED--;
    delay(750);
  }
//  else if (photo <57){ //for now you get more power if you aren't using it, want to make it that you find it
//    powerLED ++;
//    delay(500);
//  }
// else if (gloveState){ //for now you get more power if you aren't using it, want to make it that you find it
//    powerLED ++;
//    delay(500);
//  }
  else if (gloveState && photo<57){ //for now you get more power if you aren't using it, want to make it that you find it
    powerLED ++;
    delay(500);
  }
  else { //for now you get more power if you aren't using it, want to make it that you find it
//    powerLED ++;
//    delay(500);
  }
  //TANK MAX AND MIN & TANK CHECKER ---------------------------
  if (powerLED <= 0) {
    powerLED = 0;
    tankEmpty = 1;
   // led.write(true);
  }
  else {
    tankEmpty = 0;
  }
  
  
  if (powerLED >10) {
    powerLED = 10;
      tankEmpty = 2;
  }
  sendOSC(tankEmpty);//let's send off the tank status to everyone
////////////////////////LIGHTING UP TANK/////////////////////////
  ////BLACKOUT-----------------------------  
  if (powerLED == 0) {

    for (int i=0;i<digPinArray.length;i++) {
      digPinArray[i].write(false);
    }
  }
  ////Point 1---------------------------   
  else if (powerLED == 1) {
    digPinArray[0].write(true);  
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }
  ////Point 2---------------------------   
  else if (powerLED == 2) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 3---------------------------   
  else if (powerLED == 3) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }
  ////Point 4---------------------------   
  else if (powerLED == 4) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 5---------------------------   
  else if (powerLED == 5) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 6---------------------------   
  else if (powerLED == 6) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 7---------------------------   
  else if (powerLED == 7) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 8---------------------------   
  else if (powerLED == 8) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 9---------------------------   
  else if (powerLED == 9) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  } 
  ////Point 10---------------------------   
  else if (powerLED == 10) {
    for ( int i=0; i<powerLED ; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED ; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  //-----------------------------------------------  
  print ("LED:" + powerLED);
  try {
    value = photoresistor.read();
     photo = int(value *1000);
    gloveState = glove.read();
    println("glove:"+gloveState);
    Thread.sleep(20);
  }
  catch(InterruptedException e) {
  }
}

