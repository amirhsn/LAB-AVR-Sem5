int pinLED[] = {8, 9, 10, 11};
int timeDelay = 1000;
// AMIR HUSEIN 181344003
void setup() {
  for(int i=0; i<4; i++){
    pinMode(pinLED[i], OUTPUT);
  }
}

void loop() {
  for(int i=0; i<4; i++){
    nyalaGantian(pinLED[i]);
  }
}

void nyalaGantian(int indexLED){
  digitalWrite(indexLED, HIGH);
  delay(timeDelay);
  digitalWrite(indexLED, LOW);
}
