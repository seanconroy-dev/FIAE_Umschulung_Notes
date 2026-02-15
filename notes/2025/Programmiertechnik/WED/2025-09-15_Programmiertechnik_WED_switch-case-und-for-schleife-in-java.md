---
title: "Switch-Case und For-Schleife in Java"
date: 2025-09-15
weekday: "Montag"
subject: "Programmiertechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Kontrollstrukturen"
topic: "switch, for-Schleife, Schleifenübungen"
level: "Grundlagen"
tags:
  - switch
  - switch-expression
  - for-loop
  - Schleifen
  - Kontrollstrukturen
  - FizzBuzz
  - SumUp
  - EvenOdd
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Switch-Case & For-Schleife (2025-09-15 · WED)

---

# FOR LOOP (for-Schleife)

## Was ist eine for-Schleife?

Eine **for-Schleife** ist eine kopfgesteuerte Schleife.

Sie wird verwendet, wenn:
- die Anzahl der Wiederholungen bekannt ist
- ein Zähler benötigt wird
- eine Sequenz von Zahlen durchlaufen werden soll

---

## Syntax

```java
for (Initialisierung; Bedingung; Veränderung) {
    // Anweisungen
}
```

Beispiel:

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

Bedeutung:
- `int i = 0` → Startwert
- `i < 5` → Abbruchbedingung
- `i++` → Schrittweite (i = i + 1)

---

## Wofür wird sie genutzt?

- Zählerschleifen
- Durchlaufen von Arrays oder Listen
- Wiederholte Berechnungen
- Tabellen, Matrizen
- Algorithmische Muster

---

## Vorwärts zählen

```java
for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}
```

---

## Rückwärts zählen

```java
for (int i = 5; i >= 1; i--) {
    System.out.println(i);
}
```

---

## Schritte überspringen (Schrittweite verändern)

### In Zweierschritten

```java
for (int i = 0; i <= 10; i += 2) {
    System.out.println(i);
}
```

### Rückwärts in Zweierschritten

```java
for (int i = 10; i >= 0; i -= 2) {
    System.out.println(i);
}
```

---

## Dauerschleife (Endlosschleife)

```java
for (;;) {
    System.out.println("Läuft endlos");
}
```

Oder:

```java
for (int i = 0; true; i++) {
    System.out.println(i);
}
```

⚠ Nur mit Abbruchbedingung sinnvoll (z. B. `break`).

---

## Vorteile der for-Schleife

- Kompakt
- Lesbar
- Zähler klar definiert
- Weniger Fehleranfällig als while bei Zählerschleifen

---

## Nachteile

- Weniger flexibel bei komplexen Abbruchbedingungen
- Für unbekannte Wiederholungen oft ungeeignet

---

# ÜBUNG 1 – SumUp

## Aufgabe

Berechne die Summe von 1 bis 100.

---

## Lösung

```java
public class SumUp {
    public static void main(String[] args) {

        int summe = 0;

        for (int i = 1; i <= 100; i++) {
            summe += i;
        }

        System.out.println("Summe: " + summe);
    }
}
```

Ergebnis:
```
Summe: 5050
```

---

## Erweiterung – Zwischenergebnisse

```java
public class SumUp {
    public static void main(String[] args) {

        int summe = 0;

        for (int i = 1; i <= 100; i++) {
            int alt = summe;
            summe += i;
            System.out.println(alt + " + " + i + " = " + summe);
        }

        System.out.println("Summe: " + summe);
    }
}
```

---

# ÜBUNG 2 – EvenOdd

```java
public class EvenOdd {
    public static void main(String[] args) {

        for (int i = 1; i <= 20; i++) {

            if (i % 2 == 0) {
                System.out.println(i + " ist gerade");
            } else {
                System.out.println(i + " ist ungerade");
            }
        }
    }
}
```

Kernlogik:
- `i % 2 == 0` → gerade
- sonst → ungerade

---

# ÜBUNG 3 – FizzBuzz

```java
public class FizzBuzz {
    public static void main(String[] args) {

        for (int i = 1; i <= 30; i++) {

            if (i % 15 == 0) {
                System.out.println("FizzBuzz");
            } else if (i % 3 == 0) {
                System.out.println("Fizz");
            } else if (i % 5 == 0) {
                System.out.println("Buzz");
            } else {
                System.out.println(i);
            }
        }
    }
}
```

Wichtig:
- Erst `% 15` prüfen!
- Sonst würden 15, 30 nur als Fizz erkannt.

---

# FizzBuzz – Erweiterung 1 (Benutzereingabe)

```java
import java.util.Scanner;

public class FizzBuzz {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Obergrenze eingeben: ");
        int max = sc.nextInt();

        for (int i = 1; i <= max; i++) {

            if (i % 15 == 0) {
                System.out.println("FizzBuzz");
            } else if (i % 3 == 0) {
                System.out.println("Fizz");
            } else if (i % 5 == 0) {
                System.out.println("Buzz");
            } else {
                System.out.println(i);
            }
        }

        sc.close();
    }
}
```

---

# FizzBuzz – Erweiterung 2 (Benutzerdefinierte Regeln)

```java
import java.util.Scanner;

public class FizzBuzz {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Fizz-Zahl: ");
        int fizz = sc.nextInt();

        System.out.print("Buzz-Zahl: ");
        int buzz = sc.nextInt();

        if (fizz == 0 || buzz == 0) {
            System.out.println("Keine Teilung durch 0 erlaubt!");
            return;
        }

        System.out.print("Obergrenze: ");
        int max = sc.nextInt();

        for (int i = 1; i <= max; i++) {

            if (i % fizz == 0 && i % buzz == 0) {
                System.out.println("FizzBuzz");
            } else if (i % fizz == 0) {
                System.out.println("Fizz");
            } else if (i % buzz == 0) {
                System.out.println("Buzz");
            } else {
                System.out.println(i);
            }
        }

        sc.close();
    }
}
```

---

# Kernaussagen

- for = kopfgesteuerte Schleife
- Ideal bei bekannter Wiederholungsanzahl
- Schrittweite frei definierbar
- Endlosschleifen möglich
- `%` (Modulo) ist zentral für Teilbarkeitslogik
- Reihenfolge der Bedingungen ist entscheidend
