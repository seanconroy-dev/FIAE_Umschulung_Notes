---
title: "Java OOP – Getter, Setter, Konstruktoren & Referenzen"
date: 2026-02-09
weekday: "Montag"
subject: "Programmierung"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "OOP Grundlagen"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - Getter
  - Setter
  - Konstruktor
  - Constructor Chaining
  - Referenz
  - Klasse
  - Objekt
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Java OOP – Getter, Setter, Konstruktoren & Referenzen – 2026-02-09 (ASS)

## Getter und Setter in Java

### Zweck
- Ermoeglichen kontrollierten Zugriff auf private Attribute
- Umsetzung des Prinzips der Kapselung (Encapsulation)
- Validierung von Eingaben vor dem Setzen von Werten
- Steigern Wartbarkeit und Lesbarkeit des Codes

---

## Konstruktoren

### Arten von Konstruktoren

| Konstruktor-Typ                     | Beschreibung |
|-------------------------------------|--------------|
| Default-Konstruktor                | Parameterlos; wird automatisch generiert, nur wenn kein anderer Konstruktor definiert ist |
| Parameterisierter Konstruktor      | Initialisiert Objektattribute direkt bei der Objekterzeugung; kontrollierte Startwerte |

---

## Ueberladen von Konstruktoren (Constructor Overloading)

- Mehrere Konstruktoren innerhalb einer Klasse
- Unterscheiden sich durch ihre Parameterliste
- Unterschiedliche Anzahl oder Datentypen der Parameter
- Rueckgabetyp oder Parameternamen sind nicht entscheidend

### Regeln
1. Jeder Konstruktor braucht eine eindeutige Parameterliste
2. Der Name entspricht immer dem Klassennamen
3. Konstruktoren besitzen keinen Rueckgabetyp (auch nicht `void`)

---

## Konstruktorverkettung (Constructor Chaining)

- Ein Konstruktor ruft einen anderen Konstruktor derselben Klasse auf
- `this()` muss die erste Anweisung im Konstruktor sein

### Vorteile
- Zentrale Initialisierungslogik
- Vermeidung von Code-Duplikation

---

## Beispiel: Constructor Chaining

~~~java
public class Person {
    private String name;
    private int age;

    // Default-Konstruktor
    public Person() {
        this("Unknown", 0);
    }

    // Parameterisierter Konstruktor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Getter und Setter
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}
~~~

### Beobachtungen
- Initialisierung zentral im parameterisierten Konstruktor
- Default-Konstruktor delegiert
- Reduziert redundanten Code

---

## Reference vs. Object vs. Instance vs. Class in Java

| Begriff   | Definition | Beispiel |
|-----------|------------|----------|
| Class     | Bauplan oder Vorlage fuer Objekte | `class Person { ... }` |
| Object    | Konkrete Instanz im Speicher | `new Person()` |
| Instance  | Synonym fuer Objekt; betont Zugehoerigkeit zur Klasse | `person1` ist Instanz von `Person` |
| Reference | Variable, die auf ein Objekt zeigt | `Person person1;` |

### Zusammenhang
- Eine Klasse definiert Struktur und Verhalten.
- Ein Objekt ist die konkrete Umsetzung im Speicher.
- Eine Instanz ist ein spezifisches Objekt einer Klasse.
- Eine Referenz ist die Variable, die auf ein Objekt verweist.

### Wichtige Hinweise
- Eine Referenz kann `null` sein.
- Mehrere Referenzen koennen auf dasselbe Objekt zeigen.
- Das Objekt existiert im Heap; die Referenz speichert nur die Adresse.
