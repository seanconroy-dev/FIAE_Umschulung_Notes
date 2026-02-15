---
title: "Altersabfrage mit if-else"
date: 2025-09-09
weekday: "Dienstag"
subject: "Programmiertechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Kontrollstrukturen"
topic: "if-else, Bereichsprüfung, Validierung"
level: "Grundlagen"
tags:
  - if-else
  - Kontrollstrukturen
  - Bereichsprüfung
  - Eingabevalidierung
  - Entscheidungslogik
  - Pseudocode
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Altersabfrage mit if-else (2025-09-09 · WED)

## Ziel

Ein Programm ordnet eine Person anhand ihres Alters einer Kategorie zu:

- Kind
- Teen
- Erwachsener
- Rentner

Beispielausgabe:  
`Du bist Teenager.`

---

## Saubere, eindeutige Grenzdefinition

Um Überschneidungen zu vermeiden:

- Kind: `alter <= 13`
- Teen: `14 <= alter <= 17`
- Erwachsener: `18 <= alter <= 65`
- Rentner: `alter >= 66`

Diese Variante ist:
- lückenlos
- überschneidungsfrei
- logisch konsistent

---

## Entscheidungslogik

Reihenfolge von klein nach groß:

1. Wenn `alter < 0` oder `alter > 130` → Ungültig
2. Wenn `alter <= 13` → Kind
3. Sonst wenn `alter <= 17` → Teen
4. Sonst wenn `alter <= 65` → Erwachsener
5. Sonst → Rentner

---

## Warum if-else statt mehrere if?

Eine `if-else-if`-Kette:
- stoppt nach dem ersten Treffer
- verhindert doppelte Ausgaben

Mehrere einzelne `if`:
- prüfen alle Bedingungen
- können mehrere Kategorien gleichzeitig ausgeben

Beispielproblem:
```
if (alter >= 18)
if (alter >= 66)
```
Alter 70 erfüllt beide Bedingungen.

---

## Eingabevalidierung

Empfohlen:

- `alter < 0` → ungültig
- `alter > 130` → ungültig

Optional:
- Eingabe wiederholen, bis gültiger Wert vorliegt.

---

## Pseudocode

```
Lese alter

wenn alter < 0 oder alter > 130
    Ausgabe "Ungültige Eingabe"
sonst wenn alter <= 13
    Ausgabe "Kind"
sonst wenn alter <= 17
    Ausgabe "Teen"
sonst wenn alter <= 65
    Ausgabe "Erwachsener"
sonst
    Ausgabe "Rentner"
```

---

## Testmatrix (Grenzwerte prüfen!)

| Alter | Erwartetes Ergebnis |
|-------|--------------------|
| 0     | Kind               |
| 13    | Kind               |
| 14    | Teen               |
| 17    | Teen               |
| 18    | Erwachsener        |
| 65    | Erwachsener        |
| 66    | Rentner            |
| -1    | Ungültig           |
| 131   | Ungültig           |

---

## Typische Fehler

- Überlappende Bedingungen
- Falsche Reihenfolge der Prüfungen
- Keine Validierung
- Mehrere `if` statt `if-else`
- Unklare Inklusiv-/Exklusiv-Grenzen

---

## Fachbegriffe

- **Kontrollstruktur** → steuert Programmablauf
- **Bedingung** → wahr/falsch-Ausdruck
- **Bereichsprüfung** → Zahl liegt im Intervall
- **Inklusiv** → Grenze eingeschlossen (`<=`)
- **Exklusiv** → Grenze ausgeschlossen (`<`)

---

## Entscheidungsbaum (ASCII)

```
Start
 ├─ alter < 0 oder > 130 → Ungültig
 ├─ alter <= 13          → Kind
 ├─ alter <= 17          → Teen
 ├─ alter <= 65          → Erwachsener
 └─ sonst                → Rentner
```

---

## Denkregeln für Bereiche

- Keine Lücken
- Keine Überlappungen
- Grenzen bewusst definieren
- Reihenfolge korrekt wählen
- Teste Kantenwerte (Grenzfälle)

---

## Checkliste

- Grenzen eindeutig definiert
- if-else-Kette korrekt
- Validierung vorhanden
- Testmatrix geprüft
- Optional: Logik in Methode ausgelagert
