---
title: "Schaltkreise & Logikgatter – Grundlagen"
date: 2025-10-09
weekday: "Donnerstag"
subject: "DT"
instructor: "PAS"
program: "FIAE Umschulung 2025-2027"
module: "Digitale Technik"
topic: "Logikgatter & kombinatorische Logik"
level: "Grundlagen"
tags:
  - Digitale Logik
  - Logikgatter
  - NAND
  - Wahrheitstabelle
  - Rechnerarchitektur
  - Hardware
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-10-09_DT_PAS  
### Schaltkreise & Logikgatter – Grundlagen

**Kontext:** Digitale Logik, Sicherheit, Performance  
**Bezug:** Hardware-nahe Grundlagen für Informatik & Systemverständnis

---

## 1. Überblick: Digitale Schaltkreise

Digitale Schaltkreise verarbeiten **binäre Signale** (0 / 1, FALSE / TRUE).  
Sie bilden die Grundlage aller Rechnerarchitekturen – von einfachen Steuerungen bis zu CPUs.

Unterschieden wird zwischen:

- **Kombinatorischer Logik** → Ausgang hängt nur vom aktuellen Eingang ab  
- **Sequentieller Logik** → Ausgang hängt zusätzlich vom vorherigen Zustand ab  

Diese Mitschrift behandelt **kombinatorische Logik**.

---

## 2. Logikgatter (Grundbausteine)

### UND (AND)
- Ausgang = 1 **nur wenn alle Eingänge 1 sind**
- Entspricht einer **Reihenschaltung**

### ODER (OR)
- Ausgang = 1, wenn **mindestens ein Eingang 1 ist**
- Entspricht einer **Parallelschaltung**

### NICHT (NOT)
- Invertiert das Eingangssignal
- 0 → 1, 1 → 0

### EXKLUSIV-ODER (XOR)
- Ausgang = 1, wenn **genau ein Eingang 1 ist**
- Wichtig für Addition (Halbaddierer, Volladdierer)

### NOR
- Invertiertes ODER
- Ausgang = 1 **nur wenn alle Eingänge 0 sind**

---

## 3. Wahrheitstabellen

Wahrheitstabellen beschreiben formal und vollständig das Verhalten eines Gatters.

### UND (AND)

| A | B | A ∧ B |
|---|---|-------|
| 0 | 0 |   0   |
| 0 | 1 |   0   |
| 1 | 0 |   0   |
| 1 | 1 |   1   |

### XOR

| A | B | A ⊕ B |
|---|---|-------|
| 0 | 0 |   0   |
| 0 | 1 |   1   |
| 1 | 0 |   1   |
| 1 | 1 |   0   |

Wahrheitstabellen sind:
- prüfungsrelevant  
- Grundlage für Schaltplan-Analyse  
- notwendig für logische Optimierung  

---

## 4. NAND – das universelle Gatter

> **Merksatz:**  
> Fast alle digitalen Schaltungen lassen sich mit NAND-Gattern realisieren.

Warum NAND so wichtig ist:

- **funktional vollständig** (alle anderen Gatter darstellbar)
- einfacher Aufbau
- effizient in Hardware implementierbar
- gut für Massenproduktion geeignet

Aus NAND lassen sich konstruieren:

- NOT  
- AND  
- OR  
- XOR  
- Speicherzellen (Flip-Flops)

---

## 5. Reihenschaltung & logische Bedeutung

- **Reihenschaltung** → logisches UND  
- **Parallelschaltung** → logisches ODER  

Diese Analogie erleichtert den Übergang von:

- Elektrotechnik → Informatik  
- Hardware → Softwarelogik  

---

## 6. Kontext: Sicherheit & Performance

### Sicherheit

Logikgatter bestimmen:

- Zugriffsbedingungen  
- Entscheidungslogik  
- Kontrollflüsse  

Sie sind Grundlage für Vergleichsoperationen und Verzweigungen in Programmen.

### Performance

- Weniger Gatter = kürzere Signalwege  
- Optimierte Logik = geringere Latenz  
- NAND-basierte Designs sind oft:
  - schneller  
  - stromsparender  
  - robuster  

Deshalb werden logische Ausdrücke häufig **minimiert**.

---

## 7. Relevanz für FIAE

Diese Grundlagen sind wichtig für:

- Rechnerarchitektur  
- Embedded Systems  
- Compiler-Grundlagen  
- Sicherheitslogik  
- Performance-Verständnis  
- Technische Interviews  

Ohne Logikgatter:
- kein Prozessor  
- kein RAM  
- kein Programmfluss
