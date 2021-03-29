String text[] = {"Menjaga jarak","Mencuci tangan","Menghindari Kerumunan"};
#include <LiquidCrystal.h>
LiquidCrystal lcd(6,7,9,10,11,12);
const int pushBtn = 2;
void setup() {
  lcd.begin(32,2);
  pinMode(pushBtn, INPUT);
  digitalWrite(pushBtn, HIGH);
}
int pushIndex = 0;
void loop() {
  if(digitalRead(pushBtn) == LOW){
    pushIndex++;
    delay(200);
    if(pushIndex == 4){
      pushIndex = 0;
      show(pushIndex);
    }
    else{
      show(pushIndex-1);
    }
  }
}
void show(int kata){
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Ingat 3M");
  lcd.setCursor(0,1);
  lcd.print(text[kata]);
  delay(250);
}
