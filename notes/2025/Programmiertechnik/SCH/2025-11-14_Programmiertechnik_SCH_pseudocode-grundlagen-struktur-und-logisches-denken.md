---
title: "Pseudocode – Grundlagen, Struktur und logisches Denken"
date: 2025-11-14
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "SCH"
program: "FIAE Umschulung 2025-2027"
module: "Algorithmen und Kontrollstrukturen"
topic: "Pseudocode, Bedingungen, Schleifen, Logik"
level: "Grundlagen"
tags:
  - Pseudocode
  - Algorithmen
  - Kontrollstrukturen
  - Bedingungen
  - Schleifen
  - Logik
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Freitag, 14-11-2025_PT_SCH

## Pseudocode – Grundlagen

## Was ist Pseudocode?

Pseudocode ist eine **sprachunabhängige, vereinfachte Beschreibung eines Algorithmus**.  
Er ähnelt einer Programmiersprache (z. B. Java), ist aber **nicht ausführbar**.

Er dient dazu, **Logik strukturiert darzustellen**, ohne sich mit exakter Syntax befassen zu müssen.

---

## Wofür ist Pseudocode?

- Planung von Programmen vor der Implementierung  
- Strukturierung von Problemlösungen  
- Verständliche Darstellung von Algorithmen  
- Kommunikation in Teams  
- Didaktisches Mittel im Unterricht  

---

## Warum lernen wir Pseudocode?

- Fokus auf **Logik statt Syntax**
- Fehlervermeidung durch strukturierte Planung
- Vorbereitung auf reale Programmiersprachen
- Prüfungsrelevant (AP1: Algorithmusverständnis)

---

# Sprachliche Konventionen (Java-orientiert)

Pseudocode orientiert sich oft an Java-ähnlicher Struktur:

- Einrückung für Blockstrukturen
- klare Wenn-Dann-Struktur
- sprechende Variablennamen
- Kommentare zur Erklärung

---

# Grundstrukturen im Pseudocode

## 1) Einfache Anweisungen
```
zahl = 5
summe = zahl + 10
```

## 2) Bedingungen
```
wenn (Bedingung) dann
    Anweisung
sonst
    Alternative
```

## 3) Mehrfachverzweigung
```
wenn (Bedingung1) dann
    ...
sonst wenn (Bedingung2) dann
    ...
sonst
    ...
```

## 4) Schleifen
```
wiederhole solange (Bedingung)
    ...
```

oder

```
für i von 0 bis 10
    ...
```

## 5) Ein- und Ausgabe
```
gebe aus "Text"
lies zahl ein
```

## 6) Kommentare
```
# Dies ist ein Kommentar
```

---

# Grundlagen der Logik

## Beispiel 1: Positiv, negativ oder null

### Problem:
Eine Zahl soll darauf geprüft werden, ob sie positiv, negativ oder null ist.

### Pseudocode:

```
gebe aus "Dieses Programm prüft, ob eine Zahl positiv, negativ oder null ist."

zahl = zufallszahl

wenn (zahl > 0) dann
    gebe aus "Zahl ist positiv"
sonst wenn (zahl < 0) dann
    gebe aus "Zahl ist negativ"
sonst
    gebe aus "Zahl ist null"
```

### Logikprinzip:
- Größer als 0 → positiv
- Kleiner als 0 → negativ
- Sonst → 0

---

## Beispiel 2: Gerade oder ungerade

### Mathematisches Prinzip:
Eine Zahl ist **gerade**, wenn sie ohne Rest durch 2 teilbar ist.  
→ Modulo-Operator: `zahl % 2`

### Pseudocode:

```
zahl = eingabe

wenn (zahl % 2 == 0) dann
    gebe aus "Zahl ist gerade"
sonst
    gebe aus "Zahl ist ungerade"
```

---

# Typische Prüfungsanforderungen (AP1)

- Bedingungen korrekt formulieren
- Logische Verzweigungen erkennen
- Algorithmus in Worte erklären können
- Strukturiertes Denken zeigen
- Modulo-Operator verstehen

---

# Zusammenfassung

Pseudocode ist ein Werkzeug zum **Denken in Algorithmen**.

Er trennt:
- Logik (Was soll passieren?)
von
- Implementierung (Wie genau schreibt man es in Java?)

Wer Pseudocode sauber beherrscht, reduziert später Syntaxfehler und programmiert strukturierter.
