---
title: "TCP – Detailed & Graph Based"
date: 2026-02-25
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Transportprotokolle"
topic: "TCP, Header, WoL, DDNS, Port Knocking"
level: "Grundlagen – IHK relevant"
tags:
  - TCP
  - Header
  - 3-Way-Handshake
  - WoL
  - DDNS
  - Port Knocking
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Mittwoch, 2026-02-25_Netzwerktechnik_TRE

# 1️⃣ TCP – Grundidee

TCP ist:

- verbindungsorientiert  
- zuverlässig  
- kontrolliert  
- geordnet  

Es sorgt dafür, dass Daten:

✔ vollständig  
✔ in richtiger Reihenfolge  
✔ ohne Verlust  

übertragen werden.

---

# 2️⃣ Verbindungsaufbau – 3 Way Handshake

```
Client                         Server
   | -------- SYN ------------> |
   | <------- SYN+ACK --------- |
   | -------- ACK ------------> |
```

SYN  = Synchronize  
ACK  = Acknowledgment  

Erst danach beginnt die eigentliche Datenübertragung.

---

# 3️⃣ Sequenznummern & Bestätigung

## Sequenznummer

Jedes TCP-Segment bekommt eine Nummer:

```
Segment 1 → Seq 1000
Segment 2 → Seq 2000
Segment 3 → Seq 3000
```

So erkennt der Empfänger:

- Reihenfolge korrekt?
- Fehlt ein Paket?

---

## ACK – Bestätigung

```
ACK 3000
```

Bedeutung:
Alle Daten bis 3000 wurden korrekt empfangen.

Fehlt etwas?
→ Neuübertragung.

---

# 4️⃣ Flusskontrolle (Flow Control)

TCP verwendet:

```
WIN = Window Size
```

Beispiel:

```
WIN = 65535 Bytes
```

Das bedeutet:
Sender darf bis zu 65535 Bytes senden,
bevor eine neue Bestätigung nötig ist.

Schutz:
→ Empfänger wird nicht überlastet.

---

# 5️⃣ MSS – Maximum Segment Size

Typischer Wert bei Ethernet:

```
MSS ≈ 1460 Bytes
```

Das ist die maximale Nutzdatenmenge
pro TCP-Segment.

Wichtig:

- MSS kann dynamisch angepasst werden
- Window Size ebenfalls
- Werte hängen vom Netzwerk ab

Diese Zahlen dienen nur zum Verständnis.

---

# 6️⃣ Staukontrolle (Congestion Control)

Wenn Netzwerk überlastet ist:

- TCP reduziert Geschwindigkeit
- Sendefenster wird verkleinert
- Übertragung wird angepasst

Deshalb kann TCP langsamer wirken.

---

# 7️⃣ TCP Header – Aufbau (grafisch)

```
----------------------------------------------------------------
| Source Port (16 Bit) | Destination Port (16 Bit)            |
----------------------------------------------------------------
| Sequence Number (32 Bit)                                     |
----------------------------------------------------------------
| Acknowledgment Number (32 Bit)                                |
----------------------------------------------------------------
| Data Offset | Reserved | Flags | Window Size                 |
----------------------------------------------------------------
| Checksum | Urgent Pointer                                     |
----------------------------------------------------------------
| Options (optional)                                            |
----------------------------------------------------------------
| Data (variable Länge)                                         |
----------------------------------------------------------------
```

---

# 8️⃣ TCP Flags – Bedeutung

| Flag | Bedeutung |
|------|-----------|
| SYN  | Verbindung starten |
| ACK  | Bestätigung gültig |
| FIN  | Verbindung beenden |
| RST  | Verbindung zurücksetzen |
| PSH  | Daten sofort weitergeben |
| URG  | Urgent Pointer ist relevant |

---

# 9️⃣ Multiplexing

TCP nutzt Ports:

```
IP + Port = Socket
```

Beispiel:

```
Client: 192.168.1.10:53000
Server: 192.168.1.20:80
```

Mehrere Anwendungen können gleichzeitig kommunizieren.

---

# 🔟 Wann ist TCP ungeeignet?

Bei:

- Online-Games
- Video-Streaming
- VoIP
- Echtzeitkommunikation

Warum?

TCP wartet auf Bestätigung.
Das erzeugt Verzögerung.

Dann besser:
→ UDP

---

# 1️⃣1️⃣ Wake on LAN (WoL)

Ziel:
Computer aus der Ferne einschalten.

---

## Ablauf

```
Admin-PC ---- Magic Packet ----> Ziel-PC
```

Magic Packet enthält:

- MAC-Adresse
- spezielle Datenstruktur

Netzwerkkarte erkennt das Muster
→ Computer startet

---

## Voraussetzungen

- WoL im BIOS aktiviert
- Netzwerkkarte unterstützt WoL
- Gerät hat Stromversorgung

---

## Protokolle für WoL

Meist:
```
UDP
```

Möglich:
- TCP
- ICMP

Nicht jedes Netzwerk erlaubt das.

---

## Sicherheitsrisiko

Falsch konfiguriert:

→ Unbefugte können Geräte starten

Lösungen:

- VPN
- Firewall
- sichere Netzstruktur

---

# 1️⃣2️⃣ Dynamic DNS (DDNS)

Problem:

Internetanschluss hat dynamische IP.

```
Heute: 84.100.50.1
Morgen: 91.77.23.99
```

Lösung:

DDNS aktualisiert automatisch:

```
meinserver.ddns.net → aktuelle IP
```

So bleibt das Gerät erreichbar.

---

# 1️⃣3️⃣ Port Knocking

Sicherheitsmethode.

Server öffnet Port nur,
wenn bestimmte Port-Sequenz geklopft wird.

Beispiel:

```
7000 → 8000 → 9000
```

Danach wird SSH geöffnet.

Vorteil:

→ Server ist von außen unsichtbar.

---

# 1️⃣4️⃣ Prüfungsrelevante Kernaussagen

- TCP ist verbindungsorientiert
- 3 Way Handshake
- Sequenznummern sichern Reihenfolge
- ACK bestätigt Empfang
- Window Size steuert Flusskontrolle
- MSS bestimmt Segmentgröße
- TCP passt Geschwindigkeit an
- TCP ≠ ideal für Echtzeit
- WoL nutzt Magic Packet
- DDNS löst dynamische IP-Probleme
- Port Knocking erhöht Sicherheit

---

# Kompakte Lernübersicht

```
Zuverlässig? → TCP
Schnell? → UDP
Fernstart? → WoL
IP wechselt? → DDNS
Server verstecken? → Port Knocking
```

---
