---
title: "VLANs & Layer-3-Switching – Grundlagen und Inter-VLAN-Routing"
date: 2026-01-14
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Switching & VLAN"
topic: "VLAN, 802.1Q, Inter-VLAN-Routing"
level: "Grundlagen"
tags:
  - VLAN
  - Layer-2
  - Layer-3
  - Inter-VLAN-Routing
  - 802.1Q
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# VLANs & Layer-3-Switching – 2026-01-14 (NT, TRE)

## Netzwerktechnik (TRE) – VLANs und Layer-3-Switching

```mermaid
flowchart TB
  R["Raspberry Pi (Router / L3)<br/>Routing + ACLs<br/>VLAN Grün GW: 192.168.1.1<br/>VLAN Rot GW: 192.168.2.1"]
  SW["VLAN-Switch (L2)<br/>Access: untagged (U)<br/>Uplink: Trunk (T, 802.1Q tagged)"]

  R <-->|"Trunk (T) 802.1Q tagged"| SW

  subgraph VG ["VLAN Grün  192.168.1.0/24"]
    GC["Chef grün"]
    G1["MA1"]
    G2["MA2"]
    G3["MA3"]
  end

  subgraph VR ["VLAN Rot  192.168.2.0/24"]
    R4["MA4"]
    R5["MA5"]
    R6["MA6"]
    RC["Chef rot"]
  end

  SW ---|"Access (U)"| G1
  SW ---|"Access (U)"| G2
  SW ---|"Access (U)"| G3
  SW ---|"Access (U)"| GC

  SW ---|"Access (U)"| RC
  SW ---|"Access (U)"| R4
  SW ---|"Access (U)"| R5
  SW ---|"Access (U)"| R6

  style VG fill:#d4edda,stroke:#28a745,stroke-width:2px
  style VR fill:#f8d7da,stroke:#dc3545,stroke-width:2px
  style R  fill:#fff3cd,stroke:#ffc107,stroke-width:2px
  style SW fill:#d1ecf1,stroke:#17a2b8,stroke-width:2px

  classDef vlanGreen fill:#d4edda,stroke:#28a745,stroke-width:2px;
  classDef vlanRed fill:#f8d7da,stroke:#dc3545,stroke-width:2px;
  class VG vlanGreen;
  class VR vlanRed;
```

## VLAN-Kommunikation ohne Routing

```mermaid
flowchart LR
  A1["MA / Chef (VLAN Grün)"] -->|"L2 Switching (bleibt im VLAN)"| A2["MA / Chef (VLAN Grün)"]

  noteA["Router ist nicht beteiligt<br/>Frames bleiben untagged am Access-Port"]:::note
  A2 --- noteA

  classDef vlanGreen fill:#d4edda,stroke:#28a745,stroke-width:2px;
  classDef note fill:#f7f7f7,stroke:#bbb,color:#333;

  class A1,A2 vlanGreen;
  class noteA note;
```

```mermaid
flowchart LR
  B1["MA / Chef (VLAN Rot)"] -->|"L2 Switching (bleibt im VLAN)"| B2["MA / Chef (VLAN Rot)"]

  noteB["Router ist nicht beteiligt<br/>Frames bleiben untagged am Access-Port"]:::note
  B2 --- noteB

  classDef vlanRed fill:#f8d7da,stroke:#dc3545,stroke-width:2px;
  classDef note fill:#f7f7f7,stroke:#bbb,color:#333;

  class B1,B2 vlanRed;
  class noteB note;
```

## VLAN-Kommunikation mit Routing

```mermaid
flowchart LR
  C1["Chef grün<br/>(192.168.1.x)"] -->|"1) zum Default-Gateway"| GW1["GW 192.168.1.1<br/>(Router / L3)"]
  GW1 -->|"2) Routing + ggf. ACL"| GW2["Weiterleitung ins VLAN Rot"]
  GW2 -->|"3) ins Ziel-VLAN"| C2["Chef rot<br/>(192.168.2.x)"]

  noteC["Zwischen Switch ↔ Router läuft der Link als Trunk (tagged).<br/>Zu Hosts: Access-Ports (untagged).<br/>Geroutet wird zwischen 192.168.1.0/24 und 192.168.2.0/24."]:::note 
  C2 --- noteC 

  classDef vlanGreen fill:#d4edda,stroke:#28a745,stroke-width:2px;
  classDef vlanRed   fill:#f8d7da,stroke:#dc3545,stroke-width:2px;
  classDef router    fill:#fff3cd,stroke:#ffc107,stroke-width:2px;
  classDef note      fill:#f7f7f7,stroke:#bbb,color:#333;

  class C1 vlanGreen;
  class C2 vlanRed;
  class GW1,GW2 router;
  class noteC note;
```

## Layer-3-Switch (VLAN-Routing)

Ein Layer-3-Switch kombiniert:

- Layer 2 (Switching, VLANs, MAC-Adressverarbeitung)
- Layer 3 (Routing, IP-Weiterleitung)

Er trennt VLANs logisch und ermöglicht gleichzeitig kontrollierte Kommunikation zwischen ihnen (Inter-VLAN-Routing).  
In vielen LAN-Szenarien ersetzt er einen klassischen Router.

---

## VLAN-Struktur im Beispiel

### VLAN Grün
- IP-Netz: 192.168.1.0/24
- Endgeräte: MA1, MA2, MA3, Chef grün

### VLAN Rot
- IP-Netz: 192.168.2.0/24
- Endgeräte: MA4, MA5, MA6, Chef rot

Die Trennung erfolgt logisch über VLAN-Tags (IEEE 802.1Q), nicht physisch über separate Switches.

---

## Rolle des Layer-3-Geräts

Das Layer-3-Gerät:

- besitzt pro VLAN eine Gateway-IP
- trifft Routing-Entscheidungen anhand der Ziel-IP
- kann ACLs anwenden
- führt Inter-VLAN-Routing durch

Wichtig: Das IP-Paket bleibt erhalten, nur der Ethernet-Frame (inkl. VLAN-Tag) wird neu erzeugt.

---

## Kommunikationsszenarien

### Innerhalb eines VLANs
- Reines Layer-2-Switching
- Keine Beteiligung des Routers
- Keine VLAN-Grenzüberschreitung

### Zwischen VLANs
- Paket geht an das Default-Gateway
- Routing-Entscheidung auf Layer 3
- Neues Frame mit Ziel-VLAN-Tag
- Weiterleitung ins Zielnetz

---

## Kernaussagen

- VLANs segmentieren ein LAN logisch.
- Ohne Routing sind VLANs strikt getrennt.
- Inter-VLAN-Kommunikation erfordert Routing.
- Ein Layer-3-Switch integriert Switching und Routing in einem Gerät.

---

## Prüfungsmerksatz

Ein Layer-3-Switch trennt VLANs auf Layer 2 und verbindet sie gezielt über Routing auf Layer 3.
