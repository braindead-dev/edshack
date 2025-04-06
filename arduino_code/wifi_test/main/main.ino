#include <WiFiS3.h>           // UNO R4 WiFi library
#include <LiquidCrystal.h>
#include <WiFiClient.h>
#include <ArduinoHttpClient.h>  // ⚠️ You must install this from Library Manager

// WiFi credentials
const char* ssid     = "iPhone";
const char* password = "12345678";

// LCD pins: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

// HTTP client components
WiFiClient wifi;
HttpClient client = HttpClient(wifi, "example.com", 80);

void setup() {
  lcd.begin(16, 2);
  lcd.print("Connecting...");

  // WiFi connect loop
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
      while (true);  // Halt
    }
  }

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("WiFi Connected");
  delay(1000);

  lcd.clear();
  lcd.print("IP:");
  lcd.setCursor(0, 1);
  lcd.print(WiFi.localIP());
  delay(2000);
  lcd.clear();
}

void loop() {
  lcd.setCursor(0, 0);
  lcd.print("HTTP Request... ");

  client.get("/");  // HTTP GET / from example.com

  int statusCode = client.responseStatusCode();

  lcd.setCursor(0, 1);
  if (statusCode == 200) {
    lcd.print("Request OK      ");
  } else {
    lcd.print("Failed: ");
    lcd.print(statusCode);
  }

  client.stop();
  delay(5000); // Wait 5 seconds before next request
}
