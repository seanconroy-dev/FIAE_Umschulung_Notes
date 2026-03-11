---
title: "Port-Forwarding"
date: 2026-03-11
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Netzwerkadressierung und NAT"
topic: "Port-Forwarding"
level: "Grundlagen"
tags:
  - netzwerktechnik
  - nat
  - port-forwarding
  - router
  - firewall
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Port-Forwarding

## Kurzdefinition

**Port-Forwarding (Portweiterleitung)** ist eine Netzwerkfunktion eines Routers oder einer Firewall, bei der eingehender Datenverkehr auf einem bestimmten **externen Port** an einen **internen Host und Port** innerhalb eines privaten Netzwerks weitergeleitet wird.

Diese Technik wird meist im Zusammenhang mit **NAT (Network Address Translation)** verwendet, um Dienste innerhalb eines privaten Netzwerks aus dem Internet erreichbar zu machen.

---

## Grundprinzip

In den meisten Heim- und Unternehmensnetzwerken befinden sich Geräte in einem **privaten Netzwerk (LAN)** mit **privaten IP-Adressen**. Diese sind aus dem Internet **nicht direkt erreichbar**.

Der Router besitzt dagegen eine **öffentliche IP-Adresse**, über die das Netzwerk mit dem Internet kommuniziert.

Wenn ein externer Client einen Dienst im internen Netzwerk erreichen soll, muss der Router wissen:

- **welcher Port**
- **an welches interne Gerät**
- **auf welchen internen Port**

der Datenverkehr weitergeleitet werden soll.

Diese Zuordnung wird über **Port-Forwarding-Regeln** definiert.

---

## Netzwerkfluss bei Port-Forwarding

```mermaid
flowchart LR

Internet[Internet Client] -->|HTTP Request Port 80| Router[Router mit NAT]

Router -->|Weiterleitung Port 80| Server[Webserver 192.168.1.10:80]

Server --> Router
Router --> Internet
```

Ablauf:

1. Ein Client im Internet sendet eine Anfrage an die **öffentliche IP-Adresse** des Routers.
2. Der Router erkennt eine **Port-Forwarding-Regel**.
3. Der Router leitet die Anfrage an den **internen Server** weiter.
4. Der Server antwortet.
5. Der Router sendet die Antwort zurück an den externen Client.

---

## Aufbau einer Port-Forwarding-Regel

Eine typische Regel besteht aus mehreren Parametern:

| Parameter | Beschreibung |
|---|---|
| Externer Port | Port auf der öffentlichen Router-IP |
| Interne IP-Adresse | Zielgerät im lokalen Netzwerk |
| Interner Port | Port auf dem Zielgerät |
| Protokoll | TCP, UDP oder beide |
| Status | Regel aktiv oder deaktiviert |

### Beispiel

| Einstellung | Wert |
|---|---|
| Externer Port | 80 |
| Interne IP | 192.168.1.10 |
| Interner Port | 80 |
| Protokoll | TCP |

Bedeutung:

> Alle Anfragen an **öffentliche_IP:80** werden an **192.168.1.10:80** weitergeleitet.

---

## Praktisches Beispiel

Ein Computer im Heimnetz betreibt einen **Webserver**.

```
Webserver:
IP-Adresse: 192.168.1.10
Port: 80
```

Router-Konfiguration:

```
Port Forwarding Regel

Externer Port: 80
Interne IP: 192.168.1.10
Interner Port: 80
Protokoll: TCP
```

Ein Benutzer im Internet greift auf folgende Adresse zu:

```
http://öffentliche-ip-des-routers
```

Der Router leitet die Anfrage automatisch an den internen Webserver weiter.

---

## Typische Anwendungsfälle

### 1. Zugriff auf Webserver

Ein lokal betriebener Webserver wird aus dem Internet erreichbar gemacht.

Beispiel:

```
Internet → Router:80 → Webserver 192.168.1.10:80
```

---

### 2. Remote-Zugriff auf Systeme

Beispiele:

| Dienst | Standard-Port |
|---|---|
| SSH | 22 |
| Remote Desktop | 3389 |
| VNC | 5900 |

Beispiel:

```
Internet → Router:22 → Server 192.168.1.20:22
```

