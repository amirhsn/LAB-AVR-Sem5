const int pinLED[] = {8, 9, 10, 11};
const int pinButton = 2;
int i = 0;
void setup() {
  Serial.begin(9600);
  for(int i=0; i<4; i++){
    pinMode(pinLED[i], OUTPUT);
  }
  pinMode(pinButton, INPUT);
  digitalWrite(pinButton, HIGH);
}
void loop() {
  buttonPressed();
}
void buttonPressed(){
  if(digitalRead(pinButton) == LOW){
    i++;
    if(i == 5){
      i = 0;
      for(int i=0; i<4; i++){
        digitalWrite(pinLED[i], LOW);
        delay(25);
      }
    }else if(i != 5){
    digitalWrite(pinLED[i-1], HIGH);
    delay(500);
    }
  }
}
