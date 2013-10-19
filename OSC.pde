void sendOSC(){
   //uses OSC to send values to Laptop
  OscMessage sendValue = new OscMessage(phoneName);
  sendValue.add(lightValue);
  sendValue.add(accelerometerX);
  sendValue.add(accelerometerY);
  sendValue.add(accelerometerZ);
  oscP5.send(sendValue, laptop);
}
