#include <WiFiS3.h>
#include <LiquidCrystal.h>
#include <ArduinoJson.h>

// WiFi configuration for SoftAP mode
const char* ssid = "NeuroFlex";
const char* password = "12345678";

// Web server
WiFiServer server(80);

// LCD pins: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

// Sensor pins
int potPin = A0;
int buzzerPin = 0;
int redLed = 1;

// Variables for angle monitoring
int potValue = 0;
int angle = 0;
bool clientConnected = false;

// Timing variables
unsigned long lastAngleUpdate = 0;
const unsigned long ANGLE_UPDATE_INTERVAL = 50; // Update angle every 50ms

void setup() {
  // Initialize Serial
  Serial.begin(9600);
  while (!Serial) {
    ; // Wait for serial port to connect
  }
  
  // Initialize LCD
  lcd.begin(16, 2);
  lcd.print("NeuroFlex Ready");
  delay(1500);
  
  // Initialize pins
  pinMode(buzzerPin, OUTPUT);
  pinMode(redLed, OUTPUT);
  
  // Start SoftAP mode
  setupSoftAP();
  
  // Start web server
  server.begin();
  lcd.clear();
  lcd.print("Server Running");
  lcd.setCursor(0, 1);
  lcd.print(WiFi.localIP());
  delay(2000);
}

void setupSoftAP() {
  lcd.clear();
  lcd.print("Setting up AP...");
  
  // Configure SoftAP
  WiFi.beginAP(ssid, password);
  
  // Wait for AP to start
  int tries = 0;
  while (WiFi.status() != WL_AP_LISTENING) {
    delay(500);
    lcd.setCursor(0, 1);
    lcd.print("Try: ");
    lcd.print(++tries);
    
    if (tries > 20) {
      lcd.clear();
      lcd.print("AP Failed");
      while (true); // Halt
    }
  }
  
  lcd.clear();
  lcd.print("AP Running!");
  lcd.setCursor(0, 1);
  lcd.print(WiFi.localIP());
  delay(2000);
}

void loop() {
  // Update angle at fixed intervals
  unsigned long currentMillis = millis();
  if (currentMillis - lastAngleUpdate >= ANGLE_UPDATE_INTERVAL) {
    lastAngleUpdate = currentMillis;
    updateAngle();
  }
  
  // Check for client connections
  WiFiClient client = server.available();
  if (client) {
    clientConnected = true;
    handleClient(client);
  }
  
  // Small delay to prevent overwhelming the system
  delay(10);
}

void updateAngle() {
  // Read and process angle
  potValue = analogRead(potPin);
  angle = map(potValue, 0, 1023, 0, 230);
  
  // Update LCD display
  lcd.setCursor(0, 0);
  lcd.print("Angle: ");
  lcd.print(angle);
  lcd.print(" deg  ");

  // Update feedback based on angle
  if (angle < 170) {
    lcd.setCursor(0, 1);
    lcd.print("Safe            ");
    noTone(buzzerPin);
    digitalWrite(redLed, LOW);
  }
  else if (angle >= 170 && angle <= 180) {
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
}

void handleClient(WiFiClient client) {
  // Wait for client to send request
  if (client.connected()) {
    // Read the first line of the request
    String req = client.readStringUntil('\r');
    Serial.println(req);
    
    // Send HTTP response immediately
    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: application/json");
    client.println("Access-Control-Allow-Origin: *");
    client.println("Connection: close");
    client.println();
    
    // Create JSON response with angle data
    StaticJsonDocument<200> doc;
    doc["angle"] = angle;
    
    // Send JSON response
    serializeJson(doc, client);
    
    // Close the connection
    client.stop();
    clientConnected = false;
  }
}
