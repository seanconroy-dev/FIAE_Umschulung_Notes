---
title: "TCP - Detailed & Graph Based"
date: 2026-02-25
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Transportprotokolle"
topic: "TCP, Header, WoL, DDNS, Port Knocking"
level: "Grundlagen - IHK relevant"
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

# TCP - Detailed & Graph Based

## Kurzüberblick

TCP steht für **Transmission Control Protocol**.

Es ist ein verbindungsorientiertes und zuverlässiges Transportprotokoll der OSI-Schicht 4.

TCP sorgt dafür, dass Daten vollständig, geordnet und überprüfbar zwischen zwei Kommunikationspartnern übertragen werden.

## Kernerklärung

### 1. TCP - Grundidee

TCP ist:

- verbindungsorientiert
- zuverlässig
- kontrolliert
- geordnet

Es sorgt dafür, dass Daten:

- vollständig übertragen werden
- in richtiger Reihenfolge ankommen
- bei Verlust erneut gesendet werden
- durch Bestätigungen kontrolliert werden

TCP wird verwendet, wenn Zuverlässigkeit wichtiger ist als maximale Geschwindigkeit.

Typische Beispiele:

- HTTP
- HTTPS
- FTP
- SMTP
- SSH

### 2. Verbindungsaufbau - 3-Way-Handshake

Bevor TCP Daten überträgt, wird zuerst eine Verbindung aufgebaut.

Ablauf:

    Client                         Server
       | -------- SYN ------------> |
       | <------- SYN+ACK --------- |
       | -------- ACK ------------> |

Bedeutung:

| Schritt | Nachricht | Bedeutung |
|---|---|---|
| 1 | SYN | Client möchte Verbindung starten |
| 2 | SYN+ACK | Server bestätigt und möchte ebenfalls synchronisieren |
| 3 | ACK | Client bestätigt die Antwort des Servers |

Erst danach beginnt die eigentliche Datenübertragung.

Wichtige Begriffe:

| Begriff | Bedeutung |
|---|---|
| SYN | Synchronize |
| ACK | Acknowledgment, also Bestätigung |

### 3. Sequenznummern und Bestätigungen

TCP arbeitet mit Sequenznummern.

Jedes TCP-Segment bekommt eine Nummer. Diese Nummer bezieht sich auf die übertragenen Bytes.

Beispiel:

    Segment 1 -> Seq 1000
    Segment 2 -> Seq 2000
    Segment 3 -> Seq 3000

Damit erkennt der Empfänger:

- ob die Reihenfolge korrekt ist
- ob ein Segment fehlt
- welche Daten bereits angekommen sind
- welche Daten erneut übertragen werden müssen

### 4. ACK - Bestätigung

Ein ACK bestätigt den Empfang von Daten.

Beispiel:

    ACK 3000

Bedeutung:

Der Empfänger erwartet als nächstes Byte **3000**.

Alle Bytes bis **2999** wurden korrekt empfangen.

TCP verwendet **kumulative Bestätigungen**.

Das bedeutet:

Nicht jedes einzelne Segment muss separat bestätigt werden. Stattdessen bestätigt TCP immer bis zu dem nächsten erwarteten Byte.

Wenn ein Segment fehlt, wird es erneut übertragen.

### 5. Flusskontrolle - Flow Control

TCP nutzt Flusskontrolle, damit der Empfänger nicht überlastet wird.

Dafür verwendet TCP das Empfangsfenster.

Begriff:

    WIN = Window Size

Beispiel:

    WIN = 65535 Bytes

Das bedeutet:

Der Sender darf bis zu 65535 Bytes senden, bevor eine neue Bestätigung erforderlich ist.

Ziel:

- Empfänger schützen
- Überlastung vermeiden
- Datenübertragung kontrollieren
- Speicherpuffer des Empfängers berücksichtigen

Die Window Size kann sich während der Verbindung ändern.

### 6. MSS - Maximum Segment Size

MSS steht für **Maximum Segment Size**.

Die MSS beschreibt die maximale Nutzdatenmenge pro TCP-Segment.

Typischer Wert bei Ethernet:

