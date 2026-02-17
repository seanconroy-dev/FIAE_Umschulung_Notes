---
title: "Variablen, Datentypen & Übersetzungsarten"
date: 2025-07-21
weekday: "Montag"
subject: "Programmiertechnik"
instructor: "SCH"
program: "FIAE Umschulung 2025-2027"
module: "Grundlagen der Programmierung"
topic: "Variablen, Datentypen & Compiler/Interpreter"
level: "Grundlagen"
tags:
  - Variablen
  - Datentypen
  - Primitive Datentypen
  - Referenztypen
  - Compiler
  - Interpreter
  - JVM
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Variablen, Datentypen & Übersetzungsarten (2025-07-21 · SCH)

## Variablen – Wiederholung

- Eine **Variable** ist ein Speicherbereich mit einem **Datentyp** und einem **eindeutigen Namen**.
- Variablennamen werden in Java klein geschrieben.
- **camelCase** bei zusammengesetzten Namen (z. B. `meinAlter`, `benutzerName`).
- Variablen dienen zum Speichern, Verändern und Weitergeben von Werten.
- Die Lebensdauer einer Variable ist an ihren **Gültigkeitsbereich (Scope)** gebunden.
- Variablen belegen Speicher im RAM.

Beispiel:

```java
int myAge;
String myName;
boolean istFreitag;
```

---

## Datentypen in Java

### Primitive Datentypen

| Datentyp  | Bedeutung      | Größe  | Wertebereich (theoretisch) |
|-----------|---------------|--------|-----------------------------|
| `byte`    | Ganzzahl      | 8 Bit  | −2^7 bis 2^7−1              |
| `short`   | Ganzzahl      | 16 Bit | −2^15 bis 2^15−1            |
| `int`     | Ganzzahl      | 32 Bit | −2^31 bis 2^31−1            |
| `long`    | Ganzzahl      | 64 Bit | −2^63 bis 2^63−1            |
| `float`   | Gleitkomma    | 32 Bit | IEEE 754 (≈ ±3.4E38)        |
| `double`  | Gleitkomma    | 64 Bit | IEEE 754 (≈ ±1.8E308)       |
| `char`    | Unicode-Zeichen | 16 Bit | 0 bis 65535                |
| `boolean` | Wahrheitswert | JVM-abhängig | `true` / `false`     |

Hinweise:
- Ganzzahlen sind **signed** (mit Vorzeichen).
- `char` ist **unsigned**.
- `float` und `double` folgen dem **IEEE-754-Standard**.
- `boolean` ist logisch 1 Bit, wird intern JVM-abhängig gespeichert.

---

### Nicht-primitive Datentypen (Referenztypen)

| Typ           | Beschreibung                  | Standardwert |
|--------------|------------------------------|-------------|
| `String`     | Zeichenkette                 | `null`      |
| `Integer`    | Wrapper für `int`            | `null`      |
| `Double`     | Wrapper für `double`         | `null`      |
| `Float`      | Wrapper für `float`          | `null`      |
| `Boolean`    | Wrapper für `boolean`        | `null`      |
| `Character`  | Wrapper für `char`           | `null`      |
| Eigene Klassen | Benutzerdefinierte Objekte | `null`      |

- Referenztypen speichern eine **Referenz (Speicheradresse)**.
- Standardwert von Objektfeldern ist `null`.
- Wrapperklassen gehören zum Paket `java.lang`.

---

## Kurzübersicht

```java
// primitive:
int, double, float, short, boolean, char, byte, long

// referenztypen:
String, Integer, Double, Float, Boolean, Character
```

---

## Compiler vs Interpreter

| Merkmal         | Compiler                         | Interpreter                        |
|-----------------|----------------------------------|------------------------------------|
| Übersetzung     | Vor der Laufzeit                 | Während der Laufzeit               |
| Fehlererkennung | Vor Ausführung                   | Zur Laufzeit                       |
| Ausführung      | Direkt als Maschinencode         | Schrittweise Interpretation        |
| Beispiele       | C, C++                           | Python, JavaScript                 |

### Java – Sonderfall

Java kombiniert beide Prinzipien:

1. **Compiler (`javac`)**  
   Quellcode (`.java`) → Bytecode (`.class`)
2. **JVM (Java Virtual Machine)**  
   Bytecode → Interpretation bzw. JIT-Kompilierung zur Laufzeit

Eigenschaften:
- Bytecode ist **plattformunabhängig**
- JVM ist plattformspezifisch
- Java ist damit „Write once, run anywhere“

---

## Wichtiger Zusatz

`args` im Methodenkopf:

```java
public static void main(String[] args)
```

- `args` ist ein **Parameter**
- enthält Kommandozeilenargumente
- Datentyp: `String[]` (Array von Strings)

---

## Zusammenfassung – Lernmerksätze

- Primitive Typen speichern Werte direkt.
- Referenztypen speichern Speicheradressen.
- Ganzzahlen sind signed.
- Java wird kompiliert und anschließend von der JVM ausgeführt.
- Bytecode macht Java plattformunabhängig.
- Der Scope bestimmt die Lebensdauer einer Variable.

