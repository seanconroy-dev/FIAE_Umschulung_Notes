---
title: "Software-Einteilung & Grundlagen des Betriebssystems"
date: 2025-07-24
weekday: "Donnerstag"
subject: "BS"
instructor: "SLE"
program: "FIAE Umschulung 2025-2027"
module: "Betriebssysteme"
topic: "Grundlagen & Einordnung"
level: "Grundlagen"
tags:
  - Betriebssysteme
  - Software
  - Systemsoftware
  - Anwendungssoftware
  - Speicherverwaltung
  - Prozessverwaltung
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-07-24_BS_SLE

## Software – Einordnung

### Systemsoftware
- **Betriebssysteme**
- **Systemnahe Software**
- **Firmware**

Programmiersprachen bilden die Grundlage für beide Seiten (System- und Anwendungssoftware).  
**Compiler** und **Interpreter** übersetzen Programmiersprachen in ausführbaren Code.

---

### Anwendungssoftware

- **Standardprogramme (horizontaler Markt)**
  - Für einen breiten Nutzerkreis
  - Beispiel: Office-Programme

- **Branchenlösungen (vertikaler Markt)**
  - Speziell für bestimmte Branchen entwickelt
  - Beispiel: ERP-/CRM-Systeme wie SAP

---

## Themenblock Betriebssysteme

- Definition: Was ist ein Betriebssystem?
- Aufgaben eines Betriebssystems
- Geschichte
- Modelle (z. B. Schichtenmodell)
- Einteilung von Betriebssystemen
- Wichtige Betriebssysteme
- Bootprozess / Bootstrapping

---

## Definition Betriebssystem (DIN 44300)

„Die Programme eines digitalen Rechensystems, die zusammen mit den Eigenschaften dieser Rechenanlage die Basis der möglichen Betriebsarten des digitalen Rechensystems bilden und insbesondere die Abwicklung von Programmen steuern und überwachen.“

---

## Aufgaben eines Betriebssystems

### Abstraktion

- Das Betriebssystem stellt eine nutzbare Oberfläche bereit und verbirgt Maschinenbefehle.
- **Reale Maschine:** Zentraleinheit + Hardware + Treiber  
- **Abstrakte Maschine:** Reale Maschine + Betriebssystem  
- **Benutzermaschine:** Abstrakte Maschine + Anwendungsprogramme  

---

### Speicherverwaltung

- Verwaltung des Hauptspeichers
- Speicherzuteilung und -freigabe
- Protokollierung der Speichernutzung

**Speicherarten:**
- CPU-Register  
- Cache  
- Arbeitsspeicher (RAM)  
- Massenspeicher  
- Wechseldatenträger  

**Flüchtiger Speicher:** schnell, verliert Daten ohne Strom  
**Nicht-flüchtiger Speicher:** dauerhaft  

---

### Prozesssteuerung

- Verwaltung der Prozessorzeit
- Erzeugen neuer Prozesse
- Thread-Verwaltung
- Speicherreservierung für Prozesse

---

### Geräte- und Dateiverwaltung

- Zuweisung und Steuerung von Ein- und Ausgabegeräten
- Verwaltung des Dateisystems

