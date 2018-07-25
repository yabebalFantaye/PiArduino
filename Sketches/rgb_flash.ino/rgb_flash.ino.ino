const int redLedPin = 9;
const int ybLedPins = 8;

void setup() {
  // put your setup code here, to run once:
  pinMode(redLedPin, OUTPUT);
  pinMode(ybLedPins, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(redLedPin, HIGH);
  digitalWrite(ybLedPins, LOW);
  delay(500);
  digitalWrite(redLedPin, LOW);
  delay(500);
  digitalWrite(ybLedPins, HIGH);
  delay(500);
}
