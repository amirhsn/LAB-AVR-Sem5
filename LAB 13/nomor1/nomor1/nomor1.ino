#include <LiquidCrystal.h> //library lcd
// format setting LCD RS E D4 D5 D6 D7
LiquidCrystal lcd(6, 7, 9, 10, 11, 12);
void setup(){
lcd.begin(32,2);
lcd.print("Ingat 3M");
}

void loop(){
lcd.setCursor(0,1);
lcd.print("Stay Safe & Stay Healthy");
}
