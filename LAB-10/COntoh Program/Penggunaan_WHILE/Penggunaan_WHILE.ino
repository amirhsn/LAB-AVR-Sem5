//program led berkedip

const int pinLED = 8;

void setup() {
  pinMode(pinLED, OUTPUT);
  // put your setup code here, to run once:
}
//nilai awal time delay 1000 ms
int timeDelay = 1000;

void loop() {
  // selama nilai timeDelay > 0  
  // eksekusi blok program ini   
  while(timeDelay > 0){    
  // LED hidup mati dengan durasi 500 milisekon    
  digitalWrite(pinLED, HIGH);    
  delay(2000);     
  digitalWrite(pinLED, LOW);     
  delay(2000); 

   // kurangi timeDelay dengan 100 
  timeDelay = timeDelay - 100;   
  } 
  
  // setelah timeDelay dikurangi terus-menerus   
  // maka pada akhirnya akan bernilai minus atau < 0   
  // maka while di atas akan berhenti 
  
  // selama nilai timeDelay < 1000 
  // eksekusi blok program ini   
  while(timeDelay < 1000){    
  // LED hidup mati dengan durasi 100 milisekon
  digitalWrite(pinLED, HIGH);
  delay(500);
  digitalWrite(pinLED, LOW);
  delay(500);

   // tambahkan timeDelay dengan 100     
   timeDelay = timeDelay + 100;   
   } 
   }
  // put your main code here, to run repeatedly:
