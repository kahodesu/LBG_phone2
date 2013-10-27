/////////////////////////////////////////////////
//      Lightning Bug Game - Phone2 Code       // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on Android Phone Nexus1 (COLLECTOR)  //
//  *See README in LAPTOP code for references! //
//  *Make sure to checkINTERNETon SKETCH PERMS //
/////////////////////////////////////////////////



///////////OTHER VARIABLES/////////////
int phoneVal1;
///////////MAIN CODE/////////////
void setup() {
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  new PIOIOManager(this).start();
  setupOSC();
  setupBT();
}


void draw() {

}


