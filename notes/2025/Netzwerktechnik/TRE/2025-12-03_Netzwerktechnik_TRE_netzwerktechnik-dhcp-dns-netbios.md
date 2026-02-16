---
title: "Netzwerktechnik – DHCP, DNS & NetBIOS"
date: 2025-12-03
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "IP-Adressierung & Namensauflösung"
topic: "DHCP (DORA), DNS, NetBIOS, Broadcast"
level: "Grundlagen"
tags:
  - DHCP
  - DNS
  - NetBIOS
  - DORA
  - Namensauflösung
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-12-03_NT_TRE

---

## DHCP – Dynamic Host Configuration Protocol

DHCP dient der automatischen Vergabe von:

- IP-Adresse
- Subnetzmaske
- Standardgateway
- DNS-Server
- Lease-Time

---

## Ablauf der IP-Vergabe – DORA

```mermaid
sequenceDiagram
    autonumber
    participant C as DHCP-Client
    participant S as DHCP-Server

    Note right of S: DHCP-SERVER-Konfiguration:<br/>IP-Adresse: 192.168.1.11<br/>IP-Range: 192.168.1.151 ... 192.168.1.240<br/>Subnetzmaske: /24<br/>Standardgateway: 192.168.1.1<br/>DNS-Server: 192.168.10.200<br/>Lease-Time: 600 Sekunden

    C->>S: DISCOVER<br/>QIP: 0.0.0.0<br/>ZIP: 255.255.255.255<br/>"brauche IP-Adresse"
    S-->>C: OFFER<br/>QIP: 192.168.1.11<br/>ZIP: 255.255.255.255<br/>"192.168.1.151"
    C->>C: ARP-REQUEST<br/>Wer hat 192.168.1.151?
    C->>S: REQUEST<br/>QIP: 0.0.0.0<br/>ZIP: 255.255.255.255<br/>"nehme an"
    S-->>C: ACK<br/>QIP: 192.168.1.11<br/>ZIP: 255.255.255.255<br/>"Lease-Time läuft"

    Note over C,S: D O R A
```

### DORA steht für:
- **Discover**
- **Offer**
- **Request**
- **Acknowledge**

Wichtig:
- Kommunikation erfolgt initial per Broadcast
- Lease-Time bestimmt Gültigkeitsdauer der IP-Adresse

---

# Namensauflösung – DNS & NetBIOS

Menschen merken sich Namen besser als IP-Adressen.  
Ziel: **Name → IP-Adresse auflösen**

---

## DNS (Domain Name System)

```mermaid
flowchart TD
    A["Host/Server hat Namen"] --> B["Namensauflösung notwendig"]
    B --> C{"DNS-Name (FQDN) vorhanden?"}
    C -->|Ja| D["DNS-Anfrage<br/>z.B. nslookup www.heise.de"]
    C -->|Nein| E["Alternative: NetBIOS"]
```

### Eigenschaften
- Weltweit skalierbar
- Hierarchisch aufgebaut
- Funktioniert internetweit
- Unterstützt IPv4 & IPv6

---

## NetBIOS-Name

NetBIOS ist ein älteres Namenssystem im lokalen Netzwerk.

### Eigenschaften
- Maximal 15 Zeichen
- Erlaubte Zeichen:
  - a–z
  - A–Z
  - 0–9
  - -
- Nur innerhalb einer Broadcast-Domain nutzbar
- Nicht internetfähig

---

### NetBIOS-Namensauflösung

```mermaid
flowchart TD
    A[Computer-Name] --> B[NetBIOS-Name]
    B --> C[Auflösung]
    C --> D[Broadcast: Wer ist Server-1?]
    C --> E["LMHOSTS-Datei (veraltet)"]
    C --> F["WINS-Server (veraltet)"]
```

Wichtig:
- Broadcast erzeugt Netzwerklast
- WINS war zentrale Lösung für größere Netze
- Heute fast vollständig durch DNS ersetzt

---

# Netzwerkstruktur-Beispiel

```mermaid
flowchart TD

    subgraph NETZ_33[33.0 Netz]
        PC01_33[PC01]
        PC11_33[PC11]
        SW33[Switch/Router]
        PC01_33 --> SW33
        PC11_33 --> SW33
    end

    subgraph NETZ_21[21.0 Netz]
        PC01_21[PC01]
        PC11_21[PC11]
        SW21[Switch/Router]
        PC01_21 --> SW21
        PC11_21 --> SW21
    end

    SW33 --> MAIN_SW[Switch]
    SW21 --> MAIN_SW

    MAIN_SW --> PROXY[Proxy]
    PROXY --> ISP[ISP]

    NBT[NetBIOS Traffic]
    NBT -.-> PROXY
```

---

## Prüfungsrelevante Kernaussagen

- DHCP arbeitet nach DORA
- Erste DHCP-Kommunikation erfolgt per Broadcast
- 1:N-Beziehung DHCP-Server → Clients
- DNS ist hierarchisch und internetfähig
- NetBIOS ist broadcastbasiert und lokal
- Broadcast funktioniert nicht über Router hinweg
- Lease-Time bestimmt Gültigkeit einer IP
- ARP prüft IP-Konflikte

