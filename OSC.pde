
///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.3";
String everyoneIP = "10.0.1.255";
String phoneName = "/PHONE2";//"/PHONE2";**with Slash
String phoneName1 = "/PHONE1";//"/PHONE2";**with Slash

///////////////LIBRARIES////////////////
import ketai.net.*;
import oscP5.*;
import netP5.*;

///////////OTHER VARIABLES/////////////
public OscP5 oscP5;
//NetAddress laptop;
NetAddress everyone;
int tankEmpty = 0;//2 when tank is full

//////////////FUNCTIONS////////////////
void setupOSC() {
  oscP5 = new OscP5(this, 11000);
  everyone = new NetAddress(everyoneIP,11000);
  // laptop = new NetAddress(laptopIP,11000);
  //phone2 = new NetAddress(phone2IP,11000);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern(phoneName1) == true) {
    if (theOscMessage.checkTypetag("i")) {
    phoneVal1 = theOscMessage.get(0).intValue();  
      println("received");
    }
  }
}

void sendOSC(int Msg){
  OscMessage msg = new OscMessage(phoneName);
   msg.add(Msg); 
   oscP5.send(msg, everyone);
  println("sent");
}

