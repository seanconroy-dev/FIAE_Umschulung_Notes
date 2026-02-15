---
title: "IPv6 – Subnetting, Link-Local, SLAAC & Vergleich zu IPv4"
date: 2025-11-19
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "IP-Adressierung"
topic: "IPv6-Subnetting, Link-Local, SLAAC, IPv4-Vergleich"
level: "Grundlagen"
tags:
  - IPv6
  - Subnetting
  - SLAAC
  - Link-Local
  - DHCPv6
  - IPv4
  - CIDR
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# IPv6 – 2025-11-19 (NT, TRE)

## IPv6-Subnetting, Adressierung und pruefungsrelevante Grundlagen

---

## 1. Ausgangsnetz (IPv6)

Gegebenes Netz:

```
2001:1234:5678:90AB::/64
```

Ausgeschrieben:

```
2001:1234:5678:90AB:0000:0000:0000:0000/64
```

Bei einem /64-Netz:
- Die ersten 4 Hextets (64 Bit) sind Netzanteil.
- Die letzten 4 Hextets (64 Bit) sind Interface-ID.

Wichtig:
Ein /64 ist der Standard fuer IPv6-LAN-Segmente (SLAAC-Voraussetzung).

---

## 2. IPv6-Subnetting – Prinzip

Wenn ein /64 weiter unterteilt wird:

- /65 = 1 zusaetzliches Netzbit
- /66 = 2 zusaetzliche Netzbits
- /67 = 3 zusaetzliche Netzbits
- /68 = 4 zusaetzliche Netzbits

Formal:
Es wird im 5. Hextet weiter unterteilt.

Technisch korrekt:
Man erweitert das Praefix ueber Bit 64 hinaus. Praktisch betrachtet veraendert sich das 5. Hextet.

---

## 3. Beispiel: /64 in 4 Netze (/66)

2 zusaetzliche Bits → 2^2 = 4 Netze  
Schrittweite im 5. Hextet: 4000 (hex)

Netze:

```
2001:1234:5678:90AB:0000::/66
2001:1234:5678:90AB:4000::/66
2001:1234:5678:90AB:8000::/66
2001:1234:5678:90AB:C000::/66
```

Jeweilige Obergrenzen:

```
...:3FFF:FFFF:FFFF:FFFF
...:7FFF:FFFF:FFFF:FFFF
...:BFFF:FFFF:FFFF:FFFF
...:FFFF:FFFF:FFFF:FFFF
```

---

## 4. Mustererkennung fuer die Pruefung

Hex-Ziffern:
0 1 2 3 4 5 6 7 8 9 A B C D E F

Merkstruktur:

/65 → 2 Netze  
0–7 | 8–F  

/66 → 4 Netze  
0–3 | 4–7 | 8–B | C–F  

/67 → 8 Netze  
Schrittweite 2000  

/68 → 16 Netze  
Schrittweite 1000  

Regel:
Alle nachfolgenden Hextets werden bei der oberen Grenze mit FFFF aufgefuellt.

Hinweis:
In der Praxis werden /64-Netze selten weiter unterteilt, da SLAAC ein /64 erwartet.

---

## 5. IPv4 Class B (historisch, pruefungsrelevant)

- Bereich: 128.0.0.0 – 191.255.255.255
- Standardmaske: 255.255.0.0 = /16
- Fuehrende Bits: 10xxxxxx

Heute ersetzt durch CIDR.
In Pruefungen weiterhin abgefragt.

---

## 6. Link-Local & APIPA

### APIPA (IPv4)

- Bereich: 169.254.0.0/16
- Wird automatisch gesetzt, wenn DHCP aktiv ist, aber kein Server antwortet.
- Nicht routbar.
- Reine Notfalladressierung.

---

### Link-Local (IPv6)

- Praefix: fe80::/10
- Existiert automatisch auf jeder IPv6-Schnittstelle.
- Nicht routbar.
- Grundlage fuer:
  - Neighbour Discovery
  - Router Discovery
  - Default Gateway (Next-Hop wird als Link-Local-Adresse genutzt)

Unterschied:
Link-Local ist elementarer Bestandteil von IPv6, keine Notloesung.

---

## 7. SLAAC – Stateless Address Autoconfiguration

Ablauf vereinfacht:

1. Host bildet Link-Local-Adresse.
2. Router Solicitation (RS).
3. Router Advertisement (RA).
4. Host generiert globale Unicast-Adresse (Praefix + Interface-ID).
5. Default Gateway wird gesetzt.

Merkmale:

SLAAC
- Stateless
- Kein zentrales Client-Tracking
- Geringer Verwaltungsaufwand

DHCPv6
- Stateful moeglich
- Zentrale Kontrolle
- Logging und Policies

---

## Kernaussagen

- IPv6-Subnetting ab /64 folgt Hex-Mustern.
- /64 ist Standard fuer LAN-Segmente.
- Link-Local ist verpflichtend und zentral fuer IPv6.
- SLAAC ist Standardmechanismus.
- IPv4-Klassen sind historisch, aber pruefungsrelevant.
