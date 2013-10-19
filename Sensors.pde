void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}

//Saving this for something else?
void onLightEvent(float v){
   
  lightValue = v;
   
}
 
 
void mousePressed() {
  mode++;
  if (mode >10){
    mode=0;
  }
}