| Bestandteil | Größe |
|---|---:|
| Ethernet MTU | 1500 Bytes |
| IP Header | 20 Bytes |
| TCP Header | 20 Bytes |
| Verfügbare Nutzdaten | 1460 Bytes |

Rechnung:

    1500 - 20 - 20 = 1460 Bytes

Kurzform:

    MSS ≈ 1460 Bytes

Wichtig:

- MSS wird beim Verbindungsaufbau ausgehandelt
- Window Size ist dynamisch
- Werte hängen vom Netzwerk ab
- MSS betrifft die Nutzdaten im TCP-Segment
- MTU betrifft die maximale Paketgröße auf der Netzwerkschicht beziehungsweise Verbindungsebene

### 7. Staukontrolle - Congestion Control

TCP besitzt Mechanismen zur Staukontrolle.

Wenn Paketverluste auftreten, interpretiert TCP dies häufig als Hinweis auf Netzüberlastung.

Ablauf:

- Paketverlust tritt auf
- TCP erkennt ein Problem
- Congestion Window, kurz cwnd, wird reduziert
- Sender darf weniger Daten gleichzeitig senden
- Übertragungsrate sinkt
- Netzwerk wird entlastet
- Verbindung stabilisiert sich

Vereinfachte Darstellung:

    Paketverlust
        -> TCP vermutet Überlastung
        -> cwnd wird kleiner
        -> weniger Daten gleichzeitig im Netz
        -> Netz wird entlastet

Deshalb kann TCP langsamer wirken als UDP.

TCP priorisiert Zuverlässigkeit und Stabilität.

### 8. TCP Header - Aufbau

Vereinfachter Aufbau eines TCP-Headers:

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

Wichtige Felder:

| Feld | Bedeutung |
|---|---|
| Source Port | Port des Senders |
| Destination Port | Port des Empfängers |
| Sequence Number | Nummer des gesendeten Bytes |
| Acknowledgment Number | Nächstes erwartetes Byte |
| Flags | Steuerbits wie SYN, ACK oder FIN |
| Window Size | Empfangsfenster für die Flusskontrolle |
| Checksum | Fehlererkennung |
| Urgent Pointer | Verweis auf dringende Daten, falls URG gesetzt ist |
| Options | Zusätzliche TCP-Optionen |
| Data | Nutzdaten |

### 9. TCP Flags - Bedeutung

TCP verwendet Flags zur Steuerung der Verbindung.

| Flag | Bedeutung |
|---|---|
| SYN | Verbindung starten |
| ACK | Bestätigung gültig |
| FIN | Verbindung beenden |
| RST | Verbindung zurücksetzen |
| PSH | Daten sofort an die Anwendung weitergeben |
| URG | Urgent Pointer ist relevant |
| ECE | ECN Echo |
| CWR | Congestion Window Reduced |
| NS | ECN Nonce |

Insgesamt werden 9 Bits für TCP-Flags verwendet.

Prüfungsrelevant sind besonders:

- SYN
- ACK
- FIN
- RST

### 10. Multiplexing

TCP nutzt Ports, damit mehrere Anwendungen gleichzeitig über ein Netzwerk kommunizieren können.

Grundidee:

    IP + Port = Socket

Beispiel:

    Client: 192.168.1.10:53000
    Server: 192.168.1.20:80

Die IP-Adresse identifiziert den Host.

Der Port identifiziert den Dienst oder das Programm auf diesem Host.

Dadurch kann ein Computer gleichzeitig mehrere Verbindungen verwalten.

Beispiele:

| Dienst | Typischer Port |
|---|---:|
| HTTP | 80 |
| HTTPS | 443 |
| SSH | 22 |
| SMTP | 25 |
| FTP | 20 / 21 |

### 11. Wann ist TCP ungeeignet?

TCP ist nicht ideal für Anwendungen, bei denen sehr geringe Latenz wichtiger ist als vollständige Zuverlässigkeit.

Beispiele:

- Online-Games
- VoIP
- Echtzeitkommunikation
- Live-Streaming mit niedriger Latenz

Grund:

TCP wartet auf Bestätigungen.

Dadurch können zusätzliche Verzögerungen entstehen.

