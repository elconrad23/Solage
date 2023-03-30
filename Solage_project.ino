#include <FirebaseArduino.h>
#include <ESP8266WiFi.h>

#define FIREBASE_HOST "https://solar-project-432a8-default-rtdb.firebaseio.com/" //firebase realtime database url
#define FIREBASE_AUTH "AIzaSyB3wPIuJMatgSZBYrcCE778CgJ-PkT_n74" //API Key
#define WIFI_SSID "UBUNTU"
#define WIFI_PASSWORD "1234567890"

//my variables
int potpin = A5;
int hospital = 2;
int school = 3;
int Police = 4;
int Resident = 5;

void setup() {
  Serial.begin(9600);
 
// connecting to WIFI
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

//connecting to firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

pinMode(potpin, INPUT);
pinMode(hospital, OUTPUT);
pinMode(school, OUTPUT);
pinMode(Police, OUTPUT);
pinMode(Resident, OUTPUT);
}


void loop() {

  int potmeasure = analogRead(potpin);
  

  if (isnan(potmeasure)) {
    Serial.println(F("Failed to read the amount of voltage required for power supply!"));
    return;
  }

  Firebase.setFloat("voltage", potmeasure );
  if (Firebase.failed()) {
    Serial.print("setting /number failed:");
    Serial.println(Firebase.error());
    return;
  }
  delay(1000);

  Serial.print("Voltage being supplied: ");
  Serial.println(Firebase.getFloat("voltage"));
  Serial.println();
  delay(1000);
}