---

### 3. Online-Gaming

Viele Spiele benötigen offene Ports für:

- Matchmaking
- Peer-to-Peer-Verbindungen
- Hosting eines Spiels

Ohne Portweiterleitung kann ein Spieler oft **kein Spiel hosten**.

---

### 4. VPN-Server

Ein VPN-Server im Heim- oder Firmennetz muss von außen erreichbar sein.

Typische Ports:

| VPN | Port |
|---|---|
| OpenVPN | 1194 |
| WireGuard | 51820 |
| IPsec | 500 / 4500 |

---

## Sicherheit und Risiken

Port-Forwarding öffnet gezielt **Eingangspunkte in das interne Netzwerk**.

Deshalb entstehen potenzielle Sicherheitsrisiken.

### Risiken

- Angreifer können offene Ports scannen
- Schwache Dienste können kompromittiert werden
- Brute-Force-Angriffe auf Login-Dienste
- Exploits gegen ungepatchte Software

---

### Sicherheitsmaßnahmen

Empfohlene Maßnahmen:

| Maßnahme | Beschreibung |
|---|---|
| Nur notwendige Ports öffnen | Minimierung der Angriffsfläche |
| Starke Authentifizierung | z.B. SSH Keys statt Passwort |
| Firewall-Regeln | Zugriff einschränken |
| Regelmäßige Updates | Sicherheitslücken schließen |
| Nicht-Standard-Ports | reduziert automatisierte Angriffe |

---

## Einrichtung von Port-Forwarding (Allgemeiner Ablauf)

### 1. Router-Konfiguration öffnen

Im Browser:

```
http://192.168.1.1
```

oder

```
http://192.168.0.1
```

---

### 2. Port-Forwarding Menü öffnen

Mögliche Bezeichnungen:

- Port Forwarding
- Portweiterleitung
- NAT Rules
- Virtual Server

---

### 3. Neue Regel erstellen

Benötigte Angaben:

- externer Port
- interner Port
- interne IP-Adresse
- Protokoll (TCP/UDP)

---

### 4. Einstellungen speichern

Regel aktivieren und Routerkonfiguration speichern.

---

### 5. Funktion testen

Testmöglichkeiten:

- Zugriff von einem externen Netzwerk
- Online-Portscanner
- Tools wie:

```
nmap
```

Beispiel:

```bash
nmap -p 80 öffentliche-ip
```

---

## Zusammenhang mit NAT

Port-Forwarding ist eine **spezielle Form von NAT**.

Genauer gesagt:

**DNAT (Destination Network Address Translation)**

Dabei wird:

```
Ziel-IP + Ziel-Port
```

in

```
interne-IP + interner-Port
```

übersetzt.

---

## Prüfungsrelevanz (IHK)

Typische Prüfungsfragen:

### Definition

- Was ist Port-Forwarding?

### Funktionsweise

- Warum wird Port-Forwarding bei NAT benötigt?
- Wie funktioniert die Weiterleitung von Ports?

### Anwendung

- Beispiel: Webserver im Heimnetz erreichbar machen

### Sicherheit

- Welche Risiken entstehen durch offene Ports?
- Wie kann man diese Risiken minimieren?

---

## Typische Verständnisfehler

### Port ≠ Gerät

Ein Port identifiziert **einen Dienst**, nicht den Computer.

Beispiel:

```
192.168.1.10:80 → Webserver
192.168.1.10:22 → SSH
```

---

### Öffentlicher vs. interner Port

Diese müssen **nicht identisch sein**.

Beispiel:

| Externer Port | Interner Port |
|---|---|
| 8080 | 80 |

Bedeutung:

```
Internet → Router:8080 → Server:80
```

---

### Port-Forwarding ersetzt keine Sicherheit

Ein offener Port bedeutet:

> Der Dienst ist aus dem Internet erreichbar.

Wenn der Dienst unsicher ist, ist auch das Netzwerk gefährdet.

---

## Kurzmerksatz

> **Port-Forwarding ermöglicht den Zugriff aus dem Internet auf Dienste innerhalb eines privaten Netzwerks, indem Router eingehende Verbindungen gezielt an interne Geräte weiterleiten.**
