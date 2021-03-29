const int pinLED[] = {8, 9, 10, 11};
const int pinPot = A0;
void setup() {
  Serial.begin(9600);
  pinMode(pinPot, INPUT);
  for(int i=0; i<4; i++){
    pinMode(pinLED[i], OUTPUT);
  }
}
void loop() {
  nyala(analogRead(pinPot));
}
void nyala(int analogIndex){
  if(analogIndex < 251){
    ledConfig(HIGH, LOW, LOW, LOW);
  }
  else if(250 < analogIndex < 501){
    ledConfig(HIGH, HIGH, LOW, LOW);
  }
  else if(500 < analogIndex < 751){
    ledConfig(HIGH, HIGH, HIGH, LOW);
  }
  else if(analogIndex > 750){
    ledConfig(HIGH, HIGH, HIGH, HIGH);
  }
}
void ledConfig(bool log0, bool log1, bool log2, bool log3){
  digitalWrite(pinLED[0], log0);
  digitalWrite(pinLED[1], log1);
  digitalWrite(pinLED[2], log2);
  digitalWrite(pinLED[3], log3);
  delay(100);
}
