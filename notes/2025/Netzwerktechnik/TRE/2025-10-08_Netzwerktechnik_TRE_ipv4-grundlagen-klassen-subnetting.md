---
title: "IPv4 – Grundlagen, Klassen & Subnetting"
date: 2025-10-08
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "IP-Adressierung"
topic: "IPv4, Klassen, Subnetting"
level: "Grundlagen"
tags:
  - IPv4
  - Subnetting
  - CIDR
  - Netzwerktechnik
  - Private Adressen
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-10-08_NT_TRE

# IPv4 – Grundlagen

## Aufbau

Eine IPv4-Adresse besteht aus:

- **32 Bit**
- Aufgeteilt in **4 Oktette**
- Jedes Oktett = **8 Bit**
- Darstellung: `xxx.xxx.xxx.xxx`

Beispiel:  
192.168.0.1

---

## Klassen (klassisches Modell)

| Klasse | 1. Oktett | Standardpräfix | Beispiel | Netz-ID / Host-ID |
|---------|------------|----------------|----------|--------------------|
| A | 0 – 127 | /8 | 10.0.0.0 | NETZ \| Host Host Host |
| B | 128 – 191 | /16 | 172.16.0.0 | NETZ NETZ \| Host Host |
| C | 192 – 223 | /24 | 192.168.0.0 | NETZ NETZ NETZ \| Host |

Hinweis:  
Das Klassenmodell ist historisch.  
Heute wird hauptsächlich **CIDR** verwendet.

---

# Wichtige Spezialadressen

## 0.0.0.0
- Bedeutet: „keine zugewiesene Adresse“
- Wird z. B. bei DHCP-Discover verwendet

## 127.0.0.1
- Loopback-Adresse
- Verweist immer auf das eigene System

## DHCP
- Automatische IP-Vergabe
- Verwendet Broadcast bei Erstzuweisung

---

# Private IPv4-Adressbereiche

| Klasse | Bereich | CIDR | Theoretische Anzahl |
|----------|-----------|--------|----------------------|
| A | 10.0.0.0 – 10.255.255.255 | /8 | 16.777.216 |
| B | 172.16.0.0 – 172.31.255.255 | /12 | 1.048.576 |
| C | 192.168.0.0 – 192.168.255.255 | /16 | 65.536 |

Hinweis:  
Die Angabe „−2“ gilt pro Subnetz, nicht für den gesamten Bereich.

---

# Netz- und Hostanteil

Beispiel Class A:

IP: 10.0.0.0  
Maske: 255.0.0.0 (/8)

11111111 00000000 00000000 00000000  
Fixer Netzanteil | Variabler Hostanteil

---

Beispiel Class C:

IP: 192.168.33.41  
Maske: 255.255.255.0 (/24)

11111111 11111111 11111111 00000000  
Netzanteil | Hostanteil

---

# Warum verliert jedes Subnetz 2 Adressen?

- Netzadresse (alle Hostbits = 0)
- Broadcastadresse (alle Hostbits = 1)

Beispiel /24:

256 mögliche Kombinationen  
256 − 2 = 254 nutzbare Hosts

---

# Subnetting – Grundlagen

Subnetting bedeutet:
Ein großes Netz in mehrere kleinere Netze unterteilen.

Beispiel:

255.255.255.192 = /26

/24 → 256 Adressen  
/26 → 64 Adressen pro Subnetz  

64 − 2 = 62 nutzbare Hosts

Ein /24-Netz wird zu:

2^(26−24) = 4 Subnetze

---

# Beispiel: 10.0.0.0 /8 → /16

Ausgang:
10.0.0.0 /8

Neue Maske:
255.255.0.0 (/16)

Es werden 8 zusätzliche Bits für das Subnetz verwendet.

Anzahl Subnetze:
2^8 = 256

Hosts pro Subnetz:
2^16 = 65.536  
65.536 − 2 = 65.534 nutzbare Hosts

Beispiele:
10.1.0.0  
10.2.0.0  
10.3.0.0  
...  
10.255.0.0

---

# Subnetting – Beispielaufgaben

---

## Problem 1  
50 Netze mit je mindestens 300 Hosts

Benötigte Hosts pro Netz:
300

Kleinste passende Hostanzahl:

2^9 = 512  
512 − 2 = 510 nutzbar

→ Benötigtes Präfix: /23

Ein /23 liefert:
510 Hosts pro Subnetz

Wenn wir 10.0.0.0 als Basis nehmen:

Anzahl möglicher /23-Subnetze im /8-Bereich:

Differenz: 23 − 8 = 15  
2^15 = 32.768 Subnetze

→ Mehr als ausreichend für 50 Netze

---

## Problem 2  
300 Netze mit je mindestens 50 Hosts

Benötigte Hosts:

2^6 = 64  
64 − 2 = 62 nutzbar

→ Benötigtes Präfix: /26

Wenn wir 10.0.0.0 /8 verwenden:

Differenz: 26 − 8 = 18  
2^18 = 262.144 Subnetze

→ Weit mehr als 300 erforderlich

---

# Wichtige Prüfungsprinzipien

- Subnetting basiert auf 2er-Potenzen
- Hosts = 2^(Hostbits) − 2
- Subnetze = 2^(Subnetbits)
- Longest Prefix Match entscheidet Routing
- Klassenmodell ist historisch, CIDR ist Standard
