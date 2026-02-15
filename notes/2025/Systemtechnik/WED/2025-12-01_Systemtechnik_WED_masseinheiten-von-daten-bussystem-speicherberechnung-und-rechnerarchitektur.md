---
title: "Maßeinheiten von Daten & Bussystem – Speicherberechnung und Rechnerarchitektur"
date: 2025-12-01
weekday: "Montag"
subject: "Systemtechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Grundlagen IT-Systeme"
topic: "Bit, Byte, SI- und Binärpräfixe, Speicherberechnung, Bussystem"
level: "Grundlagen"
tags:
  - Bit
  - Byte
  - kB
  - KiB
  - MB
  - MiB
  - GB
  - GiB
  - Speicherberechnung
  - SI-Präfixe
  - Binärpräfixe
  - Bussystem
  - Datenbus
  - Adressbus
  - Steuerbus
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

## Montag, 01-12-2025_ST_WED

# Maßeinheiten von Daten

## Überblick

- Bit · Byte  
- kB (Kilobyte) vs. KiB (Kibibyte)  
- Umrechnung von Datenmengen  
- Zusammenhang zwischen Busbreite und adressierbarem Speicher  

Diese Themen sind **AP1-relevant**, besonders bei Speicher- und Architekturaufgaben.

---

# Bit und Byte

## Bit

- „Bit“ = Binary Digit  
- Zwei Zustände: **0 oder 1**
- Kleinste Informationseinheit
- Eine Stelle einer Binärzahl

---

## Byte

- 1 Byte = **8 Bit**
- Auch „Oktett“ genannt
- Kleinste meist adressierbare Speichereinheit moderner Systeme

Wichtig:  
Ein Byte ist eine Zusammenfassung von 8 Bit – die Reihenfolge der Bits ergibt den Zahlenwert.

---

# Dezimalpräfixe (SI-System)

Basieren auf **Zehnerpotenzen (10³)**.

| Einheit   | Symbol | Bedeutung in Byte |
|------------|--------|------------------|
| Kilobyte   | kB     | 10³ = 1.000 Byte |
| Megabyte   | MB     | 10⁶ = 1.000.000 Byte |
| Gigabyte   | GB     | 10⁹ Byte |
| Terabyte   | TB     | 10¹² Byte |

⚠ Wichtig für Prüfungen:  
Festplattenhersteller verwenden meist **SI-Präfixe (kB, MB, GB)**.

---

# Binärpräfixe (IEC)

Basieren auf **2¹⁰ = 1024**.

| Einheit   | Symbol | Bedeutung in Byte |
|------------|--------|------------------|
| Kibibyte   | KiB    | 2¹⁰ = 1.024 Byte |
| Mebibyte   | MiB    | 2²⁰ = 1.048.576 Byte |
| Gibibyte   | GiB    | 2³⁰ = 1.073.741.824 Byte |

⚠ Betriebssysteme rechnen intern häufig mit **Binärpräfixen**, zeigen aber „GB“ an – das führt zu scheinbaren Kapazitätsunterschieden.

---

# Beispiel: Speicherbedarf für 500 Bilder

## Gegeben

- Höhe: 1500 Pixel  
- Breite: 2000 Pixel  
- Farbkanäle: 3 (RGB)  
- Farbtiefe: 8 Bit pro Kanal = 1 Byte  

---

## Schritt 1: Pixel pro Bild

1500 × 2000 = 3.000.000 Pixel

---

## Schritt 2: Speicher pro Pixel

3 Farbkanäle × 1 Byte = 3 Byte

---

## Schritt 3: Speicher pro Bild

3.000.000 × 3 Byte = 9.000.000 Byte

---

## Schritt 4: Speicher für 500 Bilder

9.000.000 × 500 = 4.500.000.000 Byte

---

## Schritt 5: Umrechnung in GiB

1 GiB = 1.073.741.824 Byte

4.500.000.000 ÷ 1.073.741.824 ≈ 4,19 GiB

---

## Ergebnis

Der Speicherbedarf für 500 Bilder beträgt **ca. 4,19 GiB**  
(unkomprimierte Speicherung).

Hinweis:  
Komprimierungsverfahren (JPEG, PNG etc.) reduzieren den tatsächlichen Speicherbedarf.

---

# Exkurs: Bussystem

Ein Bussystem verbindet:

- CPU
- Hauptspeicher
- Ein-/Ausgabegeräte

Es transportiert:

- Daten
- Adressen
- Steuersignale

---

## Datenbus

Funktion:
- Überträgt Daten zwischen CPU, Speicher und Peripherie

Eigenschaften:
- Bidirektional
- Breite z. B. 8, 16, 32, 64 Bit
- Bestimmt, wie viele Bits gleichzeitig übertragen werden

---

## Adressbus

Funktion:
- Überträgt Speicheradressen

Eigenschaften:
- Unidirektional (CPU → Speicher)
- Breite bestimmt maximal adressierbaren Speicher

Beispiel:
32-Bit-Adressbus → 2³² Adressen  
= 4.294.967.296 Byte  
≈ 4 GiB direkt adressierbarer Speicher

Das erklärt die klassische 4-GB-Grenze bei 32-Bit-Systemen.

---

## Steuerbus

Funktion:
- Koordiniert Lese- und Schreibvorgänge
- Überträgt Kontroll- und Statussignale
- Enthält Takt- und Interruptleitungen

Bidirektional.

---

# Zusammenfassung (Prüfungsfokus)

- 1 Byte = 8 Bit  
- kB ≠ KiB  
- SI = Zehnerpotenzen  
- IEC = Zweierpotenzen  
- Speicherberechnungen erfolgen systematisch:
  Pixel → Byte pro Pixel → Gesamtbyte → Umrechnung  
- Adressbusbreite bestimmt maximal adressierbaren Speicher  

Diese Inhalte gehören zum Kernwissen für AP1 im Bereich Systemtechnik.
