#include <WiFiS3.h>
#include <LiquidCrystal.h>
#include <WiFiClient.h>
#include <ArduinoHttpClient.h>
#include <ArduinoJson.h>

// WiFi credentials
const char* ssid     = "iPhoneIvan";
const char* password = "Ivan1234";

// Firebase configuration
const char* firebaseHost = "firestore.googleapis.com";
const int firebasePort = 443;
const char* projectId = "neuroflex-7d2a6";

// LCD pins: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

// Sensor pins
int potPin = A0;
int buzzerPin = 0;
int redLed = 1;

// HTTP client components
WiFiClient wifi;
HttpClient client = HttpClient(wifi, firebaseHost, firebasePort);

// User data
const char* userName = "henry";
String userId = "";

// Variables for angle monitoring
int potValue = 0;
int angle = 0;
bool isFirebaseConnected = false;

void setup() {
  // Initialize LCD
  lcd.begin(16, 2);
  lcd.print("NeuroFlex Ready");
  delay(1500);
  
  // Initialize pins
  pinMode(buzzerPin, OUTPUT);
  pinMode(redLed, OUTPUT);
  
  // Connect to WiFi
  connectToWiFi();
  
  // Create user in Firebase if WiFi is connected
  if (isFirebaseConnected) {
    createUser();
  }
}

void connectToWiFi() {
  lcd.clear();
  lcd.print("Connecting WiFi...");
  
  WiFi.begin(ssid, password);
  int tries = 0;
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    lcd.setCursor(0, 1);
    lcd.print("Try: ");
    lcd.print(++tries);
    
    if (tries > 20) {
      lcd.clear();
      lcd.print("WiFi Failed");
      isFirebaseConnected = false;
      delay(2000);
      return;
    }
  }
  
  lcd.clear();
  lcd.print("WiFi Connected!");
  lcd.setCursor(0, 1);
  lcd.print(WiFi.localIP());
  isFirebaseConnected = true;
  delay(2000);
}

void createUser() {
  lcd.clear();
  lcd.print("Creating User...");
  
  // Generate a unique user ID
  userId = String(random(1000000));
  
  // Create JSON document for user data
  StaticJsonDocument<200> doc;
  doc["fields"]["name"]["stringValue"] = userName;
  doc["fields"]["uuid"]["stringValue"] = userId;
  doc["fields"]["currentAngle"]["integerValue"] = 0;
  doc["fields"]["hyperextensionRange"]["integerValue"] = 0;
  
  String jsonString;
  serializeJson(doc, jsonString);
  
  // Send POST request to Firestore
  String path = "/v1/projects/" + String(projectId) + "/databases/(default)/documents/users/" + userId;
  
  client.beginRequest();
  client.post(path);
  client.sendHeader("Content-Type", "application/json");
  client.sendHeader("Content-Length", jsonString.length());
  client.beginBody();
  client.print(jsonString);
  
  int statusCode = client.responseStatusCode();
  
  lcd.clear();
  if (statusCode == 200) {
    lcd.print("User Created!");
    lcd.setCursor(0, 1);
    lcd.print("ID: " + userId);
  } else {
    lcd.print("Failed: ");
    lcd.print(statusCode);
  }
  
  delay(3000);
}

void loop() {
  // Read and process angle
  potValue = analogRead(potPin);
  angle = map(potValue, 0, 1023, 0, 230);
  
  lcd.setCursor(0, 0);
  lcd.print("Angle: ");
  lcd.print(angle);
  lcd.print(" deg  ");

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
  
  // If Firebase is connected, update the angle in the database
  if (isFirebaseConnected) {
    updateAngleInFirebase();
  }
  
  delay(100);
}

void updateAngleInFirebase() {
  // Create JSON document for angle update
  StaticJsonDocument<100> doc;
  doc["fields"]["currentAngle"]["integerValue"] = angle;
  
  String jsonString;
  serializeJson(doc, jsonString);
  
  // Send PATCH request to Firestore
  String path = "/v1/projects/" + String(projectId) + "/databases/(default)/documents/users/" + userId;
  
  client.beginRequest();
  client.patch(path);
  client.sendHeader("Content-Type", "application/json");
  client.sendHeader("Content-Length", jsonString.length());
  client.beginBody();
  client.print(jsonString);
}
