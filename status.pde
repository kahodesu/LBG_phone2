//The phone prints out this status on its screen. :D

void status() {
  String info = "";
  info += "PHONE TWO\n";
  info += "=======================\n";
 // info += "phoneVal1: "+ phoneVal1 + "\n"; 
  info += "mode: "+ mode+ "\n"+frameCount; //whatever variable I want to send to laptop

  //Phone screen crap

  textSize(20);
  fill(255);
  text(info, 50, 50);
}

