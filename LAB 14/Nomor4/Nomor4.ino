#include <SevSeg.h>
SevSeg sevseg;
const int saklar1 = 2;
const int saklar2 = 3;
void setup() {
  byte sevenSegments = 1;
  byte commonPins[] = {};
  byte sevenPins[] = {11,10,9,8,7,6,5,4};
  bool resistor = true;
  sevseg.begin(COMMON_CATHODE, sevenSegments, commonPins, sevenPins, resistor);
  sevseg.setBrightness(90);

  pinMode(saklar1, INPUT);
  pinMode(saklar2, INPUT);
  Serial.begin(9600);
}
void loop() {
  checking(digitalRead(saklar1), digitalRead(saklar2));
}
void checking(bool saklar1, bool saklar2){
  if(saklar1==LOW && saklar2==LOW){
    for(int i=0; i<7; i++){
      setSevSeg(i);
    }
  }
  else if(saklar1==LOW && saklar2==HIGH){
    for(int i=0; i<10; i++){
      setSevSeg(i);
    }
  }
  else if(saklar1==HIGH && saklar2==LOW){
    for(int i=0; i<5; i++){
      setSevSeg(i);
    }
  }
  else if(saklar1==HIGH && saklar2==HIGH){
    delay(100); //Untuk Stop
  }
}
void setSevSeg(int num){
  sevseg.setNumber(num);
  sevseg.refreshDisplay();
  delay(1000); //1 detik
}
