int pinLED[] = {8, 9, 10, 11};
int timeDelay = 1000;
// AMIR HUSEIN 181344003
void setup() {
  for(int i=0; i<4; i++){
    pinMode(pinLED[i], OUTPUT);
  }
}
void loop() {
  for(int i=0; i<10; i++){
    nyala(pinLED[0], pinLED[2], pinLED[1], pinLED[3]);
    nyala(pinLED[1], pinLED[3], pinLED[0], pinLED[2]);
  }
  for(int i=0; i<4; i++){
    padam(pinLED[i]);
  }
  delay(100000);
}
void nyala(int indexLED1, int indexLED2, int indexLED3, int indexLED4){
  digitalWrite(indexLED1, HIGH);
  digitalWrite(indexLED2, HIGH);
  digitalWrite(indexLED3, LOW);
  digitalWrite(indexLED4, LOW);
  delay(timeDelay);
}
void padam(int indexLED){
  digitalWrite(indexLED, LOW);
}
