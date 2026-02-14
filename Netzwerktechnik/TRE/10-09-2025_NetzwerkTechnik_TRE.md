---
title: "Spanning Tree Protocol (STP/RSTP) & PoE – Grundlagen und Berechnung"
date: 2025-09-10
weekday: "Mittwoch"
subject: "Netzwerktechnik"
instructor: "TRE"
program: "FIAE Umschulung 2025-2027"
module: "Switching & Redundanz"
topic: "STP, RSTP, Bridge-ID, Path-Cost, Redundanz, PoE"
level: "Grundlagen"
tags:
  - STP
  - RSTP
  - Bridge-ID
  - Root-Bridge
  - Path-Cost
  - Redundanz
  - PoE
  - Netzwerktechnik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# STP / RSTP – 2025-09-10 (NT, TRE)

## Spanning Tree Protocol (STP / RSTP)

---

## MAC-Adresse

- 48 Bit (6 Byte)
- Aufbau: OUI (Herstellerkennung, 24 Bit) + geraetespezifischer Anteil (24 Bit)
- Beispiel: 11-11-11-11-11-11

Hinweis:
Eine kleinere MAC-Adresse bedeutet nicht „aelter“, sondern nur eine niedrigere numerische Kennung.

---

## Root-Bridge

Die Root-Bridge ist der Switch mit der kleinsten Bridge-ID.

Bridge-ID besteht aus:
- Prioritaet (Standard: 32768)
- MAC-Adresse

Regel:
1. Niedrigste Prioritaet gewinnt.
2. Bei gleicher Prioritaet entscheidet die kleinste MAC-Adresse.

Die Root-Bridge ist Referenzpunkt fuer alle Pfadberechnungen.

---

## Funktionsprinzip von STP

Problem:
Redundante Verbindungen erzeugen Layer-2-Loops → Broadcast-Sturm.

Loesung:
STP deaktiviert automatisch bestimmte Ports, um eine logische Baumstruktur zu erzeugen.

Ring → Baum:

```
Vorher (Loop):                 Nachher (Baumstruktur):

   [S1]──[S2]──[S3]                [S1]──[S2]──[S3]
     │           |        →           │
    [S4]---------|                   [S4]
```

Blockierte Ports bleiben als Backup erhalten.

RSTP (Rapid STP):
Schnellere Konvergenz im Vergleich zu klassischem STP.

---

## Path Cost (Kostenberechnung)

Pfadkosten bestimmen den bevorzugten Weg zur Root-Bridge.

Moderne IEEE-Standardwerte (Kurzwerte):

- 10 Mbit/s → 100
- 100 Mbit/s → 19
- 1 Gbit/s → 4
- 10 Gbit/s → 2
- 100 Gbit/s → 1

Hinweis:
Fruehere Berechnungen mit 20.000.000/Bandbreite waren alte Referenzwerte.
Heute werden standardisierte Cost-Werte verwendet.

Regel:
Der Pfad mit den niedrigsten Gesamtkosten gewinnt.

---

## Beispiel

Gegeben:
- 3 Verbindungen mit 1 Gbit/s (Cost 4)
- 1 Verbindung mit 100 Mbit/s (Cost 19)

Ergebnis:
Der 100-Mbit/s-Link wird blockiert, da er hoehere Kosten verursacht.

STP erzeugt eine schleifenfreie Topologie.

---

## Redundanz

Ziel:
Ausfallsicherheit durch alternative Pfade.

Ablauf:
- Ein Link faellt aus.
- STP aktiviert zuvor blockierten Port.
- Neue Baumstruktur wird berechnet.

Einsatz:
Unternehmensnetze, Rechenzentren, Cloud-Umgebungen.

---

## Power over Ethernet (PoE)

Definition:
Uebertragung von Daten und Strom ueber dasselbe Ethernet-Kabel.

Einsatz:
- IP-Kameras
- Access Points
- VoIP-Telefone

Vorteil:
Kein separates Netzteil erforderlich.

Skizze:

```
 [PoE-Switch]───(Daten + Strom)───[IP-Kamera]
        │
        └── 230 V Netzversorgung
```

---

## Elektrotechnik – Wiederholung

Blindwiderstand eines Kondensators:
Xc = 1 / (2 * pi * f * C)

Leistung:
P = U * I

Wechselspannung:
Relevanz bei Netzteilen und PoE-Versorgung.

---

## Kernaussagen

- STP verhindert Layer-2-Schleifen.
- Root-Bridge = kleinste Bridge-ID.
- Niedrigste Path-Cost bestimmt den aktiven Pfad.
- RSTP konvergiert schneller als klassisches STP.
- PoE kombiniert Daten und Strom ueber Ethernet.

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 10.09.2025 mit TRE.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 10.09.2025.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
