const int pinLED = 9;
const int pinButton[] = {1, 2, 3, 4};
int brightness = 0;
void setup() {
  pinMode(pinLED, OUTPUT);
  for(int i=0; i<4; i++){
    pinMode(pinButton[i], INPUT);
    digitalWrite(pinButton[i], HIGH);
  }
}
void loop() {
  if(digitalRead(pinButton[0]) == LOW){
    brightness++;
  }
  else if(digitalRead(pinButton[1]) == LOW){
    brightness--;
  }
  else if(digitalRead(pinButton[2]) == LOW){
    brightness = 255;
  }
  else if(digitalRead(pinButton[3]) == LOW){
    brightness = 0;
  }
  brightness = constrain(brightness, 0, 255);
  analogWrite(pinLED, brightness);
  delay(25);
}
