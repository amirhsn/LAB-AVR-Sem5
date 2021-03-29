#include <LiquidCrystal.h>
LiquidCrystal lcd(6,7,9,10,11,12);
void setup() {
  lcd.begin(16,2);
  lcd.print("Stay Safe & Stay Healthy!");
}
void loop() {
  for(int i=0;i<16;i++){
    lcd.setCursor(i,0);
    lcd.scrollDisplayRight();
    delay(100);
  }
}
