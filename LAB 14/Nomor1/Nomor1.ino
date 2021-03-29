#include <SevSeg.h>
SevSeg sevseg;
const int pushButton[] = {1,2};
void setup() {
  byte sevenSegments = 1;
  byte commonPins[] = {};
  byte sevenPins[] = {11,10,9,8,7,6,5,4};
  bool resistor = true;
  sevseg.begin(COMMON_CATHODE, sevenSegments, commonPins, sevenPins, resistor);
  sevseg.setBrightness(90);

  for(int i=0; i<=1; i++){
    pinMode(pushButton[i], INPUT);
    digitalWrite(pushButton[i], HIGH);
  }
}
int ind;
void loop() {
  if(digitalRead(pushButton[0]) == LOW){
    delay(100);
    for(int i=0; i<10; i++){
      setSevSeg(i);
    }
  }
  if(digitalRead(pushButton[1]) == LOW){
    delay(100);
    for(int i=9; i>=0; i--){
      setSevSeg(i);
    }
  }
}
void setSevSeg(int num){
  sevseg.setNumber(num);
  sevseg.refreshDisplay();
  delay(1000); //1 detik
}
