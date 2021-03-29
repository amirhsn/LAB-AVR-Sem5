//program led berkedip
const int pinLED = 8;
void setup() {
  pinMode(pinLED, OUTPUT);
}
//nilai awal time delay 1000 ms
int timeDelay = 1000;

void loop() {
  /** jika timeDelay bernilai <= 0, maka LED akan diam selama 3s
      lalu nilai timeDelay direset ke 1000 ms
   **/
   if (timeDelay <= 100){
    delay(3000);
    timeDelay = 1000;
   }
   else {
    //nilai timeDelay dikurangi 100 jika timeDelay >100
    timeDelay = timeDelay - 100;
   }
   //Nyala dan matikan LED selama nilai timeDelay
  digitalWrite(pinLED, HIGH);
  delay(timeDelay);
  digitalWrite(pinLED, LOW);
  delay(timeDelay);
  // put your main code here, to run repeatedly:
}