In solchen Fällen ist oft UDP besser geeignet.

UDP hat:

- keinen Verbindungsaufbau
- keine Bestätigungspflicht
- weniger Overhead
- geringere Latenz

Dafür garantiert UDP keine Zustellung und keine Reihenfolge.

### 12. Wake on LAN - WoL

Wake on LAN, kurz WoL, dient dazu, einen Computer aus der Ferne einzuschalten.

Grundidee:

    Admin-PC ---- Magic Packet ----> Ziel-PC

Das Zielgerät wird durch ein sogenanntes Magic Packet geweckt.

### 13. Magic Packet

Ein Magic Packet enthält ein bestimmtes Muster.

Typischer Aufbau:

- 6x FF
- 16x MAC-Adresse des Zielgeräts

Vereinfachte Darstellung:

    FF FF FF FF FF FF
    MAC MAC MAC MAC MAC MAC
    MAC MAC MAC MAC MAC MAC
    MAC MAC MAC MAC

Die Netzwerkkarte erkennt dieses Muster.

Wenn Wake on LAN aktiviert ist, startet der Computer.

### 14. Voraussetzungen für Wake on LAN

Damit WoL funktioniert, müssen mehrere Bedingungen erfüllt sein:

- WoL ist im BIOS oder UEFI aktiviert
- Netzwerkkarte unterstützt WoL
- Gerät hat Stromversorgung
- Betriebssystem beziehungsweise Netzwerktreiber unterstützt WoL
- Netzwerk leitet das Magic Packet korrekt weiter

### 15. Protokolle für Wake on LAN

Wake on LAN wird häufig über UDP verwendet.

Typische Ports:

| Port | Verwendung |
|---|---|
| UDP 7 | Echo, häufig für WoL genutzt |
| UDP 9 | Discard, häufig für WoL genutzt |

Wichtig:

Diese Ports sind häufige Praxis, aber WoL ist nicht auf genau diese Ports beschränkt.

Andere Varianten sind möglich.

### 16. Sicherheitsrisiko bei Wake on LAN

Wake on LAN kann ein Sicherheitsrisiko sein, wenn es falsch konfiguriert ist.

Problem:

Unbefugte könnten versuchen, Geräte aus der Ferne zu starten.

Mögliche Absicherung:

- VPN verwenden
- Firewall-Regeln einrichten
- kein direktes Port-Forwarding aus dem Internet
- WoL nur im internen Netz erlauben
- Broadcasts aus dem Internet vermeiden

### 17. Dynamic DNS - DDNS

DDNS steht für **Dynamic DNS**.

Es löst ein Problem bei Internetanschlüssen mit dynamischer IP-Adresse.

Problem:

Die öffentliche IP-Adresse kann sich ändern.

Beispiel:

    Heute: 84.100.50.1
    Morgen: 91.77.23.99

Wenn ein Server zuhause betrieben wird, wäre er nach einem IP-Wechsel nicht mehr unter der alten Adresse erreichbar.

Lösung:

DDNS aktualisiert automatisch den DNS-Eintrag.

Beispiel:

    meinserver.ddns.net -> aktuelle öffentliche IP-Adresse

Dadurch bleibt der Server über denselben Namen erreichbar, obwohl sich die IP-Adresse ändern kann.

### 18. Port Knocking

Port Knocking ist eine Sicherheitsmethode.

Dabei bleibt ein Dienst zunächst von außen geschlossen.

Ein Port wird erst geöffnet, wenn vorher eine bestimmte Port-Sequenz gesendet wurde.

Beispiel:

    7000 -> 8000 -> 9000

Danach wird zum Beispiel SSH freigegeben.

Vereinfachter Ablauf:

    1. Client sendet Knock-Sequenz
    2. Server erkennt die richtige Reihenfolge
    3. Firewall öffnet temporär den gewünschten Port
    4. Client kann sich verbinden
    5. Port wird später wieder geschlossen

Vorteil:

Der Dienst ist von außen nicht direkt sichtbar.

Nachteil:

Port Knocking ersetzt keine saubere Authentifizierung.

Es ist nur eine zusätzliche Schutzmaßnahme.

## Prüfungsrelevante Kernaussagen

