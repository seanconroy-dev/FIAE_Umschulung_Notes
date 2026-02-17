---
title: "Switches & Link Aggregation – Grundlagen und Praxis"
date: 2025-09-03
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Switching & Infrastruktur"
topic: "Switch-Typen, MAC-Tabelle, Link Aggregation, LACP"
level: "Grundlagen"
tags:
  - Switch
  - Managed Switch
  - Unmanaged Switch
  - Link Aggregation
  - LACP
  - 802.1AX
  - EtherChannel
  - Port Mirroring
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Switches & Link Aggregation – 2025-09-03 (NT, TRE)

## Switch-Typen

### Unmanaged Switch
- Plug & Play
- Keine Konfigurationsmoeglichkeiten
- Typisch fuer Heimnetzwerke und kleine Umgebungen

### Managed Switch
- Konfigurierbar (VLAN, Port-Sicherheit, Monitoring)
- Einsatz in Unternehmensnetzwerken
- Unterstuetzt Diagnosefunktionen wie Port Mirroring

Port Mirroring:
Kopiert den Verkehr eines Ports auf einen Analyse-Port (z. B. fuer Sniffer oder IDS).

---

## Hoeheneinheiten (HE)

- HE = Hoeheneinheit im 19"-Rack
- 1 HE = 44,45 mm
- Standardisierte Bauhoehe fuer Netzwerk- und Serverhardware
- Erleichtert Planung und Austauschbarkeit

---

## Funktionsweise eines Switches

- Arbeitet auf OSI-Schicht 2 (Data Link Layer)
- Verwendet MAC-Adressen zur Weiterleitung
- Baut eine MAC-Adresstabelle auf (MAC → Port-Zuordnung)
- Leitet Frames gezielt an den Ziel-Port weiter
- Unterschied zum Hub: Kein Flooding an alle Ports (außer bei unbekannter Ziel-MAC oder Broadcast)

Praxis-Hinweise:
- 10/100 Mbit/s nutzen nur 4 Adern (2 Paare)
- 1000Base-T nutzt alle 8 Adern (4 Paare)

---

## Link Aggregation (Port-Buendelung)

Mehrere physische Links werden zu einem logischen Kanal zusammengefasst.

Ziele:
- Hoeherer Gesamtdurchsatz
- Redundanz
- Lastverteilung

Wichtig:
Ein einzelner Datenstrom nutzt in der Regel nur einen physischen Link (Hash-basiert).

---

## Begriffe und Standards

### Link Aggregation
- Oberbegriff
- IEEE-Standard: 802.1AX (frueher 802.3ad)

### LACP (Link Aggregation Control Protocol)
- Bestandteil von 802.1AX
- Dynamische Aushandlung der Buendelung
- Automatische Erkennung und Failover

### Bonding (Linux)
- Zusammenfassen mehrerer Interfaces (z. B. bond0)
- Modi:
  - balance-rr
  - active-backup
  - balance-xor
  - 802.3ad (LACP)
  - balance-tlb / balance-alb

### EtherChannel (Cisco)
- Cisco-Bezeichnung fuer Link Aggregation
- Statisch oder via LACP
- Aelteres proprietaeres Protokoll: PAgP

### Teaming (Windows)
- Windows-Server-Begriff
- Unterstuetzt LACP und Load-Balancing-Modi

---

## Trunking – Begriffsklaerung

- VLAN-Trunking (802.1Q): Mehrere VLANs ueber eine Leitung
- Port-Trunking: Synonym fuer Link Aggregation (herstellerabhaengig)

Load-Hash-Varianten:
- SA (Source Address)
- DA (Destination Address)
- SA-DA kombiniert
- Optional Layer-4-Ports

---

## Diagramm: Link Aggregation

```
   +-------------+       ||       +-------------+
   |   Switch 1  |=======||=======|   Switch 2  |
   +-------------+       ||       +-------------+
        |  |             ||             |  |
        |  +---- LA ---- || ---- LA ----+  |
        |                ||                |
   (2x 1 Gbit/s Ports)   ||    (2x 1 Gbit/s Ports)

                 = 2 Gbit/s logischer Kanal
```

Hinweis:
Der logische Kanal verteilt Last, addiert aber nicht die Bandbreite eines einzelnen TCP-Streams.

---

## Voraussetzungen

- Beide Endgeraete muessen LA unterstuetzen
- Gleiche Geschwindigkeit und Duplex
- Identische LACP-Parameter
- Gleiche VLAN-Konfiguration bei Trunks

---

## Einsatzgebiete

- Backbone-Verbindungen
- Core-Switches
- Server mit hohem Datendurchsatz
- SAN / NAS

---

## Kernaussagen

- Switches arbeiten auf Layer 2.
- Managed Switches erlauben VLAN und Monitoring.
- Link Aggregation erhoeht Durchsatz und Redundanz.
- LACP ist der Standardmechanismus (802.1AX).
- Einzelne Verbindungen skalieren nicht linear mit der Anzahl der Links.

