---
title: "Managed Switch & VLAN – Praktische Konfiguration und Tests"
date: 2025-09-18
weekday: "Donnerstag"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Switching & VLAN"
topic: "Managed Switch, VLAN-Konfiguration, Access- und Trunk-Ports"
level: "Praxis"
tags:
  - VLAN
  - Managed Switch
  - Access-Port
  - Trunk-Port
  - 802.1Q
  - Router-on-a-Stick
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Managed Switch & VLAN – 2025-09-18 (NT, TRE)

## Thema: Praktische Arbeit mit Managed Switch und VLANs

## Ziel
- Praktisches Verstaendnis fuer den Einsatz eines Managed Switch.
- Konfiguration und Test von VLANs mit vier Rechnern.
- Unterschiede zwischen Access- und Trunk-Ports im Hands-on nachvollziehen.

---

## Grundlagen: VLAN
- VLAN = Virtual Local Area Network → logische Netzwerke auf demselben physischen Switch.
- Zweck: Trennung von Broadcast-Domaenen, Sicherheit, Strukturierung.
- VLAN-ID: 1–4094 (0 und 4095 reserviert).
- Geraete in unterschiedlichen VLANs koennen ohne Routing nicht direkt kommunizieren.

---

## Port-Typen
- **Access-Port**
  - Genau ein VLAN
  - Frames untagged
  - Typisch fuer Endgeraete

- **Trunk-Port**
  - Mehrere VLANs gleichzeitig
  - 802.1Q-Tagging (4 Byte Zusatz im Ethernet-Frame)
  - Typisch fuer Switch–Switch oder Switch–Router

---

## Praxisaufbau im Unterricht
- 4 PCs an einem Managed Switch.
- VLAN-Konfiguration:
  - VLAN 10 → PC1 + PC2
  - VLAN 20 → PC3 + PC4

- Port-Zuordnung:
  - Endgeraeteports → Access-Mode
  - Uplink-Port → Trunk-Mode

### Tests
- Ping innerhalb VLAN 10 → erfolgreich.
- Ping innerhalb VLAN 20 → erfolgreich.
- Ping zwischen VLAN 10 und VLAN 20 → nicht moeglich (kein Routing aktiv).

Beobachtung:
Broadcasts bleiben innerhalb ihrer jeweiligen VLAN-Broadcast-Domaene.

---

## Beispiel CLI-Befehle (Cisco Syntax)

    enable
    configure terminal

    vlan 10
    name Abteilung_A
    vlan 20
    name Abteilung_B

    interface fastEthernet0/1
      switchport mode access
      switchport access vlan 10

    interface fastEthernet0/2
      switchport mode access
      switchport access vlan 10

    interface fastEthernet0/3
      switchport mode access
      switchport access vlan 20

    interface fastEthernet0/4
      switchport mode access
      switchport access vlan 20

    interface fastEthernet0/24
      switchport mode trunk
      switchport trunk allowed vlan 10,20

    end
    write memory

Diagnosebefehle:
- show vlan brief
- show interfaces trunk

---

## Lernpunkte aus der Praxis
- VLAN-Zuordnung ist logisch, nicht physisch.
- Trunk-Ports transportieren mehrere VLANs ueber eine Leitung.
- Ohne Router oder Layer-3-Switch keine Inter-VLAN-Kommunikation.
- Access = untagged, Trunk = tagged (802.1Q).

---

## Typische Fehlerquellen
- Port-Modus falsch gesetzt (Access vs. Trunk).
- VLAN existiert, aber kein Port ist zugewiesen.
- Alte ARP-Eintraege auf Clients → ggf. ipconfig /renew.
- Routing nicht konfiguriert, obwohl VLANs kommunizieren sollen.

---

## Uebungsdrills
1. VLAN 30 anlegen und einem Port zuweisen.
2. PC von VLAN 10 nach VLAN 20 verschieben und Erreichbarkeit testen.
3. Zweiten Switch anbinden und Trunk konfigurieren.
4. Router-on-a-Stick mit Subinterfaces fuer VLAN 10 und 20 simulieren.

---

## ASCII-Skizze: Managed Switch mit VLAN 10 & VLAN 20

    PC1 (VLAN 10)           PC2 (VLAN 10)
        |                       |
     [Fa0/1]                 [Fa0/2]
          \                   /
           +-----------------+
           |   Managed      |
           |    Switch      |
           +-----------------+
     [Fa0/3]                 [Fa0/4]
        |                       |
    PC3 (VLAN 20)           PC4 (VLAN 20)

           [Fa0/24]  (Trunk-Port)
                |
                |  (zu Router oder zweitem Switch)

Legende:
- Fa0/1–Fa0/2 → Access, VLAN 10
- Fa0/3–Fa0/4 → Access, VLAN 20
- Fa0/24 → Trunk, VLAN 10 & 20 (802.1Q tagged)
