---
title: "Netzwerktechnik – Grundlagen, OSI-Modell und Netzwerkbasiswissen"
date: 2025-07-09
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Netzwerkgrundlagen"
topic: "OSI-Modell, TCP/IP, Topologien, IP-Grundlagen"
level: "Grundlagen"
tags:
  - OSI-Modell
  - TCP/IP
  - Netzwerkgrundlagen
  - Topologien
  - IP-Adresse
  - MAC-Adresse
  - Verkabelung
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Netzwerktechnik – 2025-07-09 (NT, TRE)

## Projekt: Netzwerktechnik – Grundlagen

---

## Allgemeine Hinweise

- Bewusster Umgang mit Netzressourcen (Bandbreite beachten).
- „Kochbuch“ als begleitende Kursunterlage.
- WuT-PDFs als fachliche Referenz.

---

## Schichtmodell (vereinfacht – TCP/IP, 4 Schichten)

| Schicht    | Beispiele                  | Beschreibung                               |
|------------|---------------------------|--------------------------------------------|
| Anwendung  | HTTPS, SMTP, DNS          | Programme und Dienste                      |
| Transport  | TCP, UDP, SCTP            | Ende-zu-Ende-Datenuebertragung             |
| Internet   | IP (IPv4/6), ICMP         | Logische Adressierung & Routing            |
| Netzzugang | Ethernet, Token Ring, FDDI| Physischer Zugriff aufs Medium             |

Vorteil:
Modularitaet – einzelne Schichten sind austauschbar.

---

## OSI-Modell (7 Schichten)

1. Bituebertragung – physikalische Uebertragung (Kabel, Signale)
2. Sicherung – MAC-Adressen, Fehlererkennung
3. Vermittlung – IP-Adressen, Routing
4. Transport – TCP/UDP, Zuverlaessigkeit
5. Sitzung – Sitzungssteuerung
6. Darstellung – Formatierung, Verschluesselung
7. Anwendung – Benutzernahe Programme

Merkhilfe:
Alle Deutschen Saufen Tequila, Vor dem Studium besser nicht.

---

## Was ist ein Netzwerk?

Verbindung mehrerer Geraete zur:
- Kommunikation
- Ressourcennutzung
- Datenaustausch

Beispiele:
- Internetzugang
- Druckerfreigabe
- Dateiuebertragung

---

## Netzwerk-Topologien

| Typ    | Beschreibung                                   |
|--------|-----------------------------------------------|
| Bus    | Gemeinsame Leitung, stoeranfällig, veraltet   |
| Ring   | Daten im Kreis (z. B. Token Ring)             |
| Stern  | Zentraler Switch, heute Standard              |
| Masche | Mehrere redundante Pfade                      |

---

## Uebertragungsarten

- Simplex – nur eine Richtung
- Halbduplex – abwechselnd
- Vollduplex – gleichzeitig in beide Richtungen

---

## Uebertragungsmedien

- Kupfer (Twisted Pair, Koax)
- Glasfaser
- Funk (WLAN, Bluetooth)
- Powerline

---

## Netzwerkgeraete

| Geraet        | Funktion                                      |
|---------------|-----------------------------------------------|
| Router        | Verbindet unterschiedliche Netzwerke          |
| Switch        | Leitet Frames gezielt weiter (Layer 2)       |
| Hub           | Sendet an alle Ports (veraltet)               |
| Access Point  | WLAN-Zugangspunkt                             |

---

## IP-Adressen

### IPv4
Beispiel:
192.168.0.1

Private Bereiche:
- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

### IPv6
Beispiel:
fe80::1a2b:3c4d:5e6f:7a8b  
(Hexadezimal: 0–9 und a–f)

Unterteilung:
Netzanteil / Hostanteil

---

## MAC-Adresse

- 48 Bit (6 Byte)
- Beispiel: 00:14:22:01:23:45
- Eindeutig pro Netzwerkschnittstelle
- Gilt nur lokal im LAN

---

## Wichtige Protokolle

- TCP – verbindungsorientiert, zuverlaessig
- UDP – verbindungslos, schnell
- HTTP/HTTPS – Web
- FTP – Dateiuebertragung
- DNS – Namensaufloesung
- DHCP – IP-Zuweisung

---

## Netzwerkanalyse

Tools:
- ping
- tracert / traceroute
- ipconfig / ifconfig
- nslookup

Analysebereiche:
- Erreichbarkeit
- Routen
- DNS-Aufloesung
- IP-Konfiguration

---

## Grundlagen Verkabelung

- T568A / T568B
- RJ45-Pinbelegung
- Patch- vs. Crossover-Kabel

---

## Signalstoerungen

- Daempfung
- Crosstalk (Uebersprechen)
- EMI (elektromagnetische Interferenzen)

Gegenmassnahmen:
- Schirmung
- Twisted-Pair-Technik

---

## Operatorpraezedenz – Beispiel

```java
System.out.println(true || false && false);   // true
System.out.println((true || false) && false); // false
```

Regel:
&& hat hoehere Prioritaet als ||.

---

## Ergaenzende Quellen

- WuT: Switched Ethernet Grundlagen (PDF)
- WuT: Was ist Ethernet? (PDF)

