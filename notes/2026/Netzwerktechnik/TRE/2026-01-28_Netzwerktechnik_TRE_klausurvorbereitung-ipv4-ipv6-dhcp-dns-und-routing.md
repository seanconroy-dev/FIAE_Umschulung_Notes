---
title: "Klausurvorbereitung – IPv4, IPv6, DHCP, DNS und Routing"
date: 2026-01-28
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "IP-Adressierung & Routing"
topic: "IPv4, IPv6, DHCP, DNS, Routingprotokolle"
level: "Wiederholung"
tags:
  - IPv4
  - IPv6
  - DHCP
  - DNS
  - Routing
  - RIP
  - OSPF
  - BGP
  - APIPA
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Klausurvorbereitung – 2026-01-28 (NT, TRE)

## Wichtige Themenbereiche

- IPv4 (Adressierung, besondere Adressen, Subnetting)
- IPv6 (Adressierung, besondere Adressen, Subnetting)
- DHCP
- DNS
- Routing (statisch und dynamisch)

---

## IPv4

- 32 Bit
- Darstellung in vier Oktetten (z. B. 192.168.1.1)

### Klassisches Klassenmodell (historisch)

- Klasse A: 1.0.0.0 – 126.255.255.255 (/8)
- Klasse B: 128.0.0.0 – 191.255.255.255 (/16)
- Klasse C: 192.0.0.0 – 223.255.255.255 (/24)

Hinweis:
127.0.0.0/8 ist Loopback und keine normale Klasse-A-Nutzung.

Heute ersetzt durch CIDR.

---

### Besondere IPv4-Adressen

- Netzwerkadresse → alle Hostbits = 0
- Broadcastadresse → alle Hostbits = 1
- Loopback → 127.0.0.1
- Private Bereiche:
  - 10.0.0.0/8
  - 172.16.0.0/12
  - 192.168.0.0/16

---

### Subnetting

- Aufteilung eines Netzes in kleinere Teilnetze
- CIDR-Notation (z. B. /24)
- Hosts pro Subnetz:
  2^(Hostbits) − 2

---

## IPv6

- 128 Bit
- Hexadezimale Darstellung (z. B. 2001:db8::1)

Hinweis:
2001:db8::/32 ist Dokumentationsbereich.

---

### Adresstypen

- Global Unicast (oeffentlich)
- Link-Local → fe80::/10
- Multicast → ff00::/8

Kein Broadcast bei IPv6.

---

### Besonderheiten

- Standard-Subnetzgroesse im LAN: /64
- Link-Local existiert immer
- Autokonfiguration per SLAAC moeglich

---

## DHCP (Dynamic Host Configuration Protocol)

Zuweisung von:
- IP-Adresse
- Subnetzmaske
- Standardgateway
- DNS-Server

Transport:
- UDP Port 67 (Server)
- UDP Port 68 (Client)

---

### DORA-Ablauf

1. Discover
2. Offer
3. Request
4. Acknowledge

Optional:
- Release (Adresse freigeben)
- Lease-Time (Gueltigkeitsdauer)

Merksatz:
DORA = Discover, Offer, Request, Acknowledge.

---

## DNS (Domain Name System)

Funktion:
Namensauflösung → Domainname zu IP-Adresse

Hierarchie:
- Root
- Top-Level-Domain (.de, .com)
- Autoritative Nameserver

Wichtige Records:
- A → IPv4
- AAAA → IPv6
- CNAME → Alias
- MX → Mailserver

---

## Routing

Weiterleitung von Paketen zwischen Netzwerken.

---

### Statisches Routing
- Manuell konfiguriert
- Geringer Overhead
- Nicht skalierbar

---

### Dynamisches Routing

Router tauschen Routen automatisch aus.

- RIP
  - Distanzvektor
  - Metrik: Hop-Count (max. 15)

- OSPF
  - Link-State
  - Schnelle Konvergenz
  - Kostenmetrik

- BGP
  - Pfadvektor
  - Routing zwischen autonomen Systemen
  - Grundlage des Internets

---

## APIPA (IPv4)

- Bereich: 169.254.0.0/16
- Wird vergeben, wenn kein DHCP-Server erreichbar ist.
- Nicht routbar.
- Reine Notfalladressierung.

---

## Kernaussagen

- IPv4 = 32 Bit, IPv6 = 128 Bit.
- CIDR ersetzt Klassenmodell.
- DHCP automatisiert IP-Vergabe (DORA).
- DNS uebersetzt Namen in IP-Adressen.
- Routing verbindet Netze.
- Dynamische Protokolle skalieren besser als statische Routen.