- TCP gehört zur Transportschicht, also OSI-Schicht 4.
- TCP ist verbindungsorientiert.
- TCP verwendet den 3-Way-Handshake.
- TCP nutzt Sequenznummern zur Sicherung der Reihenfolge.
- ACK bestätigt empfangene Daten.
- ACKs sind bei TCP kumulativ.
- Window Size steuert die Flusskontrolle.
- MSS ergibt sich aus MTU minus Header.
- TCP reagiert auf Überlastung durch Staukontrolle.
- TCP ist nicht ideal für Echtzeitanwendungen mit sehr geringer Latenz.
- UDP ist oft besser geeignet, wenn Geschwindigkeit wichtiger ist als garantierte Zustellung.
- Wake on LAN nutzt ein Magic Packet.
- DDNS löst Probleme mit dynamischen öffentlichen IP-Adressen.
- Port Knocking kann Dienste zusätzlich verstecken.
- Port Knocking ersetzt keine sichere Anmeldung.

## Kompakte Lernübersicht

| Frage | Antwort |
|---|---|
| Zuverlässige Übertragung? | TCP |
| Geringe Latenz? | UDP |
| Verbindung starten? | 3-Way-Handshake |
| Reihenfolge sichern? | Sequenznummern |
| Empfang bestätigen? | ACK |
| Empfänger schützen? | Window Size |
| Maximale Nutzdaten pro Segment? | MSS |
| Fernstart eines PCs? | Wake on LAN |
| IP-Adresse wechselt? | DDNS |
| Serverdienst verstecken? | Port Knocking |

## Merksätze

TCP ist wie ein Einschreiben mit Rückschein.

UDP ist wie eine Postkarte.

Ports sagen dem System, welches Programm die Daten bekommen soll.

IP-Adresse und Port ergeben zusammen einen Socket.

DDNS hält einen Namen aktuell, auch wenn sich die IP-Adresse ändert.

Port Knocking versteckt einen Dienst, öffnet ihn aber nur nach der richtigen Sequenz.

## Begriffe

| Begriff | Bedeutung |
|---|---|
| TCP | Zuverlässiges, verbindungsorientiertes Transportprotokoll |
| UDP | Schnelles, verbindungsloses Transportprotokoll |
| SYN | Startet eine TCP-Verbindung |
| ACK | Bestätigt empfangene Daten |
| FIN | Beendet eine TCP-Verbindung |
| RST | Setzt eine TCP-Verbindung zurück |
| Sequenznummer | Nummeriert Datenbytes zur Reihenfolgekontrolle |
| Window Size | Empfangsfenster zur Flusskontrolle |
| MSS | Maximale Nutzdatenmenge pro TCP-Segment |
| MTU | Maximale Paketgröße auf einem Netzwerkabschnitt |
| WoL | Wake on LAN, Fernstart eines Geräts |
| Magic Packet | Spezielles Datenpaket zum Aufwecken eines Geräts |
| DDNS | Dynamische Aktualisierung eines DNS-Eintrags |
| Port Knocking | Öffnen eines Ports nach geheimer Port-Sequenz |

## Zusammenfassung

TCP ist ein zuverlässiges Transportprotokoll der OSI-Schicht 4.

Es baut vor der Datenübertragung eine Verbindung über den 3-Way-Handshake auf.

Mithilfe von Sequenznummern, ACKs, Window Size, Fehlererkennung und Staukontrolle sorgt TCP für eine stabile und geordnete Datenübertragung.

TCP eignet sich besonders für Anwendungen, bei denen Vollständigkeit und Reihenfolge wichtig sind.

Für Echtzeitanwendungen mit niedriger Latenz ist UDP oft besser geeignet.

Wake on LAN ermöglicht das Einschalten eines Rechners über ein Magic Packet.

DDNS sorgt dafür, dass ein System trotz wechselnder öffentlicher IP-Adresse erreichbar bleibt.

Port Knocking kann Dienste zusätzlich schützen, indem Ports erst nach einer bestimmten Sequenz geöffnet werden.

---

Quelle: Eigene Unterrichtsnotizen, FIAE Umschulung 2025-2027
