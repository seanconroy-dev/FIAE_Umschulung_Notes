---
title: "Linux/Unix – Befehle & Navigation"
date: 2025-07-23
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Navigation & Dateiverwaltung"
level: "Grundlagen"
tags:
  - Linux
  - Unix
  - Shell
  - Navigation
  - Dateiverwaltung
  - CLI
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-07-23_BS_WED

## Grundlagen Linux/Unix – Befehle & Navigation

Quelle: https://wiki.wendler.io

---

![Screenshot](bilder/Screenshot%202025-07-23%20081215.png)

---

## Wichtige Befehle

- `~` → Heimatverzeichnis (Home Directory)
- `ls` → Inhalt des aktuellen Verzeichnisses anzeigen
- `ls -l` → detaillierte Liste (Rechte, Besitzer, Größe, Datum)
- `ls -la` → detaillierte Liste inkl. versteckter Dateien (beginnen mit `.`)
- `mkdir` → Verzeichnisse anlegen  
  Beispiel:
  ```bash
  mkdir besucher bewohner angestellte
  ```
  Erstellt im Verzeichnis *tierheim* die Unterordner `besucher`, `bewohner` und `angestellte`.

- `rm -r <name>` → Verzeichnis rekursiv entfernen  
  `-r` bedeutet, dass alle Unterverzeichnisse und Dateien ebenfalls gelöscht werden.

- `/` → trennt Pfadelemente unter Linux/Unix

- `ll` → Alias für `ls -l` (nicht auf allen Systemen vorhanden)

- `..` → ein Verzeichnis nach oben wechseln

- `tree` → Verzeichnisstruktur in Baumform anzeigen (falls installiert)

---

## Ordner- und Dateiverwaltung, Pfadangaben

Schwerpunkte im Unterricht:

- Erstellung von Ordnern und Dateien im Kontext der Pfadnavigation
- Praktische Übungen im Beispielverzeichnis *tierheim*
  - Unterordner anlegen
  - Mit `cd` und `..` navigieren
  - Strukturen mit `ls` und `tree` anzeigen
  - Verzeichnisse mit `rm -r` entfernen

