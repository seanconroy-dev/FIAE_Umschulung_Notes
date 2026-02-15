---
title: "AP1-Guide – OSI, Subnetting, Ports und Netzwerkgrundlagen"
date: 2025-08-27
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "AP1-Prüfungsvorbereitung"
topic: "OSI-Modell, Subnetting, Standardports, Netzwerkgeräte"
level: "Grundlagen"
tags:
  - AP1
  - OSI-Modell
  - Subnetting
  - CIDR
  - Standardports
  - Router
  - Switch
  - NAT
  - VLAN
  - VPN
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Netzwerktechnik – AP1-Guide – 2025-08-27 (NT, TRE)

---

## 1. Switches

### Unmanaged Switch
- Keine Konfiguration moeglich
- Plug & Play
- Heimgebrauch oder kleine Netze

### Managed Switch
- VLANs, Port-Sicherheit, Monitoring
- Unternehmensumgebungen
- Hohe Portdichte (z. B. 24–48 Ports)

---

## 2. OSI-Modell – Uebersicht

7 Anwendung  
6 Darstellung  
5 Sitzung  
4 Transport  
3 Vermittlung (Network)  
2 Sicherung (Data Link)  
1 Bituebertragung (Physical)

Merksatz:
Alle Priester Saufen Tequila Nach Der Predigt

Wichtig:
- IP = Schicht 3
- TCP/UDP = Schicht 4
- MAC-Adresse = Schicht 2

---

## 3. IPv4 & Subnetting

IPv4:
32 Bit, vier Oktette (z. B. 192.168.1.1)

Formel:
Anzahl Adressen = 2^(Host-Bits)  
Nutzbare Hosts = Adressen − 2

---

### AP1-Spick-Tabelle

| Präfix | Maske              | Nutzbare Hosts |
|--------|--------------------|----------------|
| /24    | 255.255.255.0      | 254            |
| /25    | 255.255.255.128    | 126            |
| /26    | 255.255.255.192    | 62             |
| /27    | 255.255.255.224    | 30             |
| /28    | 255.255.255.240    | 14             |
| /29    | 255.255.255.248    | 6              |
| /30    | 255.255.255.252    | 2              |

---

### Beispiel: 50 Hosts

50 + 2 = 52  
Naechste 2er-Potenz = 64  
Host-Bits = 6  
Praefix = 32 − 6 = /26  
→ 62 nutzbare Hosts

---

## 4. Standardports

| Dienst | Port |
|--------|------|
| HTTP   | 80   |
| HTTPS  | 443  |
| FTP    | 21   |
| SMTP   | 25   |
| DNS    | 53   |
| DHCP   | 67/68|
| IMAP   | 143 / 993 |

---

## 5. Netzwerkgeraete

Hub:
- Sendet an alle Ports
- Halbduplex
- Veraltet

Switch:
- MAC-basiert
- Vollduplex
- Standard im LAN

Router:
- Verbindet Netzwerke
- Arbeitet mit IP-Adressen

Access Point:
- WLAN-Zugangspunkt

Firewall:
- Kontrolliert Datenverkehr nach Regeln

---

## 6. Netzwerktopologien

Stern:
- Standard
- Robust bei Einzelausfall

Bus:
- Gemeinsames Medium
- Stoeranfällig

Ring:
- Historisch (z. B. Token Ring)

Hinweis:
Maschennetze sind am ausfallsichersten, Stern ist im LAN Standard.

---

## 7. Sicherheit

NAT:
- Mehrere private IPs nutzen eine oeffentliche IP

VLAN:
- Logische Segmentierung innerhalb eines Switches

VPN:
- Verschluesselter Tunnel ueber oeffentliche Netze

---

## 8. Typische AP1-Fragen

- IP liegt auf welcher Schicht? → 3  
- HTTPS-Port? → 443  
- DHCP? → automatische IP-Vergabe  
- 30 Clients? → /27  
- Unterschied Hub/Switch? → gezielte Weiterleitung vs. Broadcast

---

## CIDR – Einfach erklaert

/24:
- 24 Netz-Bits
- 8 Host-Bits
- 254 nutzbare Hosts

Blockgroesse berechnen:
256 − letzter Maskenwert

Beispiel /26:
Maske 255.255.255.192  
256 − 192 = 64  
Subnetze beginnen bei:
0, 64, 128, 192

---

## Kernaussagen

- OSI-Schichten sicher beherrschen.
- Subnetting bis /30 verstehen.
- Standardports kennen.
- Router, Switch, Hub unterscheiden koennen.
- NAT, VLAN, VPN grundlegend erklaeren koennen.
