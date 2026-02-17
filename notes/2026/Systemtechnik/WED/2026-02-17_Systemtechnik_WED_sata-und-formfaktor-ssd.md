---
title: "SATA, SSD-Formfaktoren und Schnittstellen"
date: 2026-02-17
weekday: "Dienstag"
subject: "Systemtechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Massenspeicher und Schnittstellen"
topic: "SATA, M.2, mSATA, SSD-Formfaktoren"
level: "Grundlagen"
tags:
  - SATA
  - SSD
  - M.2
  - mSATA
  - NVMe
  - Formfaktor
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Dienstag, 2026-02-17_Systemtechnik_WED

# SATA und SSD-Formfaktoren

In dieser Einheit ging es um **Steckplätze, Schnittstellen und Bauformen von SSDs**.  
Wichtig: Formfaktor ≠ Schnittstelle ≠ Protokoll.

---

# 1) Grundbegriffe

## Formfaktor
Beschreibt die **physische Bauform** eines Speichermediums  
(z. B. 2,5", M.2 2280).

## Schnittstelle
Physische Verbindung zum Mainboard  
(z. B. SATA-Port, M.2-Slot).

## Protokoll
Regelt die Kommunikation  
(z. B. AHCI bei SATA, NVMe bei PCIe).

---

# 2) SATA (Serial ATA)

## Eigenschaften
- Serielle Schnittstelle für Massenspeicher
- Wird für HDDs und SSDs genutzt
- Aktueller Standard: **SATA III (6 Gbit/s)**
- Effektive Datenrate: ca. **550 MB/s**

## Typischer Anschluss
- Datenkabel (SATA)
- Separates Stromkabel vom Netzteil

## 2,5"-SATA-SSD

- Standardgröße für SSDs in Desktop-PCs und Laptops
- Gleicher Formfaktor wie klassische Notebook-Festplatten
- Intern über SATA angeschlossen

**Wichtig für AP1:**  
SATA ist langsamer als NVMe, da es ursprünglich für mechanische Festplatten entwickelt wurde.

---

# 3) mSATA

## Eigenschaften
- Mini-SATA-Formfaktor
- Kompakter als 2,5"
- Verwendet ebenfalls das SATA-Protokoll
- Heute weitgehend durch M.2 ersetzt

Typisch in älteren Notebooks.

---

# 4) M.2

M.2 ist ein **Formfaktor**, kein Protokoll.

## M.2 2280

Die Zahl beschreibt die Maße:
- 22 mm Breite
- 80 mm Länge

Weitere Varianten: 2230, 2242, 2260, 22110

---

## M.2 mit SATA

- Nutzt SATA-Protokoll
- Geschwindigkeit wie normale SATA-SSD
- Kein Geschwindigkeitsvorteil gegenüber 2,5"

---

## M.2 mit PCIe (NVMe)

- Nutzt PCIe-Lanes
- Protokoll: **NVMe**
- Deutlich höhere Datenraten

Typische Werte:
- PCIe 3.0 x4 → ~3.500 MB/s
- PCIe 4.0 x4 → ~7.000 MB/s

**Merksatz:**  
M.2 beschreibt die Bauform, NVMe beschreibt das Protokoll.

---

# 5) Vergleich Übersicht

| Typ            | Schnittstelle | Protokoll | Geschwindigkeit | Status |
|---------------|--------------|-----------|------------------|--------|
| 2,5" SSD      | SATA        | AHCI      | ~550 MB/s       | Standard |
| mSATA         | SATA        | AHCI      | ~550 MB/s       | veraltet |
| M.2 (SATA)    | M.2         | AHCI      | ~550 MB/s       | selten |
| M.2 (NVMe)    | M.2 / PCIe  | NVMe      | bis >7.000 MB/s | modern |

---

# 6) Prüfungsrelevante Punkte (AP1)

- Unterschied Formfaktor vs. Schnittstelle erklären
- SATA vs. NVMe vergleichen
- M.2 ist nicht automatisch schneller
- NVMe nutzt PCIe-Lanes
- mSATA ist technisch SATA im kleineren Format

---

# Zusammenfassung

- SATA ist die ältere, langsamere Schnittstelle.
- 2,5" beschreibt nur die Baugröße.
- M.2 ist ein moderner Steckplatz mit verschiedenen Protokollen.
- NVMe ist speziell für schnelle Flash-Speicher entwickelt.
- Geschwindigkeit hängt von PCIe-Version und Lane-Anzahl ab.

---

