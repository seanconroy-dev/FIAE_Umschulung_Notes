---
title: "Ethernet Frame – Aufbau, Felder und Bedeutung"
date: 2025-09-24
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "OSI-Modell & Ethernet"
topic: "Ethernet-Frame, MAC-Adressen, EtherType, FCS"
level: "Grundlagen"
tags:
  - Ethernet
  - OSI-Modell
  - Layer 2
  - MAC-Adresse
  - EtherType
  - FCS
  - MTU
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Ethernet Frame – 2025-09-24 (NT, TRE)

## Ethernet Frame – Aufbau und Bedeutung

---

## 1. Einordnung: Ethernet im OSI-Modell

Ethernet arbeitet auf **Layer 2 (Sicherungsschicht)** des OSI-Modells.  
Daten werden auf diesem Layer in **Frames** übertragen.

Ein Ethernet-Frame kapselt:
- Nutzdaten höherer Schichten (z. B. IP-Pakete)
- Steuerinformationen für die lokale Übertragung

---

## 2. Zweck eines Ethernet Frames

Ein Ethernet-Frame ermöglicht:

- Lokale Adressierung über MAC-Adressen
- Strukturierte Übertragung im LAN
- Fehlererkennung mittels CRC

Wichtig:
Ethernet erkennt Fehler, korrigiert sie aber nicht. Fehlerhafte Frames werden verworfen.

---

## 3. Aufbau eines Ethernet-II-Frames

```
| Preamble | SFD | Dest MAC | Src MAC | EtherType | Payload | FCS |
```

Hinweis:
In der Größenberechnung werden Preamble und SFD nicht mitgezählt.

---

## 4. Felder im Detail

### 4.1 Preamble (7 Byte)
- Synchronisation zwischen Sender und Empfänger
- Bitmuster: 10101010 (7×)

---

### 4.2 Start Frame Delimiter (1 Byte)
- Kennzeichnet den Beginn des Frames
- Bitmuster: 10101011

---

### 4.3 Destination MAC (6 Byte)
- Zieladresse im lokalen Netz
- Typen:
  - Unicast
  - Multicast
  - Broadcast (FF:FF:FF:FF:FF:FF)

---

### 4.4 Source MAC (6 Byte)
- MAC-Adresse des sendenden Geräts
- Eindeutig pro Netzwerkschnittstelle

---

### 4.5 EtherType (2 Byte)
- Kennzeichnet das Protokoll im Payload

Beispiele:
- 0x0800 → IPv4
- 0x86DD → IPv6
- 0x0806 → ARP

---

### 4.6 Payload
- Enthält z. B. ein IP-Paket
- Mindestgröße: 46 Byte
- Maximalgröße: 1500 Byte (Standard-MTU)

Falls zu klein:
Padding wird hinzugefügt, um die Mindestgröße zu erreichen.

---

### 4.7 Frame Check Sequence (4 Byte)
- 32-Bit-CRC
- Prüft Integrität des Frames
- Bei Fehler → Frame wird verworfen

---

## 5. Größenübersicht

| Bestandteil | Größe |
|------------|------|
| Header (Dest + Src + Type) | 14 Byte |
| Payload (min) | 46 Byte |
| Payload (max) | 1500 Byte |
| FCS | 4 Byte |
| Frame gesamt (min) | 64 Byte |
| Frame gesamt (max) | 1518 Byte |

Optional:
Mit 802.1Q-VLAN-Tag erhöht sich die maximale Framegröße auf 1522 Byte.

---

## 6. Ethernet Frame vs. IP-Paket

Ethernet Frame:
- Layer 2
- Lokale Übertragung im LAN
- MAC-basierte Zustellung

IP-Paket:
- Layer 3
- Netzübergreifende Adressierung
- Wird in Ethernet-Frames eingebettet

Merksatz:
Ohne Ethernet-Frame kein IP-Verkehr im lokalen Netz.

---

## Prüfungsrelevanz

Typische Fragen:
- Welche Felder enthält ein Ethernet-Frame?
- Wozu dient die FCS?
- Wie groß ist ein Ethernet-Frame minimal und maximal?
- Welche EtherTypes kennst du?

---

## Kernaussagen

- Ethernet ist Layer 2.
- MAC-Adressen gelten nur lokal.
- Mindestframegröße: 64 Byte.
- Standard-MTU: 1500 Byte.
- Fehler werden erkannt, aber nicht korrigiert.

