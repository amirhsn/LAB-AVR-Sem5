#include <LiquidCrystal.h>
LiquidCrystal lcd(7,8,9,10,11,12);
const int buz = 3;
const int lm = A3;
void setup() {
  lcd.begin(16,2);
  pinMode(buz, OUTPUT);
  pinMode(lm, INPUT);
  Serial.begin(9600);
}
void loop() {
  int suhu = analogRead(lm) * 0.46828125;
  lcd.setCursor(0,0);
  lcd.print("Suhu Sekarang:");
  lcd.setCursor(0,1);
  lcd.print(suhu);
  lcd.print(" C");
  delay(250);
  lcd.clear();
  (suhu > 40) ? digitalWrite(buz, HIGH) :
  digitalWrite(buz, LOW);
}
