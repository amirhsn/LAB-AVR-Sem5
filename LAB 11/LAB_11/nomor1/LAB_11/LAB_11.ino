int pinLED[] = {8, 9, 10, 11};
int timeDelay = 1000;
//AMIR HUSEIN (181344003)
void setup() {
  for(int i=0; i<4; i++){
    pinMode(pinLED[i], OUTPUT);
  }
}

void loop() {
  for(int i=0; i<4;i++){
    nyala(pinLED[i]);
  }
  for(int i=0; i<4;i++){
    mati(pinLED[i]);
  }
}

void nyala(int indexLED){
  digitalWrite(indexLED, HIGH);
  delay(timeDelay);
}

void mati(int indexLED){
  digitalWrite(indexLED, LOW);
  delay(timeDelay);
}
