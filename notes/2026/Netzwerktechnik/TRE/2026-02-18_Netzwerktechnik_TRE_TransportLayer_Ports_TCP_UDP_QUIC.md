---
title: "Ports – TCP, UDP & Sockets"
date: 2026-02-18
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Transport Layer"
topic: "Ports, TCP vs. UDP, QUIC"
level: "Grundlagen"
tags:
  - Port
  - TCP
  - UDP
  - Socket
  - QUIC
  - OSI
  - DDoS
  - Sliding Window
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2026-02-18_Netzwerktechnik_TRE

## 1) Was ist ein Port?

Ein **Port** ist eine logische Adresse innerhalb eines Geräts.  
Er sorgt dafür, dass Daten beim richtigen Programm (Prozess) ankommen.

Eine IP-Adresse identifiziert **ein Gerät im Netzwerk**.  
Ein Port identifiziert **einen Dienst oder Prozess auf diesem Gerät**.

Merksatz:  
> IP = Haus  
> Port = Wohnungstür  

---

## 2) Socket

Ein **Socket** ist die Kombination aus:

```
IP-Adresse + Port + Transportprotokoll (TCP oder UDP)
```

Beispiel:

```
192.168.2.1:80 (TCP)
```

Eine Verbindung besteht aus zwei Endpunkten (Sockets):

```
Client-IP:Client-Port  →  Server-IP:Server-Port
```

Der Client nutzt meist einen **dynamischen (Ephemeral) Port**.  
Der Server nutzt einen **fest definierten Dienst-Port**.

---

## 3) Portbereiche

Ports sind 16-Bit-Zahlen.

Berechnung:

```
2^16 = 65.536 mögliche Werte
```

Da bei 0 gezählt wird:

```
0 – 65535
```

### Well Known Ports (0–1023)

Standardisierte Systemdienste:

- 80 → HTTP  
- 443 → HTTPS  
- 25 → SMTP  
- 22 → SSH  

### Registered Ports (1024–49151)

Für Anwendungen registrierte Ports.

### Dynamic / Ephemeral Ports (49152–65535)

Temporäre Client-Ports für ausgehende Verbindungen.

---

## 4) TCP vs. UDP

Beide Protokolle arbeiten auf **Layer 4 (Transportschicht)** des OSI-Modells.

---

### TCP – Transmission Control Protocol

Eigenschaften:

- verbindungsorientiert (3-Way-Handshake)
- zuverlässig (ACK-Bestätigungen)
- garantiert Reihenfolge
- Wiederholung verlorener Segmente
- Flusskontrolle (Flow Control)
- Staukontrolle (Congestion Control)
- ausschließlich 1:1-Verbindung (Unicast)

Typische Nutzung:

- Web (HTTP/HTTPS)
- E-Mail
- SSH
- Dateiübertragung

#### Sliding Window (Schiebefenster)

TCP verwendet einen **Schiebefenster-Mechanismus** zur Flusskontrolle.

Der Empfänger teilt dem Sender die aktuelle **Fenstergröße (Window Size)** mit.  
Diese gibt an, wie viele Bytes ohne weitere Bestätigung gesendet werden dürfen.

Vorteile:

- Empfänger wird nicht überlastet  
- Leitung wird effizient genutzt  
- Mehrere Segmente können parallel übertragen werden  

---

### UDP – User Datagram Protocol

Eigenschaften:

- verbindungslos
- keine Garantie auf Reihenfolge
- keine automatische Fehlerkorrektur
- geringer Overhead
- unterstützt Unicast, Broadcast und Multicast

Typische Nutzung:

- DNS
- Online-Games
- Streaming
- VoIP

---

## 5) Vergleich TCP vs. UDP

| Merkmal            | TCP                              | UDP                         |
|--------------------|-----------------------------------|------------------------------|
| Verbindung         | Ja (Handshake)                    | Nein                         |
| Zuverlässigkeit    | Hoch                              | Keine Garantie               |
| Reihenfolge        | Garantiert                        | Nicht garantiert             |
| Staukontrolle      | Ja                                | Nein                         |
| Overhead           | Höher                             | Gering                       |
| Typische Nutzung   | Web, Mail, SSH                    | DNS, Streaming, Games        |

---

## 6) QUIC – Ersatz für TCP?

QUIC wurde ursprünglich von Google entwickelt.  
Es ist die Transportbasis von **HTTP/3**.

Wichtige Eigenschaften:

- basiert auf UDP
- integriert TLS 1.3-Verschlüsselung
- 0-RTT bzw. 1-RTT Verbindungsaufbau
- Multiplexing ohne Head-of-Line-Blocking
- eigene Staukontrolle

QUIC ersetzt nicht TCP allgemein,  
sondern kombiniert Funktionen von **TCP + TLS + HTTP/2** in einem Protokoll  
für moderne Webkommunikation.

---

## 7) Gesamtüberblick Verbindung

Ablauf bei einem Webzugriff:

1. Browser öffnet zufälligen Client-Port  
2. Verbindung zur Server-IP auf Port 80 oder 443  
3. TCP-Handshake (bei TCP/HTTPS)  
4. Datenübertragung  
5. Verbindung wird geschlossen  

Struktur:

```
Client-IP:Client-Port  →  Server-IP:Server-Port
```

Dies nennt man eine **Socket-zu-Socket-Verbindung**.

---

## 8) DDoS (Distributed Denial of Service)

Ein **DDoS-Angriff** ist eine Überlastungsattacke.  
Viele kompromittierte Systeme (Botnetz) senden gleichzeitig Anfragen an einen Server.

Ziel:

- Überlastung von Bandbreite
- Überlastung von Serverressourcen
- Dienst ist nicht mehr erreichbar

DDoS nutzt häufig Eigenschaften von TCP oder UDP aus,  
ist jedoch ein Sicherheitsproblem und kein Transportmechanismus.

---

## 9) Wichtige Prüfungsfragen

- Was ist ein Port?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: Eine logische Adresse innerhalb eines Geräts, die dafür sorgt, dass Daten beim richtigen Programm ankommen.
  </details>

- Was ist ein Socket?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: Eine Kombination aus IP-Adresse, Port und Transportprotokoll, die einen Kommunikationsendpunkt definiert.
  </details>

- Unterschied TCP und UDP?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: TCP ist verbindungsorientiert und zuverlässig, während UDP verbindungslos arbeitet und keine Übertragungsgarantien bietet.
  </details>

- Welche Portbereiche gibt es?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: Well Known Ports (0–1023), Registered Ports (1024–49151), Dynamic/Ephemeral Ports (49152–65535)
  </details>

- Warum ist TCP zuverlässiger?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: TCP nutzt Bestätigungen, Wiederholungen verlorener Segmente sowie Fluss- und Staukontrolle.
  </details>

- Warum ist UDP schneller?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: UDP verzichtet auf Verbindungsaufbau und Kontrollmechanismen, wodurch weniger Overhead entsteht.
  </details>

- Was ist das Sliding Window?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: Ein TCP-Mechanismus zur Flusskontrolle, bei dem der Empfänger dem Sender mitteilt, wie viele Bytes ohne weitere Bestätigung gesendet werden dürfen.
  </details>

- Was ist QUIC?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - A: Ein auf UDP basierendes Transportprotokoll mit integrierter TLS-Verschlüsselung, das die Grundlage für HTTP/3 bildet.
  </details>

---

