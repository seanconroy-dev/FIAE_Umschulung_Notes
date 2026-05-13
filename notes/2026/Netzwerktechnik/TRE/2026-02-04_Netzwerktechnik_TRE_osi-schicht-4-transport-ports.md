---
title: "OSI-Schicht 4 - Transport & Ports"
date: 2026-02-04
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "OSI-Modell"
topic: "Transport Layer, TCP, UDP, Ports"
level: "Grundlagen"
tags:
  - OSI
  - Transport
  - TCP
  - UDP
  - Ports
  - Netzwerktechnik
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# OSI-Schicht 4 - Transport & Ports

## Kurzüberblick

Die **OSI-Schicht 4**, auch **Transportschicht** genannt, ist für die **Ende-zu-Ende-Kommunikation** zwischen zwei Hosts verantwortlich.

Sie sorgt dafür, dass Daten zwischen Anwendungen beziehungsweise Prozessen übertragen werden können.

Ein wichtiger Bestandteil dieser Schicht sind **Ports**, weil sie festlegen, welches Programm oder welcher Dienst auf einem Zielsystem angesprochen wird.

## Kernerklärung

### 1. Aufgabe der Transportschicht

Die Transportschicht ist dafür zuständig, Daten von einem Quellprozess zu einem Zielprozess zu transportieren.

Dabei geht es nicht mehr darum, welches Kabel genutzt wird oder über welchen Router ein Paket läuft. Diese Aufgaben gehören zu niedrigeren OSI-Schichten.

Schicht 4 konzentriert sich auf die Kommunikation zwischen Anwendungen.

**Kernfunktionen:**

- Segmentierung von Daten
- Wiederzusammensetzen der Daten am Ziel
- Zuverlässige Übertragung bei TCP
- Flusskontrolle
- Staukontrolle
- Fehlererkennung

**Merksatz:**

Schicht 4 interessiert sich nicht mehr für Kabel oder IP-Routing, sondern für **Prozess-zu-Prozess-Kommunikation**.

### 2. Ports

Ports sind **logische Endpunkte** der Transportschicht.

Sie identifizieren, welcher Dienst oder welches Programm Daten empfangen soll.

**Vergleich:**

| Bestandteil | Bedeutung |
|---|---|
| IP-Adresse | Welcher Computer? |
| Port | Welches Programm auf diesem Computer? |

Ports stehen im **TCP- oder UDP-Header**.

### 3. Port-Bereiche

| Kategorie | Bereich | Bedeutung |
|---|---:|---|
| Well-known Ports | 0-1023 | Standardisierte Dienste |
| Registered Ports | 1024-49151 | Registrierte Anwendungen |
| Dynamic / Private Ports | 49152-65535 | Temporäre Client-Ports |

### 4. Wichtige Standard-Ports

| Dienst | Port |
|---|---:|
| FTP | 20 Daten, 21 Steuerung |
| SSH | 22 |
| Telnet | 23 |
| SMTP | 25 |
| DNS | 53 |
| DHCP | 67 Server, 68 Client |
| HTTP | 80 |
| POP3 | 110 |
| NTP | 123 |
| IMAP | 143 |
| HTTPS | 443 |
| MySQL | 3306 |
| RDP | 3389 |
| PostgreSQL | 5432 |
| RabbitMQ | 5672 |
| Redis | 6379 |
| Netzwerkdrucker | 9100 TCP |
| Memcached | 11211 |
| MongoDB | 27017 |

### 5. TCP - Transmission Control Protocol

TCP ist ein verbindungsorientiertes Transportprotokoll.

Es wird verwendet, wenn Daten zuverlässig, vollständig und in der richtigen Reihenfolge ankommen müssen.

**Eigenschaften:**

- Verbindungsorientiert
- Nutzt den 3-Way-Handshake
- Zuverlässig
- Reihenfolge der Daten wird garantiert
- Fehlererkennung durch Sequenznummern und ACK
- Flusskontrolle durch Windowing
- Staukontrolle durch Congestion Control

**Typische Anwendungen:**

- HTTP
- HTTPS
- FTP
- SMTP
- SSH

**Merksatz:**

TCP ist wie ein Einschreiben mit Rückschein.

### 6. UDP - User Datagram Protocol

UDP ist ein verbindungsloses Transportprotokoll.

Es wird verwendet, wenn Geschwindigkeit wichtiger ist als garantierte Zustellung.

**Eigenschaften:**

- Verbindungslos
- Keine Garantie für Zustellung
- Keine Reihenfolgegarantie
- Kein Verbindungsaufbau
- Geringer Overhead
- Schnell

**Typische Anwendungen:**

- DNS
- DHCP
- VoIP
- Video-Streaming
- Online-Gaming

**Merksatz:**

UDP ist wie eine Postkarte: schnell, aber ohne Garantie.

## Prüfungsrelevante Kernaussagen

- Ports gehören zur OSI-Schicht 4.
- IP-Adresse und Port ergeben zusammen einen Socket.
- TCP ist zuverlässig.
- UDP ist schnell und hat wenig Overhead.
- Well-known Ports liegen im Bereich 0-1023.
- Clients nutzen meistens dynamische Ports.
- Server lauschen meistens auf festen Ports.
- TCP eignet sich für Anwendungen, bei denen Vollständigkeit und Reihenfolge wichtig sind.
- UDP eignet sich für Anwendungen, bei denen Geschwindigkeit wichtiger ist als garantierte Zustellung.

## Begriffe

| Begriff | Bedeutung |
|---|---|
| Transportschicht | OSI-Schicht 4, zuständig für Ende-zu-Ende-Kommunikation |
| Port | Logischer Endpunkt für Dienste oder Programme |
| TCP | Zuverlässiges, verbindungsorientiertes Transportprotokoll |
| UDP | Schnelles, verbindungsloses Transportprotokoll |
| Socket | Kombination aus IP-Adresse und Port |
| Well-known Port | Standardisierter Port im Bereich 0-1023 |

## Zusammenfassung

Die Transportschicht ist die vierte Schicht des OSI-Modells.

Sie verbindet Anwendungen miteinander und sorgt dafür, dass Daten beim richtigen Programm auf dem Zielsystem ankommen.

Dafür verwendet sie Ports.

TCP bietet eine zuverlässige Verbindung mit Fehlererkennung, Reihenfolgegarantie und Flusskontrolle.

UDP verzichtet auf diese Sicherheiten, ist dafür aber schneller und hat weniger Overhead.

Für die AP1-Prüfung ist besonders wichtig, dass Ports zur Schicht 4 gehören und dass TCP und UDP klar voneinander unterschieden werden können.

---

Quelle: Eigene Unterrichtsnotizen, FIAE Umschulung 2025-2027
