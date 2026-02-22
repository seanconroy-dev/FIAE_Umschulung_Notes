---
title: "Text Blocks & Advanced Output Formatting"
date: 2026-02-22
weekday: "Sonntag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Strings & Output"
topic: "Text Blocks, printf, Formatter, format specifiers"
level: "Grundlagen"
tags:
  - String
  - TextBlock
  - printf
  - Formatter
  - FormatSpecifier
  - JDK15
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Sonntag, 2026-02-22_Programmiertechnik_UDEMY

## 1) Text Blocks (seit JDK 15)

### Definition

Ein **Text Block** ist ein mehrzeiliger String-Literal.

Er beginnt und endet mit drei doppelten Anführungszeichen:

```java
String textBlock = """
Print a Bulleted List:
    \u2022 First Point
        \u2022 Sub Point
""";
```

### Vorteile

- Keine String-Verkettung mit `+`
- Keine `\n` oder `\t` nötig
- Bessere Lesbarkeit
- Format im Code = Format in der Ausgabe

Vor JDK 15 musste man schreiben:

```java
String bulletIt = "Print a Bulleted List:\n" +
        "\t\u2022 First Point\n" +
        "\t\t\u2022 Sub Point";
```

Text Blocks sind deutlich sauberer.

---

## 2) Escape-Sequenzen (klassisch)

Escape-Sequenzen beginnen mit `\`.

| Escape | Bedeutung |
|--------|-----------|
| `\n`   | New Line |
| `\t`   | Tab |
| `\"`   | Anführungszeichen |
| `\\`   | Backslash |

Unicode-Zeichen:

```java
\u2022
```

= Bullet Point

---

## 3) printf & format

Neben `print()` und `println()` gibt es:

```java
System.out.printf()
System.out.format()
```

Beide funktionieren identisch.

### Beispiel

```java
int age = 35;
System.out.printf("Your age is %d%n", age);
```

`%d` ist ein **Format Specifier**.

---

## 4) Aufbau eines Format Specifiers

Allgemeine Form:

```
%[argument_index$][flags][width][.precision]conversion
```

Beispiel:

```
%.2f
```

- `%` → Start
- `.2` → 2 Nachkommastellen
- `f` → Floating Point

---

## 5) Wichtige Conversion Types

| Specifier | Bedeutung |
|------------|------------|
| `%d` | Integer |
| `%f` | Floating Point |
| `%s` | String |
| `%n` | Plattformabhängiger Zeilenumbruch |
| `%b` | Boolean |
| `%x` | Hexadezimal |

Wichtig:

`%n` ist besser als `\n`,  
weil es betriebssystemabhängig korrekt formatiert wird.

---

## 6) Integer vs Floating Point

```java
int age = 35;
System.out.printf("Age = %d%n", age);
```

Wenn man `%f` verwendet:

```java
System.out.printf("Age = %f%n", (float) age);
```

Standardmäßig erscheinen 6 Nachkommastellen.

### Präzision festlegen

```java
System.out.printf("Age = %.2f%n", (float) age);
```

= Zwei Nachkommastellen

---

## 7) Feldbreite (Width)

Beispiel:

```java
for (int i = 1; i <= 100000; i *= 10) {
    System.out.printf("Printing %6d%n", i);
}
```

`%6d` bedeutet:

- Zahl soll 6 Stellen breit sein
- Rechtsbündig
- Mit Leerzeichen aufgefüllt

Ausgabe wird sauber ausgerichtet.

---

## 8) Mehrere Platzhalter

```java
int age = 35;
int yearOfBirth = 2023 - age;

System.out.printf("Age = %d, Birth year = %d%n", age, yearOfBirth);
```

Wichtig:

Anzahl der Platzhalter = Anzahl der Argumente.

---

## 9) String.format()

Statische Methode:

```java
String formatted = String.format("Your age is %d", age);
```

Gibt einen formatierten String zurück.

---

## 10) String.formatted() (seit JDK 15)

Instanzmethode:

```java
String formatted = "Your age is %d".formatted(age);
```

Moderner und kompakter.

---

## 11) Compile-Fehler Beispiel

```java
System.out.printf("Age = %f%n", age);
```

→ IllegalFormatConversionException

Grund:
`%f` erwartet float oder double.

---

## 12) Performance-Hinweis

Früher war String-Verkettung schneller.  
Heute sind Format-Methoden stark optimiert.

Vorteil von Formatierung:

- Bessere Lesbarkeit
- Wartbarer Code
- Flexible Ausrichtung
- Präzise Zahlenkontrolle

---

## 13) Typische Prüfungsfragen

- Seit welcher Version gibt es Text Blocks?
- Unterschied `\n` vs `%n`?
- Unterschied `printf()` und `format()`?
- Was bedeutet `%.2f`?
- Was bedeutet `%6d`?
- Wann entsteht IllegalFormatConversionException?

---

## Merksätze

Text Block:
> Mehrzeiliger String ohne Escape-Chaos.

printf:
> Platzhalter werden durch Argumente ersetzt.

Overhead:
> Lesbarkeit > minimale Performanceunterschiede.

---

