const int ldr = A3;
const int led[] = {4,3,2};
void setup() {
  pinMode(ldr, INPUT);
  for(int i=0;i<3;i++){
    pinMode(led[i], OUTPUT);
  }
  Serial.begin(9600);
}
void loop() {
  int ldrIndex = analogRead(ldr);
  Serial.println(ldrIndex);
  delay(500);
  (ldrIndex > 100) ? 
    ((ldrIndex > 300) ? 
      ((ldrIndex > 500) ? ledConfig(LOW,LOW,HIGH) :
      ledConfig(LOW,HIGH,LOW)):
    ledConfig(HIGH,LOW,LOW)):
  ledConfig(LOW,LOW,LOW);
}
void ledConfig(bool ledStat1, bool ledStat2, bool ledStat3){
  digitalWrite(led[0], ledStat1);
  digitalWrite(led[1], ledStat2);
  digitalWrite(led[2], ledStat3);
}
