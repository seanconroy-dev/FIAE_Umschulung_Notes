---
title: "Logikfehler vs Syntaxfehler"
date: 2026-04-24
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "Selbststudium"
program: "FIAE Umschulung 2025-2027"
module: ""
topic: "Fehlerarten in der Programmierung"
level: "Grundlagen"
tags:
  - Debugging
  - Java
  - Fehleranalyse
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

## Kurzüberblick / Definition

In der Programmierung unterscheidet man zwischen:

- **Syntaxfehlern** → Verstoß gegen die **Sprachregeln**
- **Logikfehlern** → Fehler in der **fachlichen oder algorithmischen Umsetzung**

---

## Core-Erklärung

### Grundprinzip

Fehler lassen sich danach unterscheiden, **wann** sie auftreten und **wie** sie sich auswirken:

| Fehlerart     | Code korrekt? | Programm läuft? | Ergebnis korrekt? |
|---------------|--------------|-----------------|-------------------|
| Syntaxfehler  | ❌ Nein       | ❌ Nein          | ❌ Nein            |
| Logikfehler   | ✅ Ja         | ✅ Ja            | ❌ Nein            |

---

### 1. Syntaxfehler (Compile-Time Error)

Ein **Syntaxfehler** entsteht, wenn der Code gegen die Regeln der Programmiersprache verstößt.

➡️ Der Compiler kann den Code nicht übersetzen

#### Beispiel

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!" // fehlende Klammer
    }
}
```

Typische Ursachen:

- Fehlende oder falsche Klammern
- Fehlende Semikolons
- Tippfehler bei Schlüsselwörtern (`publc`, `clas`)
- Falsche Methodensignaturen

➡️ Fehler wird **sofort vom Compiler gemeldet**

---

### 2. Logikfehler (Semantischer Fehler)

Ein **Logikfehler** bedeutet:

- Der Code ist syntaktisch korrekt
- Die Umsetzung der Aufgabe ist falsch

➡️ Das Programm läuft, aber das Ergebnis ist falsch

#### Beispiel

```java
public class Main {
    public static void main(String[] args) {
        int a = 5;
        int b = 10;
        int sum = a - b; // falsche Operation
        System.out.println("Summe: " + sum);
    }
}
```

---

## Praxisbeispiele (Realistisch)

### 1. Authentifizierung (sehr häufig in Prüfungen)

#### Logikfehler

```java
if (username == "admin") {
    System.out.println("Login erfolgreich");
}
```

Problem:

- `==` vergleicht Referenzen, nicht Inhalte
- Korrekt wäre:

```java
if (username.equals("admin")) {
    System.out.println("Login erfolgreich");
}
```

---

### 2. Rabattberechnung

```java
double price = 100;
double discount = 0.2;

double finalPrice = price + discount; // falsche Formel
```

➡️ Richtige Logik:

```java
double finalPrice = price * (1 - discount);
```

---

### 3. Schleifenfehler (Off-by-One)

```java
for (int i = 0; i <= 10; i++) {
    System.out.println(i);
}
```

➡️ Gibt 11 Werte aus (0–10)

---

### 4. Bedingungen (Grenzwerte)

```java
if (age > 18) {
    System.out.println("Erwachsen");
}
```

➡️ Problem: 18-Jährige werden ausgeschlossen

➡️ Korrekt:

```java
if (age >= 18) {
    System.out.println("Erwachsen");
}
```

---

## Vergleich: Syntax vs Logikfehler

| Kriterium            | Syntaxfehler              | Logikfehler                  |
|----------------------|--------------------------|------------------------------|
| Zeitpunkt            | Beim Kompilieren         | Während der Ausführung       |
| Programmstart möglich | ❌ Nein                  | ✅ Ja                        |
| Fehlermeldung        | ✅ Direkt                | ❌ Oft keine                 |
| Ursache              | Sprachregel verletzt     | Denk-/Fachfehler             |
| Schwierigkeit        | Niedrig                  | Mittel bis hoch              |

---

## Debugging & Fehlersuche

### Syntaxfehler

- Werden vom Compiler/IDE angezeigt
- Meist direkt korrigierbar

---

### Logikfehler

Erfordern systematische Analyse:

- Schrittweises Durchgehen (Debugger)
- Zwischenausgaben (`print`)
- Testfälle (Unit Tests)
- Grenzwerte prüfen (Edge Cases)

---

## Erweiterung: Laufzeitfehler (Runtime Error)

Ein **Laufzeitfehler** tritt während der Ausführung auf und führt meist zum Abbruch.

```java
int x = 10 / 0;
```

➡️ Beispiel: Division durch 0 → Exception

---

## Typische Denkfehler

- „Kein Compilerfehler = Code ist korrekt“
- Verwechslung von `=` und `==`
- Falsche Annahmen über Bedingungen
- Unzureichendes Testen

---

## Exam-Relevanz

- Unterschied zwischen Syntax- und Logikfehler erklären
- Beispiele korrekt zuordnen
- Typische Logikfehler erkennen (if, Schleifen, Operatoren)
- Rolle des Compilers verstehen

---

## Fazit

- **Syntaxfehler** stoppen das Programm vor dem Start
- **Logikfehler** sind subtil und gefährlich
- Gute Entwickler erkennen Logikfehler durch **Tests und sauberes Denken**

---

## Merksatz

> Syntaxfehler verhindern die Ausführung.  
> Logikfehler verfälschen das Ergebnis.

---