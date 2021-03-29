//program led berkedip

const int pinLED = 8;

void setup() {
  pinMode(pinLED, OUTPUT); //pinLED sebagai output
  // put your setup code here, to run once:
}
//nilai awal time delay 1000 ms
int timeDelay = 1000; //Baris ini tidak dijadikan konstanta (const) sebagaimana pinLED 
                      // karena nilai timeDelay akan diubah-ubah. 
void loop() {
   // Setiap looping, nilai timeDelay dikurangi 100     
   timeDelay = timeDelay - 100; 
  
  // jika timeDelay bernilai <= 0, nilai timeDelay direset ke 1000 ms
    if (timeDelay <=0){ 
    timeDelay = 3000;
   }

   //Nyala dan matikan LED selama nilai timeDelay
  digitalWrite(pinLED, HIGH);
  delay(timeDelay);
  digitalWrite(pinLED, LOW);
  delay(timeDelay);
  // put your main code here, to run repeatedly:
}
