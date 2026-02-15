---
title: "Power over Ethernet (PoE) & VLAN – Grundlagen und Pruefungswissen"
date: 2025-09-17
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Switching & Infrastruktur"
topic: "PoE, IEEE 802.3af/at/bt, VLAN, 802.1Q, LACP"
level: "Grundlagen"
tags:
  - PoE
  - IEEE 802.3af
  - IEEE 802.3at
  - IEEE 802.3bt
  - VLAN
  - 802.1Q
  - LACP
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Power over Ethernet (PoE) & VLAN – 2025-09-17 (NT, TRE)

# Power over Ethernet (PoE) – vollstaendige, pruefungsrelevante Notizen

## 1) Grundidee und Begriffe
- PoE = Daten + Gleichstrom ueber dasselbe Cat-Kabel. Ein Kabel pro Geraet, Netzteile vor Ort entfallen.
- Sicherheit: PSE prueft zuerst eine PD-Signatur (~25 kΩ), legt erst danach Spannung an.
- **PSE** = Power Sourcing Equipment, z. B. PoE-Switch oder Midspan-Injector.  
- **PD** = Powered Device, z. B. WLAN-AP, IP-Kamera, VoIP-Telefon.  
- **Endspan** = PoE direkt am Switchport.  
- **Midspan** = separater Injector zwischen Switch und Endgeraet.  
- PD besitzen einen **Gleichrichter** am Eingang, daher ist die Polaritaet unerheblich.

Hinweise:
- Eine **UPS** kann vorgeschaltet werden, damit PoE-Geraete bei Stromausfall weiterlaufen.
- **Kabelerwaermung** durch Buendelung und kleine Leiterquerschnitte beachten.

---

## 2) IEEE-Standards, Spannungen, Leistungen

| Standard | Marketing | Paare | Spannung (V DC) | PSE max. (W) | Garantierte PD-Leistung (W) | PD Type | Jahr |
|---|---|---|---|---|---|---|---|
| 802.3af | PoE | 2 | 44–57 | 15.4 | 12.95 | Type 1 | 2003 |
| 802.3at | PoE+ | 2 | 50–57 | 30 | 25.5 | Type 2 | 2009 |
| 802.3bt Type 3 | PoE++ | 2 oder 4 | 50–57 | 60 | 51 | Type 3 | 2018 |
| 802.3bt Type 4 | PoE++ | 4 | 50–57 | 90 | 71–72 | Type 4 | 2018 |

Korrektur:
- Die garantierte PD-Leistung ergibt sich aus Leitungsverlusten bei 100 m.
- Cisco **UPOE** (60 W, 4 Paare) war proprietaer vor 802.3bt.
- **Passive PoE** (z. B. 24 V) ist nicht IEEE-konform und besitzt keine Erkennung.

---

## 3) Leistungsklassen (0–8)

- Class 0: Default (bis 12.95 W PD bei af)  
- Class 1–3: bis 12.95 W  
- Class 4: bis 25.5 W (at)  
- Class 5–6: bis 51 W (bt Type 3)  
- Class 7–8: bis 71 W (bt Type 4)

Merke:  
Type 1 = af, Type 2 = at, Type 3/4 = bt.

---

## 4) Uebertragungsprinzip

- Alternative A: 1–2, 3–6  
- Alternative B: 4–5, 7–8  
- 1000Base-T: Daten auf allen 4 Paaren, PoE per Phantom-Speisung.  
- 802.3bt nutzt 4 Paare zur Reduktion der Strombelastung pro Paar.

100-m-Regel:  
90 m Permanent Link + 2×5 m Patchkabel.

---

## 5) Ablauf

1. Detection (PD-Signatur)  
2. Classification (0–8)  
3. Power On  
4. MPS (Maintain Power Signature)  
5. Optional LLDP-MED fuer dynamische Leistungsanpassung  

---

## 6) Budgetierung

Formel Leitungsverlust:
P_Verlust = I² × R

Beispiel:
8 Kameras × 12 W = 96 W  
+ 25 % Reserve = 120 W Budget

Reserve 20–30 % empfohlen.

---

## 7) VLAN – Grundlagen

### Was ist ein VLAN?
Ein VLAN trennt ein physisches LAN logisch in mehrere Broadcast-Domaenen.  
Geraete in unterschiedlichen VLANs koennen ohne Routing nicht direkt kommunizieren.

---

### Access-Port
- Genau ein VLAN  
- Frames untagged  
- Typisch fuer Endgeraete  

---

### Trunk-Port
- Mehrere VLANs  
- 802.1Q Tagging (4 Byte Zusatz)  
- Framegroesse: 1518 → 1522 Byte  
- VLAN-ID: 12 Bit (1–4094)

---

### Native VLAN
- Ein VLAN darf am Trunk untagged laufen  
- Muss bewusst konfiguriert werden  

---

### Link Aggregation (LACP, 802.1AX)
- Mehrere physische Links = ein logischer Link  
- Erhoeht Gesamtdurchsatz und Redundanz  
- Funktioniert auch mit Trunks  

---

### Wichtige Praxisregeln
- Endgeraet → Access  
- Switch-Uplink → Trunk  
- Trunk-Links bei hoher Last per LACP buendeln  
- Zwischenkomponenten muessen mindestens 1522 Byte unterstuetzen  

---

## Typische Fehler
- Passive und IEEE-PoE mischen  
- Budget ohne Reserve planen  
- Native VLAN unkontrolliert nutzen  
- LLDP deaktivieren  
- MTU-Groesse bei Zwischenkomponenten ignorieren  

---

## Pruefungsstichworte
PSE, PD, Endspan, Midspan, 802.3af/at/bt, Klassen 0–8, Alternative A/B, 4-Pair, Phantom-Speisung, LLDP-MED, MPS, 100-m-Regel, Budget, 802.1Q, VLAN-ID, Access, Trunk, Native VLAN, LACP.
