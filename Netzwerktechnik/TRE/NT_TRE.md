### 09.07.2025_Netzwerktechnik/TRE

Projekt: NetzwerktechnikGrundlagen

# Netzwerktechnik Notizen – 09.07.2025

## Allgemeine Hinweise

- **Sparsam mit dem Internet sein** – bewusster Umgang mit Netzressourcen, speziell bei limitierter Bandbreite.
- **Kochbuch** – begleitende Unterlage zum Kursinhalt.
- **WuT PDFs** – dienen als fachliche Referenz.

## Schichtmodell (vereinfacht, 4 Schichten)

| Schicht    | Beispiele                  | Beschreibung                               |
| ---------- | -------------------------- | ------------------------------------------ |
| Anwendung  | HTTPS, SMTP, DNS           | Programme und Dienste, die du direkt nutzt |
| Transport  | TCP, UDP, SCTP             | Datenübertragung zwischen Geräten          |
| Internet   | IP (IPv4/6), ICMP          | Adressierung und Weiterleitung             |
| Netzzugang | Ethernet, Token Ring, FDDI | Physische Verbindung zum Netzwerk          |

→ Vorteil: **Modularität**, Schichten können unabhängig ausgetauscht werden.

## OSI-Modell (7 Schichten)

- **7 Anwendung** – z. B. Browser, Mailprogramm
- **6 Darstellung** – Formatierung & Verschlüsselung
- **5 Sitzung** – Verbindungsmanagement
- **4 Transport** – TCP/UDP, zuverlässige Übertragung
- **3 Vermittlung** – IP-Adressen, Routing
- **2 Sicherung** – MAC-Adressen, Fehlererkennung
- **1 Bitübertragung** – physikalische Datenübertragung (z. B. Kabel)

  _Merkhilfe:_ Alle Deutschen Saufen Tequila, Vor dem Studium besser nicht!

## Was ist ein Netzwerk?

- Verbindung mehrerer Geräte zur Kommunikation & Ressourcennutzung
- Beispiele: Druckerfreigabe, Internetzugang, Dateiübertragung

## Netzwerk-Topologien

| Typ    | Beschreibung                                   |
| ------ | ---------------------------------------------- |
| Bus    | Eine Leitung für alle – störanfällig, veraltet |
| Ring   | Daten wandern im Kreis – z. B. Token Ring      |
| Stern  | Zentral (Switch) – heute am häufigsten         |
| Masche | Redundante Pfade – hohe Ausfallsicherheit      |

## Übertragungsarten

- **Simplex** – nur in eine Richtung (z. B. Radio)
- **Halbduplex** – abwechselnd (z. B. Walkie-Talkie)
- **Vollduplex** – gleichzeitig in beide Richtungen (z. B. Telefon)

## Übertragungsmedien

- **Kupferkabel** (Twisted Pair, Koaxial)
- **Glasfaser**
- **Funk** (WLAN, Bluetooth)
- **Powerline** (Stromnetz)

## Geräte

| Gerät        | Funktion                                          |
| ------------ | ------------------------------------------------- |
| Router       | Verbindet Netzwerke (z. B. Heimnetz mit Internet) |
| Switch       | Leitet gezielt weiter – intelligenter Hub         |
| Hub          | Veraltet – sendet an alle Ports                   |
| Access Point | WLAN-Zugangspunkt                                 |

## IP-Adressen

- **IPv4**: z. B. `192.168.0.1`
- **IPv6**: z. B. `fe80::1a2b:3c4d:5e6f:7g8h`
- Unterteilung: **Netzanteil** / **Hostanteil**
- **Private IPv4-Bereiche**:
  - 10.0.0.0 – 10.255.255.255
  - 172.16.0.0 – 172.31.255.255
  - 192.168.0.0 – 192.168.255.255

## MAC-Adresse

- Einzigartige Hardware-Adresse der Netzwerkkarte
- 48 Bit = 6 Byte, z. B. `00-14-22-01-23-45`

## Protokolle

- **TCP** – verbindungsorientiert, zuverlässig
- **UDP** – verbindungslos, schnell, weniger sicher
- **HTTP/HTTPS, FTP, DNS, DHCP** – Applikationsprotokolle

## Netzwerkanalyse

- Tools: `ping`, `tracert`, `ipconfig`, `nslookup`
- Analyse: Routen, Antwortzeiten, DNS, IP-Zuweisung

## Grundlagen Verkabelung

- T568A / T568B Farbcode
- RJ45-Pinbelegung
- Unterschied Patch- vs. Crossover-Kabel

## Signalstörungen

- **Dämpfung**
- **Crosstalk** (Übersprechen)
- **EMI** (elektromagnetische Interferenzen)
- Lösungen: **Schirmung**, **Twisted-Pair**

## Operatorpräzedenz – Beispiel

```java
System.out.println(true || false && false);   // ergibt true
System.out.println((true || false) && false); // ergibt false
```

→ `&&` hat höhere Priorität als `||`. Klammern beeinflussen das Ergebnis.

## Ergänzende Quellen

- [WuT: Switched Ethernet Grundlagen (PDF)](https://www.wut.de/download/print/e-58www-20-prde-000.pdf)

- [WuT: Was ist Ethernet? (PDF)](https://www.wut.de/download/print/e-58www-11-prde-000.pdf)

---

---

Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck. Diese Notizen sind öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und für Dritte zur Orientierung.

**Unterricht bei:** TRE (BFW Mühlenbeck, FIAE Umschulung)  
**Quelle:** Eigene Mitschrift & Unterrichtsfolien vom 09.07.2025  
**Autor:** Sean Conroy  
**Lizenz:** CC BY-NC-SA 4.0
