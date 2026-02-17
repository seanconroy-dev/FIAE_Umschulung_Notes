---
title: "IoT – MQTT, Mosquitto, Docker & Sensordaten mit ESP32"
date: 2025-08-18
weekday: "Montag"
subject: "IoT & Netzwerktechnik"
instructor: "WIT"
program: "FIAE Umschulung 2025-2027"
module: "IoT-Kommunikation & Datenverarbeitung"
topic: "MQTT, Mosquitto, Node-RED, Grafana, Docker"
level: "Grundlagen"
tags:
  - MQTT
  - Mosquitto
  - ESP32
  - DHT22
  - Node-RED
  - Grafana
  - Docker
  - IoT
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Montag, 2025-08-18_IoT-Netzwerktechnik_WIT

## Eclipse Mosquitto

**Eclipse Mosquitto** ist ein leichtgewichtiger MQTT-Broker (Message Queuing Telemetry Transport).

### Eigenschaften
- Open Source
- Sehr ressourcenschonend
- Optimiert für geringe Bandbreite
- Ideal für IoT-Umgebungen

### Funktionsprinzip (Publisher/Subscriber)
- **Publisher** sendet Nachrichten an ein Topic
- **Broker (Mosquitto)** verteilt Nachrichten
- **Subscriber** empfängt Nachrichten vom Topic

Beispiel:
- ESP32 → sendet Temperatur an `SCAG/Temp`
- Node-RED → abonniert `SCAG/Temp`
- Grafana → visualisiert gespeicherte Daten

---

## DHT22 (Prüfungsrelevant)

Digitaler Sensor für:
- Temperatur
- Luftfeuchtigkeit

### Eigenschaften
- Liefert Float-Werte
- Anschluss über GPIO
- Wird oft mit:
  - Raspberry Pi
  - ESP32
  - Arduino
  - Node-RED
  - Python

Typischer Prüfungsbezug:
- Sensordaten erfassen
- Weiterverarbeitung über MQTT
- Speicherung in Datenbank
- Visualisierung

---

## IoT & Datenbanken

IoT-Geräte erzeugen kontinuierlich Messwerte.

Diese werden meist gespeichert in:
- Zeitreihendatenbanken (z. B. InfluxDB)
- SQL-Datenbanken (z. B. SQLite, MySQL)

Relevante Konzepte:
- Datenlogging
- Persistenz
- Zeitstempel
- Aggregation
- Visualisierung

---

## Grafana

Grafana ist ein Visualisierungstool für Zeitreihendaten.

### Funktionen
- Dashboard-Erstellung
- Diagramme
- Alerting
- Unterstützung vieler Datenquellen:
  - InfluxDB
  - MySQL
  - Prometheus
  - PostgreSQL

Wird häufig kombiniert mit:
- MQTT
- Node-RED
- Docker
- InfluxDB

---

## Node-RED

Flow-basierte IoT-Plattform.

### Eigenschaften
- Visuelle Programmierung (Drag & Drop)
- MQTT-Integration
- Datenbank-Anbindung
- HTTP-Requests
- GPIO-Steuerung

Ideal für:
- Prototyping
- Automatisierung
- Datenverarbeitung

---

## Docker

Container-Plattform zur Isolation von Anwendungen.

### Vorteil im IoT-Kontext
- Broker, Node-RED, Grafana getrennt ausführbar
- Reproduzierbare Setups (docker-compose)
- Keine Abhängigkeit vom Hostsystem
- Portabilität

Typische Architektur:

ESP32  
→ Mosquitto (Docker)  
→ Node-RED (Docker)  
→ InfluxDB (Docker)  
→ Grafana (Docker)

---

# Arduino-Code: ESP32 + DHT22 + Ultraschallsensor + MQTT

## Ziel des Programms

1. WLAN-Verbindung herstellen  
2. MQTT-Verbindung aufbauen  
3. Sensordaten lesen  
4. Daten seriell ausgeben  
5. Daten an MQTT-Topics senden  
6. Wiederholung alle 3 Sekunden  

---

## MQTT-Topics

- `SCAG/Temp`
- `SCAG/Humi`
- `SCAG/Abstand`

---

## Arduino-Code

```cpp
#include "WiFi.h"
#include "PubSubClient.h"
#include "DHT.h"

#define DHTPIN 22
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

const char* ssid = "FRITZ!Box 7580 QP";
const char* password = "45533321289156809388";
const char* mqtt_server = "192.168.23.228";

#define Trigger_AusgangsPin 23
#define Echo_EingangsPin 21

int maximumRange = 600;
int minimumRange = 2;
long Abstand;
long Dauer;

WiFiClient espClient;
PubSubClient client(espClient);

#define TMP1_TOPIC      "SCAG/Temp"
#define LFK_TOPIC       "SCAG/Humi"
#define ABSTAND_TOPIC   "SCAG/Abstand"

void connectToNetwork() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Establishing connection to WiFi..");
  }

  Serial.println("Connected to network");
}

void mqttconnect() {
  while (!client.connected()) {
    if (client.connect("SCAG")) {
      Serial.println("MQTT connected");
    } else {
      delay(5000);
    }
  }
}

void setup() {
  connectToNetwork();
  WiFi.setSleep(false);

  client.setServer(mqtt_server, 1883);

  dht.begin();
  pinMode(Trigger_AusgangsPin, OUTPUT);
  pinMode(Echo_EingangsPin, INPUT);
}

void loop() {

  if (WiFi.status() != WL_CONNECTED) {
    connectToNetwork();
  }

  if (!client.connected()) {
    mqttconnect();
  }

  float h = dht.readHumidity();
  float t1 = dht.readTemperature();

  if (isnan(h) || isnan(t1)) {
    return;
  }

  digitalWrite(Trigger_AusgangsPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(Trigger_AusgangsPin, LOW);

  Dauer = pulseIn(Echo_EingangsPin, HIGH);
  Abstand = Dauer / 58.2;

  client.publish(TMP1_TOPIC, String(t1).c_str(), true);
  client.publish(LFK_TOPIC, String(h).c_str(), true);
  client.publish(ABSTAND_TOPIC, String(Abstand).c_str(), true);

  delay(3000);
}
```

---

## Wichtige technische Hinweise

- WLAN-Passwörter niemals im öffentlichen Repository speichern
- `Serial.begin()` gehört ausschließlich in `setup()`
- `pulseIn()` misst Echozeit in Mikrosekunden
- 58.2 ergibt sich aus Schallgeschwindigkeit in Luft
- `delay()` blockiert den Controller
- MQTT Retain-Flag (`true`) speichert letzte Nachricht im Broker

