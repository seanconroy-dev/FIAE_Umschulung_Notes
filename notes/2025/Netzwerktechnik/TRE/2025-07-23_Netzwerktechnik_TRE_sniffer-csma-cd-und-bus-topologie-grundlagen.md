---
title: "Sniffer, CSMA/CD und Bus-Topologie – Grundlagen"
date: 2025-07-23
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Netzwerkgrundlagen"
topic: "Sniffer, CSMA/CD, Kollisionsverfahren, Topologien"
level: "Grundlagen"
tags:
  - Sniffer
  - CSMA/CD
  - CSMA/CA
  - Kollisionen
  - Bus-Topologie
  - OSI-Modell
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Sniffer & Zugriffsverfahren – 2025-07-23 (NT, TRE)

---

## Sniffer – Installation & IP-Abfrage

Externe IP-Adresse per PowerShell abrufen:

```pwsh
Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'
```

Hinweis:
Dies liefert die oeffentliche IP-Adresse (NAT-Ausgang), nicht die lokale private IP.

---

## OSI-Modell – Review

Schicht 0 (inoffiziell):
- Uebertragungsmedien
- Kupferkabel
- LWL (Glasfaser)
- WLAN

Nicht offizieller Bestandteil des OSI-Modells, aber physikalische Grundlage.

---

## Zugriffsverfahren & Kollisionen

### CSMA – Carrier Sense Multiple Access

Prinzip:
Ein Geraet prueft, ob das Medium frei ist, bevor es sendet.

---

### CSMA/CD – Collision Detection

Verwendet bei:
Klassischem Ethernet mit Halbduplex (z. B. Hubs).

Ablauf:
1. Medium pruefen
2. Senden
3. Bei Kollision → Jam Signal
4. Backoff-Zeit berechnen
5. Erneuter Sendeversuch

Backoff:
Binärer exponentieller Backoff-Algorithmus.
Wartezeit wird zufaellig innerhalb wachsender Zeitfenster gewaehlt.

Hinweis:
In modernen, vollduplex-basierten Switch-Netzen tritt CSMA/CD praktisch nicht mehr auf.

---

### CSMA/CA – Collision Avoidance

Verwendet bei:
WLAN (IEEE 802.11).

Prinzip:
Kollisionen werden moeglichst vermieden, da eine gleichzeitige Sende- und Empfangserkennung nicht moeglich ist.

---

## Jam Signal

- Wird bei erkannter Kollision gesendet.
- Informiert alle Teilnehmer ueber die Stoerung.
- Fuehrt zum Abbruch des aktuellen Sendevorgangs.

---

## Bus-Topologie

Historische Netzstruktur:
- Alle Teilnehmer teilen sich ein gemeinsames Medium.
- Beispiel: Koaxialkabel-Ethernet (10Base2, 10Base5).

Wichtig:
- Terminatoren an beiden Enden erforderlich.
- Verhindern Signalreflexionen.
- Ohne Terminierung kommt es zu Stoerungen.

Heute:
Weitgehend durch Stern-Topologien mit Switches ersetzt.

---

## Kernaussagen

- CSMA/CD ist historisch relevant, aber in modernen Switch-Netzen praktisch obsolet.
- WLAN nutzt CSMA/CA.
- Bus-Topologien benoetigen Terminatoren.
- Sniffer helfen bei der Analyse von Netzwerkverkehr.
- Oeffentliche IP ist nicht gleich lokale IP.

