---
title: "Pseudocode – Grundlagen, Nutzen und Beispiele"
date: 2025-11-14
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "SCH"
program: "FIAE Umschulung 2025-2027"
module: "Algorithmen & Logik"
topic: "Pseudocode"
level: "Grundlagen"
tags:
  - Pseudocode
  - Algorithmen
  - Logik
  - Kontrollstrukturen
  - Planung
  - Programmiermethodik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Pseudocode – Grundlagen, Nutzen und Beispiele (2025-11-14 · SCH)

## Thema
Planung und Beschreibung von Programmlogik vor der eigentlichen Implementierung

---

## 1. Was ist Pseudocode?

Pseudocode ist eine vereinfachte, sprachunabhängige Beschreibung eines Programms.  
Er liegt zwischen natürlicher Sprache und echtem Programmcode.

Eigenschaften:
- nicht ausführbar
- keine echte Programmiersprache
- für Menschen leicht lesbar
- logisch eindeutig strukturiert

---

## 2. Wofür wird Pseudocode verwendet?

Pseudocode dient dazu:

- Programmabläufe vorab zu planen
- Logik zu prüfen, bevor Code geschrieben wird
- Ideen verständlich zu kommunizieren
- komplexe Probleme in Einzelschritte zu zerlegen

Zentrale Frage:
Was soll das Programm tun – unabhängig von konkreter Syntax?

---

## 3. Warum ist Pseudocode prüfungsrelevant?

Pseudocode hilft:

- logisches Denken zu trainieren
- Denkfehler früh zu erkennen
- Algorithmen verständlich darzustellen
- sprachunabhängig zu argumentieren

In Prüfungen zählt:
- klare Struktur
- korrekte Logik
- nachvollziehbarer Ablauf

Nicht entscheidend ist:
- perfekte Programmiersyntax

---

## 4. Typische Einsatzbereiche

- Unterricht (Erklärung von Algorithmen)
- Planung vor der Implementierung
- Whiteboard- oder Papierentwürfe
- Vorbereitung für Flussdiagramme oder echten Code

---

## 5. Typische Sprachelemente

Pseudocode verwendet bekannte Grundstrukturen (Java-ähnlich im Unterricht):

- Sequenzen (Anweisungen nacheinander)
- Bedingungen (wenn, sonst, sonst wenn)
- Schleifen (solange, für)
- Ein- und Ausgabe
- Kommentare

Es existiert kein fester Standard – Klarheit ist wichtiger als Formalismus.

---

## 6. Strukturkonventionen

Typische Regeln:

- Einrückung zur Darstellung der Struktur
- verständliche Variablennamen
- klare Kontrollstrukturen
- Kommentare zur Erklärung

Beispiel:

```
wenn (Bedingung)
    dann Anweisung
sonst
    andere Anweisung
```

---

## 7. Grundstrukturen

### Bedingungen
- wenn
- sonst wenn
- sonst

### Schleifen
- solange (while)
- für jede Wiederholung

### Ein- und Ausgabe
- Eingabe: Wert lesen
- Ausgabe: Ergebnis anzeigen

### Kommentare
- erklären, was passiert
- nicht syntaktische Details

---

## 8. Beispiel 1 – Positiv, negativ oder null

Problem:
Eine Zahl soll klassifiziert werden.

Pseudocode:

```
Ausgabe: "Dieses Programm prüft eine Zahl"

zahl = Zufallszahl

wenn (zahl > 0)
    dann Ausgabe: "Zahl ist positiv"
sonst wenn (zahl < 0)
    dann Ausgabe: "Zahl ist negativ"
sonst
    Ausgabe: "Zahl ist null"
```

Logik:
- genau eine Bedingung trifft zu
- Reihenfolge der Prüfung ist entscheidend

---

## 9. Beispiel 2 – Gerade oder ungerade

Problem:
Prüfen, ob eine Zahl gerade oder ungerade ist.

Pseudocode:

```
Eingabe: zahl

wenn (zahl modulo 2 == 0)
    dann Ausgabe: "Zahl ist gerade"
sonst
    Ausgabe: "Zahl ist ungerade"
```

Logik:
- Modulo bestimmt den Divisionsrest
- Rest 0 → gerade
- sonst → ungerade

---

## 10. Typische Fehler

- zu viel echte Programmiersyntax
- unklare oder mehrdeutige Bedingungen
- fehlende Einrückung
- mehrere Logikschritte gleichzeitig prüfen
- fehlende Strukturierung

---

## Kernaussagen

- Pseudocode beschreibt Logik, nicht Syntax
- Er ist ein Denk- und Planungswerkzeug
- Gute Struktur im Pseudocode führt zu sauberem Code
- Besonders wichtig für Anfänger und Prüfungen
