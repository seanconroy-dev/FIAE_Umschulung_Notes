---
title: "Routing – Dynamisch vs. Statisch (RIP, OSPF, BGP)"
date: 2026-01-07
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Routing"
topic: "Dynamisches und statisches Routing, RIP-Grundlagen"
level: "Grundlagen"
tags:
  - Routing
  - RIP
  - OSPF
  - BGP
  - Statisches Routing
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2026-01-07_NT_TRE

---

# Routing – Überblick

Routing beschreibt die **Pfadwahl von IP-Paketen** durch ein Netzwerk.

Ein Router entscheidet:
> „Über welchen nächsten Hop leite ich dieses Paket weiter?“

Grundlage ist die **Routingtabelle**.

---

# Einteilung der Routing-Verfahren

Routing wird unterteilt in:

- **Dynamisches Routing**
- **Statisches Routing**

---

# Dynamisches Routing

Routen werden automatisch berechnet.  
Router tauschen regelmäßig Informationen aus.

Geeignet für:
- Große Netzwerke
- Verteilte Standorte
- Dynamische Topologien

---

## Wichtige dynamische Protokolle

### RIP – Routing Information Protocol
- Typ: Distanzvektor
- Metrik: **Hop-Anzahl**
- Maximal: **15 Hops**
- Bandbreite wird nicht berücksichtigt
- Einfach, aber veraltet für große Netze

---

### OSPF – Open Shortest Path First
- Typ: Link-State
- Metrik: **Kosten (bandbreitenabhängig)**
- Algorithmus: **Dijkstra (Shortest Path First)**
- Schnellere Konvergenz als RIP
- Für größere Unternehmensnetze geeignet

---

### BGP – Border Gateway Protocol
- Typ: Path-Vector
- Einsatz: Zwischen autonomen Systemen (Internet)
- Entscheidung: **Policy-basiert**
- Kein klassisches „kürzester Weg“-Prinzip
- Grundlage des globalen Internet-Routings

---

# Statisches Routing

Routen werden manuell konfiguriert.

Es erfolgt:
- Kein Routing-Update
- Keine automatische Anpassung bei Ausfall

Eine statische Route besteht aus:
- Zielnetz
- Präfix (Subnetzmaske)
- Next-Hop-Adresse oder Interface

Geeignet für:
- Kleine Netzwerke
- Kontrollierte Umgebungen
- Default-Routen

---

## Net-Routing

Route gilt für ein **gesamtes Netzwerk**.

Beispiel:
192.168.10.0/24

Eigenschaften:
- Deckt viele Hosts ab
- Geringer Verwaltungsaufwand
- Keine automatische Fehlerbehandlung

---

## Host-Routing

Route gilt für **einen einzelnen Host**.

Präfix:
- IPv4 → /32
- IPv6 → /128

Eigenschaften:
- Sehr spezifisch
- Wird bevorzugt
- Höherer Verwaltungsaufwand

---

## Wichtiges Prinzip

Routing basiert auf dem  
**Longest Prefix Match**

Die spezifischste Route gewinnt.

Hostroute (/32) schlägt Netzroute (/24).

---

# RIP – Vertiefung

## Grundprinzip

- Distanzvektor-Protokoll
- Bewertung ausschließlich über **Hop-Anzahl**
- Jeder Router zählt als 1 Hop

Weniger Hops = besserer Pfad

---

## Entscheidungsbeispiel

Pfad A → B → Ziel = 2 Hops  
Pfad A → C → B → Ziel = 3 Hops  

Auch wenn:
- C höhere Bandbreite hat
- Verbindung stabiler wäre

RIP wählt:
> Den Weg mit weniger Hops

---

## RIP-Merkpunkte

- Maximal 15 Hops
- 16 = unerreichbar
- Keine Bandbreitenbewertung
- Langsame Konvergenz
- Gefahr von Routing-Loops (ohne Mechanismen wie Split Horizon)

---

# Vergleich Dynamisch vs. Statisch

| Merkmal | Dynamisch | Statisch |
|----------|------------|------------|
| Einrichtung | Automatisch | Manuell |
| Skalierbarkeit | Hoch | Gering |
| Anpassung bei Ausfall | Automatisch | Manuell |
| Verwaltungsaufwand | Mittel | Hoch bei großen Netzen |
| Transparenz | Geringer | Sehr hoch |

---

# Prüfungsrelevante Kernaussagen

- RIP = Hop-Anzahl
- OSPF = Kosten (Bandbreite)
- BGP = Policy-basiert
- Hostrouten gewinnen durch Longest Prefix Match
- Statische Routen reagieren nicht auf Ausfälle
- Dynamische Protokolle konvergieren nach Änderungen
