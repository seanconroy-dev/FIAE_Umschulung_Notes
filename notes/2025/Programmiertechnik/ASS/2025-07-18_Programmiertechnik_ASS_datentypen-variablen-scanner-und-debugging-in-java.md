---
title: "Datentypen, Variablen, Scanner und Debugging in Java"
date: 2025-07-18
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Datentypen, Variablen, Scanner, Debugging"
level: "Grundlagen"
tags:
  - Java
  - Datentypen
  - Variablen
  - Scanner
  - Eclipse
  - Debugging
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Datentypen, Variablen, Scanner & Debugging – 2025-07-18 (ASS)

---

## Grundlagen: Deklaration & Initialisierung

```java
// Deklaration = Variable wird erstellt
int alter;

// Initialisierung = Variable bekommt einen Wert
alter = 25;

// Kombination aus beidem
int alter = 25;
```

**Merksatz:**
- Deklaration → „Ich reserviere Speicher.“
- Initialisierung → „Ich lege einen Wert hinein.“

---

## Der Scanner in Java

`Scanner` ist eine Klasse zum Einlesen von Benutzereingaben über die Konsole.

```java
Scanner sc = new Scanner(System.in);
```

### Wichtige Methoden

| Methode        | Zweck                               | Beispiel                        |
|---------------|-------------------------------------|---------------------------------|
| `next()`       | Ein Wort (bis Leerzeichen)          | `String name = sc.next();`      |
| `nextLine()`   | Ganze Zeile                         | `String text = sc.nextLine();`  |
| `nextInt()`    | Ganze Zahl                          | `int alter = sc.nextInt();`     |
| `nextDouble()` | Kommazahl                           | `double wert = sc.nextDouble();`|

**Wichtig:**  
Nach `nextInt()` oder `nextDouble()` folgt oft ein zusätzliches:

```java
sc.nextLine(); // Zeilenumbruch aus dem Puffer entfernen
```

Sonst wird die nächste Texteingabe übersprungen.

---

## Aufgabe 1–3: Deklaration & Initialisierung

```java
int zahl;
String text;
double preis;

zahl = 42;
text = "Hallo Welt";
preis = 9.99;
```

---

## Aufgabe 4: Eingaben speichern & ausgeben

```java
import java.util.Scanner;

public class BenutzerDaten {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    System.out.print("Name: ");
    String name = sc.nextLine();

    System.out.print("Vorname: ");
    String vorname = sc.nextLine();

    System.out.print("Wohnort: ");
    String wohnort = sc.nextLine();

    System.out.print("Alter: ");
    int alter = sc.nextInt();
    sc.nextLine();

    System.out.print("Kontostand: ");
    double kontostand = sc.nextDouble();
    sc.nextLine();

    System.out.print("Geburtsdatum: ");
    String geburtsdatum = sc.nextLine();

    System.out.println("\n--- Deine Daten ---");
    System.out.println("Name: " + name);
    System.out.println("Vorname: " + vorname);
    System.out.println("Wohnort: " + wohnort);
    System.out.println("Alter: " + alter);
    System.out.println("Kontostand: " + kontostand + " €");
    System.out.println("Geburtsdatum: " + geburtsdatum);
  }
}
```

---

## Aufgabe 5: Subtraktion von drei Zahlen

```java
import java.util.Scanner;

public class Subtraktion {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    System.out.print("Zahl 1: ");
    double a = sc.nextDouble();

    System.out.print("Zahl 2: ");
    double b = sc.nextDouble();

    System.out.print("Zahl 3: ");
    double c = sc.nextDouble();

    double ergebnis = a - b - c;

    System.out.println(a + " - " + b + " - " + c + " = " + ergebnis);
  }
}
```

Warum `double`?  
Weil bei Berechnungen mit möglichen Kommazahlen Genauigkeit wichtig ist.

---

## Aufgabe 6: Geschwindigkeit berechnen

Formel:

```
v = s / t
```

```java
import java.util.Scanner;

public class Geschwindigkeit {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    System.out.print("Strecke in Metern (s): ");
    double strecke = sc.nextDouble();

    System.out.print("Zeit in Sekunden (t): ");
    double zeit = sc.nextDouble();

    double geschwindigkeit = strecke / zeit;

    System.out.println("Formel: s / t = v");
    System.out.println(strecke + " m / " + zeit + " s = " + geschwindigkeit + " m/s");
  }
}
```

---

## Extraaufgabe: Obstkorb

```java
public class Obst {
  public static void main(String[] args) {
    int birnen = 3;
    int aepfel = 1;
    int pflaumen = 6;

    birnen += 4;
    aepfel -= 2;
    pflaumen += 7;

    System.out.println("Birnen: " + birnen);
    System.out.println("Äpfel: " + aepfel);
    System.out.println("Pflaumen: " + pflaumen);

    int gesamt = birnen + aepfel + pflaumen;
    System.out.println("Gesamt: " + gesamt);
  }
}
```

---

## Typische Fehlerquellen

- Falscher Datentyp eingegeben → `InputMismatchException`
- `nextLine()` vergessen → Eingabe wird übersprungen
- Division durch 0 → Laufzeitfehler
- Unbenutzte Variable → IDE-Warnung

---

## Wiederholungsfragen

- Unterschied `next()` vs. `nextLine()`?
- Unterschied Deklaration vs. Initialisierung?
- Warum ist Pufferbereinigung nach `nextInt()` nötig?
- Was passiert bei falschem Datentyp?
- Wann verwendet man `double` statt `int`?
