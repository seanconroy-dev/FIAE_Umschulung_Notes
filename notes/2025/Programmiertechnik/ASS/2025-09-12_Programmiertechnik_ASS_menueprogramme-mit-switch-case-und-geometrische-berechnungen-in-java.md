---
title: "Menüprogramme mit switch-case und geometrische Berechnungen in Java"
date: 2025-09-12
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "switch-case, Scanner, mathematische Berechnungen"
level: "Grundlagen"
tags:
  - Java
  - switch-case
  - Scanner
  - Kontrollstrukturen
  - Mathematische_Berechnungen
  - printf
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Menüprogramme und geometrische Berechnungen in Java – 2025-09-12 (ASS)

---

## Aufgabe 1: Geschlecht auswählen

### Aufgabenstellung

- Name eingeben
- Menüauswahl:
  - 1 = männlich
  - 2 = weiblich
  - 3 = divers
  - 0 = Exit
- Ausgabe je nach Auswahl
- Falsche Eingabe → Fehlermeldung
- Umsetzung mit `switch-case`

---

### Beispielcode

```java
import java.util.Scanner;

public class AufgabeGeschlecht {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Bitte Ihren Namen eingeben:");
        String name = sc.nextLine().trim();

        System.out.println("Bitte Ihr Geschlecht auswählen:");
        System.out.println("1. Männlich");
        System.out.println("2. Weiblich");
        System.out.println("3. Divers");
        System.out.println("0. Exit");

        while (!sc.hasNextInt()) {
            System.out.println("Ungültige Eingabe. Bitte eine Zahl eingeben.");
            sc.next();
        }

        int choice = sc.nextInt();

        switch (choice) {
            case 1 -> System.out.println("Herr " + name);
            case 2 -> System.out.println("Frau " + name);
            case 3 -> System.out.println(name);
            case 0 -> System.out.println("Programm wird beendet...");
            default -> System.out.println("Versuchen Sie es nochmal...");
        }

        sc.close();
    }
}
```

---

### Lernnotizen

- Strings vergleichen mit `"abc".equals(x)` statt `==`
- Groß/Kleinschreibung ignorieren mit `.equalsIgnoreCase()`
- `trim()`, `toUpperCase()`, `toLowerCase()` für String-Manipulation
- `switch-case` ideal für feste Menüauswahlen
- Ternary-Operator:

```java
String result = (a > b) ? "a ist größer" : "b ist größer";
```

---

## Aufgabe 2: Geometrische Formen berechnen

### Menü

- 1 = Zylinder
- 2 = Kugel
- 3 = Quader

---

### Formeln

Zylinder  
- Volumen: V = π r² h  
- Oberfläche: A = 2 π r (r + h)

Kugel  
- Umfang: U = 2 π r  
- Volumen: V = (4/3) π r³  
- Oberfläche: A = 4 π r²

Quader  
- Volumen: V = a b c  
- Oberfläche: A = 2 (ab + bc + ac)  
- Raumdiagonale: √(a² + b² + c²)  
- Gesamtkantenlänge: 4 (a + b + c)

---

### Beispielcode

```java
import java.util.Scanner;

public class AufgabeGeometrie {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Bitte eine Form auswählen:");
        System.out.println("1. Zylinder");
        System.out.println("2. Kugel");
        System.out.println("3. Quader");

        int choice = sc.nextInt();

        switch (choice) {
            case 1 -> {
                System.out.println("Bitte die Höhe eingeben:");
                double h = sc.nextDouble();
                System.out.println("Bitte den Radius eingeben:");
                double r = sc.nextDouble();

                double volumen = Math.PI * r * r * h;
                double oberflaeche = 2 * Math.PI * r * (r + h);

                System.out.printf("Volumen: %.3f%nOberfläche: %.3f%n", volumen, oberflaeche);
            }

            case 2 -> {
                System.out.println("Bitte den Radius eingeben:");
                double r = sc.nextDouble();

                double umfang = 2 * Math.PI * r;
                double volumen = (4.0 / 3.0) * Math.PI * r * r * r;
                double oberflaeche = 4 * Math.PI * r * r;

                System.out.printf(
                    "Umfang: %.3f%nVolumen: %.3f%nOberfläche: %.3f%n",
                    umfang, volumen, oberflaeche
                );
            }

            case 3 -> {
                System.out.println("Bitte Seite a eingeben:");
                double a = sc.nextDouble();
                System.out.println("Bitte Seite b eingeben:");
                double b = sc.nextDouble();
                System.out.println("Bitte Seite c eingeben:");
                double c = sc.nextDouble();

                double volumen = a * b * c;
                double oberflaeche = 2 * (a*b + b*c + a*c);
                double raumdiagonale = Math.sqrt(a*a + b*b + c*c);
                double gesamtkanten = 4 * (a + b + c);

                System.out.printf(
                    "Volumen: %.3f%nOberfläche: %.3f%nRaumdiagonale: %.3f%nGesamtkantenlänge: %.3f%n",
                    volumen, oberflaeche, raumdiagonale, gesamtkanten
                );
            }

            default -> System.out.println("Ungültige Auswahl.");
        }

        sc.close();
    }
}
```

---

## Scanner & Ausgabeformat

### Scanner

- `nextLine()` → ganze Zeile
- `nextInt()`, `nextDouble()` → Zahlen
- Nach `nextInt()` ggf. zusätzlich `nextLine()` zum Leeren des Puffers

### printf

- `%.3f` → 3 Nachkommastellen
- `%n` → plattformunabhängiger Zeilenumbruch

---

## Typische Fehlerquellen

- `4/3` ist Integerdivision → ergibt 1  
  → Für Kugelvolumen `4.0 / 3.0` verwenden
- Klassischer `switch` braucht `break`
- Pfeil-Switch (`case x ->`) benötigt kein `break`

---

## Kernaussagen

- `switch-case` ist ideal für strukturierte Menüprogramme
- Scanner korrekt verwenden und Puffer beachten
- Mathematische Funktionen mit `Math.PI` und `Math.sqrt`
- Mit `printf` saubere und formatierte Ausgaben erzeugen

