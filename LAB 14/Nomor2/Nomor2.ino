#include <SevSeg.h>
SevSeg sevseg;
const int saklar = 2;
void setup() {
  byte sevenSegments = 1;
  byte commonPins[] = {};
  byte sevenPins[] = {11,10,9,8,7,6,5,4};
  bool resistor = true;
  sevseg.begin(COMMON_CATHODE, sevenSegments, commonPins, sevenPins, resistor);
  sevseg.setBrightness(90);

  pinMode(saklar, INPUT);
}
void loop() {
  while(digitalRead(saklar) == HIGH){
    for(int i=1; i<=9; i+=2){
      setSevSeg(i);
    }
  }
  while(digitalRead(saklar) == LOW){
    for(int i=0; i<=8; i+=2){
      setSevSeg(i);                                                                                 
    }
  }
}
void setSevSeg(int num){
  sevseg.setNumber(num);
  sevseg.refreshDisplay();
  delay(1000); //1 detik
}
