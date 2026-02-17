---
title: "Datentypen und Arrays in Java – Grundlagen & AP1-Relevanz"
date: 2025-08-18
weekday: "Montag"
subject: "Programmiertechnik"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Grundlagen der Programmierung"
topic: "primitive Datentypen, Referenztypen, Arrays, Schleifen"
level: "Grundlagen"
tags:
  - Java
  - Datentypen
  - primitive Datentypen
  - Referenztypen
  - Arrays
  - for-Schleife
  - Konsolenausgabe
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

## Montag, 18-08-2025_PT_WED

### Überblick

Die Unterrichtsstunde wurde von WED durchgeführt und bestand aus freier Programmierpraxis.  
Schwerpunkt: **Datentypen**, **Variablen**, **Arrays** und deren praktische Anwendung in Java.

Ziel: Festigung der Grundlagen für die **AP1 (Abschlussprüfung Teil 1)**.

---

## Wiederholung: Datentypen in Java

Java unterscheidet grundsätzlich zwischen:

### Primitive Datentypen

Speichern direkt einen Wert.

- `int` – Ganzzahlen (z. B. `int preis = 5;`)
- `double` – Gleitkommazahlen (z. B. `double gewicht = 3.5;`)
- `boolean` – Wahrheitswerte (`true` / `false`)
- `char` – Einzelnes Zeichen (z. B. `'A'`)

### Referenztypen

Speichern eine Referenz (Adresse) auf ein Objekt im Speicher.

- `String` – Zeichenkette (z. B. `"Apfel"`)

⚠ Prüfungsrelevant:  
`String` ist **kein primitiver Datentyp**, sondern eine Klasse.

---

## IDEs im Unterricht

- Kurzdemonstration von Java-Code in **Visual Studio Code**
- VS Code war auf den Schulrechnern nicht vollständig für Java konfiguriert
- Weiterarbeit mit:
  - IntelliJ IDEA
  - Eclipse

Für die Prüfung ist die IDE unerheblich – entscheidend ist das Sprachverständnis.

---

## Praxis: Variablen & Konsolenausgabe

Beispiel:

```java
String fruit = "Banane";
double price = 0.89;

System.out.println("Frucht: " + fruit);
System.out.println("Preis: " + price + " €");
```

Wichtige Konzepte:

- Deklaration: `Datentyp name;`
- Initialisierung: `= Wert;`
- String-Verkettung mit `+`
- Ausgabe mit `System.out.println()`

---

## Einführung in Arrays

### Definition

Ein Array ist eine Datenstruktur, die mehrere Werte **gleichen Datentyps** speichert.

Eigenschaften:

- Feste Länge nach Erstellung
- Index beginnt bei `0`
- Zugriff über `arrayName[index]`
- Länge über `arrayName.length`

---

### Beispiel: Array-Deklaration

```java
String[] fruits = {"Apfel", "Banane", "Kirsche"};
double[] prices = {0.99, 0.79, 1.49};
```

Alternativ:

```java
int[] zahlen = new int[5];  // Array mit 5 Elementen (Standardwert: 0)
```

⚠ Prüfungswissen:

- `new` reserviert Speicher
- Nicht initialisierte primitive Arrays erhalten Standardwerte:
  - `int` → 0
  - `double` → 0.0
  - `boolean` → false
  - Referenztypen → null

---

## Arrays mit for-Schleife durchlaufen

```java
for (int i = 0; i < fruits.length; i++) {
    System.out.println("Frucht: " + fruits[i] + " – Preis: " + prices[i] + " €");
}
```

Wichtige Bestandteile der for-Schleife:

```java
for (Initialisierung; Bedingung; Veränderung)
```

Hier:

- `int i = 0` → Start bei Index 0
- `i < fruits.length` → Abbruchbedingung
- `i++` → Inkrement

---

## ⚠ Fachliche Einordnung: Parallele Arrays

Zwei Arrays können synchron über denselben Index verarbeitet werden.

Aber:

In professioneller Softwareentwicklung wäre ein eigenes Objekt (z. B. Klasse `Produkt`) sauberer als zwei parallele Arrays.

Für AP1 sind parallele Arrays jedoch üblich und prüfungsrelevant.

---

## Merksätze für AP1

- Arrays starten bei Index **0**
- Zugriff: `array[index]`
- Länge: `array.length`
- Arrays haben **feste Größe**
- Primitive vs. Referenztypen unterscheiden
- Schleifen werden häufig zur Array-Verarbeitung genutzt

---

## 🧠 Mini-Zusammenfassung

Diese Stunde festigte die Grundlagen von:

- Datentypen
- Variablen
- Arrays
- for-Schleifen
- Konsolenausgabe

Diese Themen sind Kernbestandteil der AP1 und bilden die Basis für spätere Inhalte wie:

- Methoden
- Klassen
- Objektorientierung
- Collections

