//program led berkedip

const int pinLED = 8;

void setup() {
  pinMode(pinLED, OUTPUT);
  // put your setup code here, to run once:
}
//nilai awal time delay 3000 ms / 3s
int timeDelay = 3000;

void loop() {
  // perulangan sebanyak 10 kali dari 1 hingga 10   
  for(int i=1; i<=5; i++){   
  // LED hidup mati dengan durasi 500 milisekon    
  digitalWrite(pinLED, HIGH);    
  delay(500);     
  digitalWrite(pinLED, LOW);     
  delay(500); 
  }
 // diam(mati) selama 3 s
 delay(timeDelay);
}
  // put your main code here, to run repeatedly:
