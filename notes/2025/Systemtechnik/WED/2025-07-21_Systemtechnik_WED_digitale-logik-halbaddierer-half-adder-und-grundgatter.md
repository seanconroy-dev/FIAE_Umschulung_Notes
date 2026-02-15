---
title: "Digitale Logik – Halbaddierer (Half Adder) und Grundgatter"
date: 2025-07-21
weekday: "Montag"
subject: "Systemtechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Digitale Logik & Rechnergrundlagen"
topic: "Logikgatter, XOR, AND, Halbaddierer, Wahrheitstabelle"
level: "Grundlagen"
tags:
  - Digitale Logik
  - Logikgatter
  - AND
  - OR
  - XOR
  - NAND
  - NOT
  - Halbaddierer
  - Wahrheitstabelle
  - Boolesche Algebra
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# 21.07.2025_WED – Digital Logic Simulation · Halbaddierer (Half Adder)

## Thema

Simulation digitaler Grundgatter mit **Digital Logic Sim**.  
Aufbau eines **Halbaddierers** aus elementaren Logikgattern.

Ziel: Verständnis von binärer Addition und Signalflüssen.

---

# Digitale Grundgatter

| Gatter | Symbol | Bedeutung |
|--------|--------|------------|
| AND    | ∧      | 1 nur wenn beide Eingänge 1 sind |
| OR     | ∨      | 1 wenn mindestens ein Eingang 1 ist |
| XOR    | ⊕      | 1 wenn genau ein Eingang 1 ist |
| NOT    | ¬      | Invertiert das Signal |
| NAND   | ¬∧     | Negation von AND |

Wichtig:

XOR ist zentral für Addierer, da es die Summenbildung ohne Übertrag beschreibt.

---

# Halbaddierer (Half Adder)

Ein Halbaddierer addiert zwei Binärstellen:

Eingänge:
- A
- B

Ausgänge:
- Summe (S)
- Übertrag (Carry, C)

---

## Logische Funktionen

- Summe:  
  S = A ⊕ B

- Übertrag:  
  C = A ∧ B

Das entspricht exakt der binären Addition ohne eingehenden Übertrag.

---

## Wahrheitstabelle

| A | B | S (Summe) | C (Carry) |
|---|---|------------|------------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

Interpretation:

1 + 1 = 10 (binär)  
→ Summe = 0  
→ Übertrag = 1

---

## Strukturdiagramm (vereinfachte Darstellung)

```
     A ─────────────┬───────────────┐
                    │               │
                    ▼               ▼
                  ┌────┐         ┌────┐
                  │AND │         │XOR │
                  └────┘         └────┘
                    │               │
                    ▼               ▼
                  Carry            Summe
```

Beide Eingänge werden parallel auf AND- und XOR-Gatter geführt.

---

# Fachliche Einordnung

Ein Halbaddierer kann:

- Zwei Bits addieren
- Einen Übertrag erzeugen

Er kann nicht:

- Einen eingehenden Übertrag (Carry-In) verarbeiten

Dafür wird ein **Volladdierer (Full Adder)** benötigt.

Ein Volladdierer besteht aus:

- Zwei Halbaddierern
- Einem zusätzlichen OR-Gatter

Das ist prüfungsrelevant im Kontext von:

- Binärarithmetik
- CPU-Grundlagen
- Aufbau von Rechenwerken

---

# Anwendung im Unterricht

- Aufbau aller Grundgatter
- Verdrahtung des Halbaddierers
- Test mit allen Eingangskombinationen
- Analyse der Signalzustände

Ziel war das Verständnis:

- Boolescher Logik
- Wahrheitstabellen
- Zusammenhang zwischen Logikgatter und arithmetischer Funktion

---

# Prüfungsfokus (AP1)

- Wahrheitstabelle korrekt aufstellen können
- Logische Funktion in Symbolform angeben können
- Unterschied Halbaddierer vs. Volladdierer kennen
- Gatter logisch erklären können

Digitale Logik bildet die Grundlage für Prozessoren, ALUs und damit für jede moderne Rechnerarchitektur.
