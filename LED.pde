
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}
DigitalOutput[] digPinArray = new DigitalOutput[10];
int[] row={30,31,32,33,34,35,36,37,38,39,40};
int mode = 0;
//mode 0 is blackout
//rest of the modes represent whatever power point


void setupLED() {
 

  textAlign(CENTER, CENTER);
  textSize(128);

  new PIOIOManager(this).start();
}


void ioioSetup(IOIO ioio) throws ConnectionLostException {
  for(int i=0;i<digPinArray.length;i++) {
      digPinArray[i]= ioio.openDigitalOutput(row[i], false);
    }
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  fill(255);
  text(mode, width/2, height/2);
  
////BLACKOUT-----------------------------  
  if (mode == 0){
    for(int i=0;i<digPinArray.length;i++) {
      digPinArray[i].write(false);
    }
    delay(3000);
  }
  
////Point 1---------------------------   
  else if (mode == 1) {
      digPinArray[0].write(true);  
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }
////Point 2---------------------------   
  else if (mode == 2) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 3---------------------------   
  else if (mode == 3) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }
////Point 4---------------------------   
  else if (mode == 4) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 5---------------------------   
  else if (mode == 5) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 6---------------------------   
  else if (mode == 6) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 7---------------------------   
  else if (mode == 7) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 8---------------------------   
  else if (mode == 8) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
////Point 9---------------------------   
  else if (mode == 9) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  } 
////Point 10---------------------------   
  else if (mode == 10) {
    for ( int i=0; i<mode ; i++) {
      digPinArray[i].write(true);  
    }
    for (int i=0; i<10-mode ; i++) {
      digPinArray[mode+i].write(false);  
    }
  }  
//-----------------------------------------------  
  try {
    Thread.sleep(20);
  }
  catch(InterruptedException e) {
  }
}
