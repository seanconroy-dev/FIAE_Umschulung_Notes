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
author: "Sean Matthew Conroy"
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

Jedes TCP-Segment bekommt eine Nummer (Byte-orientiert):

```
Segment 1 → Seq 1000
Segment 2 → Seq 2000
Segment 3 → Seq 3000
```

Damit erkennt der Empfänger:

- Reihenfolge korrekt?
- Fehlt ein Segment?

---

## ACK – Bestätigung

```
ACK 3000
```

Bedeutung:

Der Empfänger erwartet als nächstes Byte **3000**.  
Alle Bytes bis **2999** wurden korrekt empfangen.

TCP verwendet **kumulative Bestätigungen**.

Fehlt ein Segment?  
→ Neuübertragung.

---

# 4️⃣ Flusskontrolle (Flow Control)

TCP verwendet das Empfangsfenster:

```
WIN = Window Size
```

Beispiel:

```
WIN = 65535 Bytes
```

Das bedeutet:

Der Sender darf bis zu 65535 Bytes senden,
bevor eine neue Bestätigung erforderlich ist.

Ziel:
Empfänger wird nicht überlastet.

---

# 5️⃣ MSS – Maximum Segment Size

Typischer Wert bei Ethernet:

Ethernet MTU: 1500 Bytes  
IP Header: 20 Bytes  
TCP Header: 20 Bytes  

```
1500 − 40 = 1460 Bytes MSS
```

MSS ≈ 1460 Bytes

Das ist die maximale Nutzdatenmenge pro TCP-Segment.

Wichtig:

- MSS wird beim Verbindungsaufbau ausgehandelt
- Window Size ist dynamisch
- Werte hängen vom Netzwerk ab

---

# 6️⃣ Staukontrolle (Congestion Control)

Wenn Paketverluste auftreten:

→ TCP interpretiert dies als Netzüberlastung  
→ Congestion Window (cwnd) wird reduziert  
→ Übertragungsrate sinkt  

Mechanismus:

Weniger erlaubte Daten im Netz  
→ Netz wird entlastet  
→ Übertragung stabilisiert sich  

Deshalb kann TCP langsamer wirken als UDP.

---

## 7️⃣ TCP Header – Aufbau

```
0                   15 16                  31
+--------------------+----------------------+
|     Source Port    |   Destination Port   |
+-------------------------------------------+
|              Sequence Number              |
+-------------------------------------------+
|           Acknowledgment Number           |
+----+---+-----------+----------------------+
|DOFF|Res| Flags (9) |     Window Size      |
+--------------------+----------------------+
|      Checksum      |    Urgent Pointer    |
+-------------------------------------------+
|      Options (optional, variable)         |
+-------------------------------------------+
|      Data (variable length)               |
+-------------------------------------------+
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
| ECE  | ECN Echo |
| CWR  | Congestion Window Reduced |
| NS   | ECN Nonce |

Insgesamt: 9 Bits.

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

Bei latenzkritischen Anwendungen:

- Online-Games
- VoIP
- Echtzeitkommunikation

Grund:

TCP wartet auf Bestätigungen  
→ zusätzliche Verzögerung

Dann oft besser geeignet:

→ UDP (keine Bestätigungen, geringere Latenz)

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

- 6x FF
- 16x MAC-Adresse

Netzwerkkarte erkennt das Muster  
→ Computer startet

---

## Voraussetzungen

- WoL im BIOS/UEFI aktiviert
- Netzwerkkarte unterstützt WoL
- Gerät hat Stromversorgung

---

## Protokolle für WoL

Meist:
```
UDP (Port 7 oder 9)
```

Andere Varianten möglich, aber nicht standardisiert.

---

## Sicherheitsrisiko

Falsch konfiguriert:

→ Unbefugte könnten Geräte starten

Absicherung:

- VPN
- Firewall-Regeln
- Kein direktes Port-Forwarding

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

So bleibt der Server erreichbar.

---

# 1️⃣3️⃣ Port Knocking

Sicherheitsmethode.

Server öffnet Port nur,
wenn bestimmte Port-Sequenz gesendet wird.

Beispiel:

```
7000 → 8000 → 9000
```

Danach wird z.B. SSH freigegeben.

Vorteil:

Server ist von außen nicht direkt sichtbar.

---

# 1️⃣4️⃣ Prüfungsrelevante Kernaussagen

- TCP ist verbindungsorientiert
- 3 Way Handshake
- Sequenznummern sichern Reihenfolge
- ACK ist kumulativ
- Window Size steuert Flusskontrolle
- MSS ergibt sich aus MTU − Header
- TCP reagiert auf Überlastung
- TCP ist nicht ideal für Echtzeit
- WoL nutzt Magic Packet
- DDNS löst dynamische IP-Probleme
- Port Knocking erhöht Sicherheit

---

# Kompakte Lernübersicht

```
Zuverlässig? → TCP
Geringe Latenz? → UDP
Fernstart? → WoL
IP wechselt? → DDNS
Server verstecken? → Port Knocking
```

---
