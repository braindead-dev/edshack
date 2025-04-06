#include <WiFiS3.h>           // Required for UNO R4 WiFi
#include <LiquidCrystal.h>
#include <WiFiUdp.h>
#include <Ping.h>             // Make sure you install this library

// Your WiFi credentials
const char* ssid     = "iPhone";
const char* password = "12345678";

// LCD pins: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

int status = WL_IDLE_STATUS;

void setup() {
  lcd.begin(16, 2);
  lcd.print("Connecting...");

  // Try to connect to WiFi
  WiFi.begin(ssid, password);
  int tries = 0;
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    lcd.setCursor(0, 1);
    lcd.print("WiFi Try: ");
    lcd.print(++tries);
    if (tries > 20) {
      lcd.clear();
      lcd.print("WiFi Failed");
      while (true);  // Stop here
    }
  }

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("WiFi Connected");
  delay(1000);
  
  // Optional: show IP
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("IP:");
  lcd.setCursor(0, 1);
  lcd.print(WiFi.localIP());
  delay(2000);
  lcd.clear();
}

void loop() {
  lcd.setCursor(0, 0);
  lcd.print("Pinging Google");

  int success = Ping.ping("8.8.8.8", 3);  // 3 attempts

  lcd.setCursor(0, 1);
  if (success) {
    lcd.print("Ping Success :) ");
  } else {
    lcd.print("Ping Failed :(  ");
  }

  delay(5000); // Ping every 5 seconds
}
