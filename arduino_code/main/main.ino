#include <LiquidCrystal.h>

// Order: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

int potPin = A0;
int potValue = 0;
int angle = 0;
int buzzerPin = 0;
int redLed = 1;

void setup() {
  lcd.begin(16, 2); // Set up LCD 16x2
  lcd.print("NeuroFlex Ready");
  delay(1500);
  lcd.clear();
  pinMode(buzzerPin, OUTPUT);
  pinMode(redLed, OUTPUT);
}

void loop() {
  potValue = analogRead(potPin);
  angle = map(potValue, 0, 1023, 0, 230);
  
  lcd.setCursor(0, 0);
    lcd.print("Angle: ");
    lcd.print(angle);
    lcd.print(" deg  "); // Add spaces to overwrite old characters

  if (angle < 170){
    lcd.setCursor(0, 1);
    lcd.print("Safe            ");
    noTone(buzzerPin);
    digitalWrite(redLed, LOW);
  }
  else if (angle >= 170 && angle <= 180){
    lcd.setCursor(0, 1);
    lcd.print("Caution        ");
    noTone(buzzerPin);
    digitalWrite(redLed, HIGH);
    delay(50);
    digitalWrite(redLed, LOW);
    delay(50);
  }
  else {
    lcd.setCursor(0, 1);
    lcd.print("Hyperextending  ");
    tone(buzzerPin, 2000, 20);
    digitalWrite(redLed, HIGH);
    delay(10);
    digitalWrite(redLed, LOW);
    delay(10);
  }
  delay(100);
}