#include <LiquidCrystal.h>
LiquidCrystal lcd(7,8,9,10,11,12);
const int buz = 3;
const int trigPin = 6;
const int echoPin = 5;
void setup() {
  lcd.begin(16,2);
  pinMode(buz, OUTPUT);
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
}
void loop() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Set trigPin HIGH selama 10uS
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  long duration = pulseIn(echoPin, HIGH);
  int jarak = duration*0.034/2;
  
  lcd.setCursor(0,0);
  lcd.print("Jarak:");
  lcd.setCursor(0,1);
  lcd.print(jarak);
  lcd.print(" cm");
  delay(250);
  lcd.clear();
  (jarak < 30) ? digitalWrite(buz, HIGH) :
  digitalWrite(buz, LOW);
}
