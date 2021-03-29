const int pinLED = 9;
const int pinPot = A0;
int sensor = 0;
int brightness = 0;
void setup() {
  pinMode(pinLED, OUTPUT);
  pinMode(pinPot, INPUT);
}
void loop() {
  sensor = analogRead(pinPot);
  brightness = map(sensor, 0, 1023, 0, 255);
  analogWrite(pinLED, brightness);
}
