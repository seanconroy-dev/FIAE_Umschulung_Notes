## Montag, 18-08-2025_IoT-Netzwerktechnik_WIT

### Was ist Mosquitto?

**Eclipse Mosquitto** ist ein leichtgewichtiger MQTT-Broker (Message Queuing Telemetry Transport), der zur Kommunikation zwischen IoT-Geräten verwendet wird.

- Protokoll: MQTT (leichtgewichtig, für Netzwerke mit geringer Bandbreite optimiert)
- Einsatz: z.B. für Sensordatenübertragung zwischen Geräten (Publisher/Subscriber-Prinzip)
- Open Source und weit verbreitet im IoT-Umfeld

---

### DHT22 kommt in der Prüfung

**DHT22** ist ein digitaler Sensor zur Messung von Temperatur und Luftfeuchtigkeit.

- Genaue Temperatur- und Luftfeuchtigkeitsdaten
- Typischerweise über GPIO-Pins an Raspberry Pi oder Mikrocontroller angeschlossen
- In der Abschlussprüfung relevant! (praktische Anwendung + ggf. Auswertung via Node-RED oder Python)

---

### IoT und Datenbanken

- IoT-Geräte erzeugen viele **Messwerte (z.B. Sensordaten)**
- Diese werden meist in einer **Zeitreihendatenbank** gespeichert (z. B. InfluxDB, SQLite)
- Wichtige Verbindung zu Themen wie:
  - SQL-Grundlagen
  - Datenanalyse & Visualisierung
  - Datenlogging (über Docker, Node-RED, etc.)

---

### Grafana

**Grafana** ist ein Tool zur **Visualisierung von Daten**, vor allem Zeitreihendaten.

- Ideal für die Darstellung von Sensordaten aus IoT-Systemen
- Unterstützt viele Datenquellen (InfluxDB, MySQL, Prometheus etc.)
- Grafische Dashboards, Alerting-Funktionen

---

### Node-RED

**Node-RED** ist eine Flow-basierte Programmierumgebung für IoT-Projekte.

- Ermöglicht visuelles Programmieren (Drag & Drop)
- Integration von MQTT, Datenbanken, HTTP, GPIO etc.
- Sehr beliebt für schnelle Prototypen und einfache Automatisierung

---

### Docker

**Docker** ist eine Container-Plattform zur Bereitstellung und Isolierung von Software.

- In IoT-Projekten genutzt für:
  - Isolierte Umgebung für Broker, Node-RED, Grafana, Datenbank
  - Reproduzierbare Installationen (z. B. `docker-compose`)
- Vorteil: Einfaches Setup, portabel, unabhängig vom Host-System

---

### Arduino Code: ESP32 + DHT22 + Ultraschallsensor + MQTT

#### Was macht der Code?

Dieses Arduino-Programm läuft auf einem **ESP32** und erfüllt folgende Aufgaben:

1. **Verbindet sich mit einem WLAN-Netzwerk**
2. **Stellt eine Verbindung zu einem lokalen MQTT-Broker (Mosquitto) her**
3. **Liest Sensordaten** von:
   - einem **DHT22** (Temperatur & Luftfeuchtigkeit)
   - einem **Ultraschallsensor** (Abstandsmessung)
4. **Gibt alle Messdaten** auf der seriellen Konsole aus
5. **Sendet die Daten** über MQTT an drei Topics:
   - `SCAG/Temp` → Temperatur
   - `SCAG/Humi` → Luftfeuchtigkeit
   - `SCAG/Abstand` → Abstand
6. Wiederholt den Ablauf alle 3 Sekunden

#### Ziel:

Die Daten können z. B. in **Node-RED**, **InfluxDB** oder **Grafana** weiterverarbeitet bzw. visualisiert werden.

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
    Serial.print("SSID: "); Serial.println(ssid);
    Serial.print("Paßwort: "); Serial.println(password);
  }
  Serial.println("Connected to network");
}

void mqttconnect() {
  while (!client.connected()) {
    Serial.print("MQTT connecting ...");
    String clientId = "SCAG";
    if (client.connect(clientId.c_str())) {
      Serial.println("connected");
    } else {
      Serial.print("failed, status code = ");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}

void setup() {
  connectToNetwork();
  WiFi.setSleep(false);
  Serial.println(WiFi.localIP());
  Serial.println(WiFi.macAddress());

  client.setServer(mqtt_server, 1883);
  dht.begin();
  pinMode(Trigger_AusgangsPin, OUTPUT);
  pinMode(Echo_EingangsPin, INPUT);
}

void loop() {
  Serial.begin(115200);

  if (WiFi.status() != WL_CONNECTED) {
    connectToNetwork();
  }
  if (!client.connected()) {
    mqttconnect();
  }

  Serial.println("---------Temperatur und Luftfeuchtigkeit (DHT22) ----------");

  float h = dht.readHumidity();
  float t1 = dht.readTemperature();

  if (isnan(h) || isnan(t1)) {
    Serial.println("Error while reading the sensor");
    return;
  }

  Serial.print("Luftfeuchtigkeit: "); Serial.print(h); Serial.print(" %\t");
  Serial.print("Temperatur: "); Serial.print(t1); Serial.print(char(186));
  Serial.println("C ");
  Serial.println("-----------------------------------------------------------\n");

  digitalWrite(Trigger_AusgangsPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(Trigger_AusgangsPin, LOW);

  Dauer = pulseIn(Echo_EingangsPin, HIGH);
  Abstand = Dauer / 58.2;

  if (Abstand >= maximumRange || Abstand <= minimumRange) {
    Serial.println("Abstand außerhalb des Messbereichs");
    Serial.println("-----------------------------------");
  } else {
    Serial.print("Der Abstand beträgt: "); Serial.print(Abstand); Serial.println(" cm");
    Serial.print("Die Dauer beträgt: "); Serial.print(Dauer); Serial.println(" ms");
    Serial.println("-----------------------------------");
  }

  client.publish(TMP1_TOPIC, String(t1).c_str(), true);
  client.publish(LFK_TOPIC, String(h).c_str(), true);
  client.publish(ABSTAND_TOPIC, String(Abstand).c_str(), true);

  delay(3000);
}
```

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 18.08.2025 mit WIT.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 18.08.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
</p>
</details>
