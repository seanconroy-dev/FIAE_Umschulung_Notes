---
title: "Datentypen, Scanner und Entwicklungsgrundlagen in Java"
date: 2025-07-25
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Scanner, Datentypen, IDE, Rechenoperationen"
level: "Grundlagen"
tags:
  - Java
  - Scanner
  - Datentypen
  - Variablen
  - IDE
  - Eclipse
  - IntelliJ
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Datentypen, Scanner und Entwicklungsgrundlagen – 2025-07-25 (ASS)

---

## Allgemeine Hinweise

- **Event**: Ereignis im Programm (z. B. Tastatureingabe, Mausklick).
- **`.close()`**: Schließt Ressourcen wie `Scanner` oder Streams.
- **Strg + Shift + 7**: Blockkommentar in IntelliJ/Eclipse.
- **Escape-Sequenzen in Java**
  - `\t` → Tabulator
  - `\n` → Zeilenumbruch

---

## Entwicklungsumgebung & Grundlagen

- Scanner rot markiert → `import java.util.Scanner;` fehlt.
- RM → *Show in → System Explorer* → Datei im Explorer öffnen.
- Reihenfolge:
  1. JDK (SDK) installieren
  2. IDE installieren
- `java.util` enthält u. a. `Scanner`.
- **Textblock (seit Java 15)**:
  ```java
  String text = """
  Mehrzeiliger
  Text
  """;
  ```
- Telefonnummern & Postleitzahlen → **als String speichern**, da führende Nullen sonst verloren gehen.

### Hinweis zu LTS
LTS-Versionen (Long Term Support) sind bei kommerzieller Nutzung bestimmter Distributionen kostenpflichtig (z. B. Oracle JDK). OpenJDK-Distributionen können kostenfrei sein.  
Neue Java-Version → alte Version ggf. sauber deinstallieren.

---

## Scanner-Beispiel – Aufgabe 4

```java
Scanner sc = new Scanner(System.in);

System.out.println("Vorname eingeben: ");
String vorname = sc.next();

System.out.println("Nachname eingeben: ");
String nachname = sc.next();

System.out.println("Wohnort eingeben: ");
String wohnort = sc.next();

System.out.println("Alter eingeben: ");
int alter = sc.nextInt();

System.out.println("Kontostand eingeben: ");
double kontostand = sc.nextDouble();

System.out.println("Geburtsdatum eingeben: ");
String geburtsdatum = sc.next();

System.out.println("Aufgabe 4:");
System.out.println("Vorname:\t" + vorname);
System.out.println("Nachname:\t" + nachname);
System.out.println("Wohnort:\t" + wohnort);
System.out.println("Alter:\t\t" + alter);
System.out.println("Kontostand:\t" + kontostand);
System.out.println("Geburtsdatum:\t" + geburtsdatum);
```

---

## Komplette Beispielklasse – Datentypen & Variablen

```java
import java.util.Scanner;

public class AufgDatentypenVariablen {
    public static void main(String[] args) {

        // Deklaration
        int a;
        float b;
        char c;

        // Initialisierung
        a = 15;
        b = 3.3f;
        c = '&';

        Scanner sc = new Scanner(System.in);

        System.out.println("Vorname eingeben: ");
        String vorname = sc.next();

        System.out.println("Nachname eingeben: ");
        String nachname = sc.next();

        System.out.println("Wohnort eingeben: ");
        String wohnort = sc.next();

        System.out.println("Alter eingeben: ");
        int alter = sc.nextInt();

        System.out.println("Kontostand eingeben: ");
        double kontostand = sc.nextDouble();

        System.out.println("Geburtsdatum eingeben: ");
        String geburtsdatum = sc.next();

        System.out.println("Aufgabe 4:");
        System.out.println("Vorname:\t" + vorname);
        System.out.println("Nachname:\t" + nachname);
        System.out.println("Wohnort:\t" + wohnort);
        System.out.println("Alter:\t\t" + alter);
        System.out.println("Kontostand:\t" + kontostand);
        System.out.println("Geburtsdatum:\t" + geburtsdatum);

        // Rechenoperationen
        System.out.println("Erste Zahl eingeben: ");
        int x = sc.nextInt();
        System.out.println("Zweite Zahl eingeben: ");
        int y = sc.nextInt();
        System.out.println("Dritte Zahl eingeben: ");
        int z = sc.nextInt();

        int ergMinus = x - y - z;
        System.out.println(x + "-" + y + "-" + z + " = " + ergMinus);

        System.out.println("Erste Kommazahl eingeben: ");
        double h = sc.nextDouble();
        System.out.println("Zweite Kommazahl eingeben: ");
        double u = sc.nextDouble();
        System.out.println("Dritte Kommazahl eingeben: ");
        double p = sc.nextDouble();

        double ergKomma = h - u - p;
        System.out.println(h + "-" + u + "-" + p + " = " + ergKomma);

        // Geschwindigkeit
        System.out.println("Strecke in Meter eingeben: ");
        double s = sc.nextDouble();
        System.out.println("Zeit in Sekunden eingeben: ");
        double t = sc.nextDouble();

        if (t != 0) {
            double v = s / t;
            System.out.println("Formel: s / t = v => " + s + "m / " + t + "s = " + v + "m/s");
        } else {
            System.out.println("Zeit darf nicht 0 sein.");
        }

        sc.close();
    }
}
```

---

## Wichtige Korrekturen & Hinweise

- Variablennamen beginnen konventionsgemäß **klein** (camelCase).
- Division durch 0 vermeiden → vorher prüfen.
- `next()` liest nur ein Wort.  
  Für ganze Zeilen besser `nextLine()` verwenden.
- Ressourcen immer mit `.close()` schließen.

---

## Kerngedanken

- Scanner korrekt importieren.
- Deklaration ≠ Initialisierung.
- Escape-Sequenzen verbessern Formatierung.
- Strings für Werte mit führenden Nullen verwenden.
- SDK vor IDE installieren.
- Sichtbarkeit, Struktur und saubere Benennung sind Teil professioneller Praxis.

