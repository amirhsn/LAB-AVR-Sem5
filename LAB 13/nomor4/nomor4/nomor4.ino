#include <LiquidCrystal.h>
LiquidCrystal lcd(6,7,9,10,11,12);
byte love[] = {
  B00000,
  B00000,
  B00100,
  B01000,
  B11111,
  B01000,
  B00100,
  B00000
};
void setup() {
  lcd.begin(16,2);
  lcd.createChar(0,love);
  for(int i=15;i>=6;i--){
    lcd.setCursor(i,0);
    lcd.write(byte(0));
  }
}
void loop() {
  for(int i=0;i<16;i++){
    lcd.scrollDisplayLeft();
    delay(100);
  }
}
