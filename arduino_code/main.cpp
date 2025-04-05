#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Initialize LCD at I2C address 0x27 with 16 columns and 2 rows
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Pin Definitions
const int potPin = A0;
const int buzzerPin = 9;

// Threshold angle in degrees
const int angleThreshold = 170;

void setup() {
  // Initialize LCD
  lcd.init();
  lcd.backlight();

  // Buzzer pin as output
  pinMode(buzzerPin, OUTPUT);
  digitalWrite(buzzerPin, LOW);

  // Welcome screen
  lcd.setCursor(0, 0);
  lcd.print("NeuroFlex Ready");
  delay(1500);
  lcd.clear();
}

void loop() {
  int potValue = analogRead(potPin);         // Read analog value (0–1023)
  int angle = map(potValue, 0, 1023, 0, 180); // Map to degrees

  // Display angle on LCD
  lcd.setCursor(0, 0);
  lcd.print("Angle: ");
  lcd.print(angle);
  lcd.print(" deg  ");  // Extra spaces to clear old chars

  // Check if angle exceeds threshold
  if (angle >= angleThreshold) {
    digitalWrite(buzzerPin, HIGH);
    lcd.setCursor(0, 1);
    lcd.print(">> Overextended! <<");
  } else {
    digitalWrite(buzzerPin, LOW);
    lcd.setCursor(0, 1);
    lcd.print("                    "); // Clear line
  }

  delay(200); // Small delay for stability
}
