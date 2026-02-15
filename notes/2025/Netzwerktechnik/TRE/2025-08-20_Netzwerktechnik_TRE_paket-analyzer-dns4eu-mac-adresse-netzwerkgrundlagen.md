---
title: "Paket-Analyzer, DNS4EU, MAC-Adresse & Netzwerkgrundlagen"
date: 2025-08-20
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Netzwerkgrundlagen & Analyse"
topic: "Sniffer, MAC-Adresse, Hub vs. Switch, DNS4EU"
level: "Grundlagen"
tags:
  - Wireshark
  - Paket-Analyse
  - DNS
  - DNS4EU
  - MAC-Adresse
  - Hub
  - Switch
  - ARP
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Paket-Analyzer & Netzwerkgrundlagen – 2025-08-20 (NT, TRE)

---

## Paket-Analyzer (Sniffer)

Zweck:
Analyse von Netzwerkverkehr (z. B. Wireshark).

Moegliche Auswertungen:
- Absender- und Zieladresse
- Verwendetes Protokoll
- Portnummern
- Paketgroesse
- Zeitstempel

Einsatzbereiche:
- Fehlersuche (Paketverlust, Latenz)
- Sicherheitsanalyse
- Protokollverstaendnis
- Aufdeckung unautorisierter Kommunikation

Hinweis:
Einsatz nur mit Genehmigung und unter Beachtung des Datenschutzes.

---

## DNS4EU

- EU-Initiative fuer einen europaeischen DNS-Resolver.
- Ziel:
  - Datenschutz
  - Sicherheit
  - Digitale Souveraenitaet
- Funktionen:
  - Filterung bekannter Malware- und Phishing-Domains
  - Alternative zu oeffentlichen Resolvern wie Google oder Cloudflare

---

## CMOS & ICs

### CMOS (Complementary Metal-Oxide-Semiconductor)
- Halbleitertechnologie fuer stromsparende digitale Schaltungen
- Grundlage moderner Prozessoren, Router- und Switch-Chips

### IC (Integrated Circuit)
- Integrierter Schaltkreis („Chip“)
- Enthält Millionen bis Milliarden Transistoren
- Basis moderner Netzwerktechnik-Hardware

---

## Hub vs. Switch

### Hub
- Arbeitet physikalisch auf Layer 1
- Halbduplex
- Sendet Daten an alle Ports
- Hohe Kollisionswahrscheinlichkeit
- Veraltet

### Switch
- Arbeitet auf Layer 2
- Vollduplex
- Leitet Frames gezielt weiter (MAC-Tabelle)
- Effizienter und sicherer
- Standard in modernen Netzwerken

---

## MAC-Adresse

Media Access Control Address

- 48 Bit (6 Byte)
- Hexadezimale Darstellung
- Beispiel: 1A-2B-3C-4D-5E-6F

Aufbau:
- 24 Bit OUI (Herstellerkennung)
- 24 Bit geraetespezifischer Anteil

Moegliche Kombinationen pro Hersteller:
2^24 = 16.777.216

Broadcast-Adresse:
FF-FF-FF-FF-FF-FF

Eigenschaften:
- Gilt nur innerhalb einer Broadcast-Domaene
- Wird von Routern nicht weitergeleitet

---

## Praxisbefehle

Eigene MAC-Adresse anzeigen:
ipconfig /all

ARP-Tabelle anzeigen:
arp -a

Zeigt:
- IP-Adresse
- Zugeordnete MAC-Adresse
- Geraete im lokalen Netzsegment

---

## Kernaussagen

- Sniffer helfen bei Analyse und Fehlersuche.
- DNS4EU ist eine EU-Initiative fuer sicheren DNS.
- Hubs senden an alle, Switches leiten gezielt weiter.
- MAC-Adressen sind lokal eindeutig.
- Broadcast endet an der Router-Grenze.
