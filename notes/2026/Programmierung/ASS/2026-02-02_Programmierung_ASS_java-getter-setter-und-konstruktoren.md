---
title: "Java – Getter, Setter und Konstruktoren"
date: 2026-02-02
weekday: "Montag"
subject: "Programmierung"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Getter, Setter, Konstruktoren"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - Encapsulation
  - Getter
  - Setter
  - Konstruktor
  - Objektorientierung
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Java – Getter, Setter und Konstruktoren – 2026-02-02 (ASS)

## Getters und Setters in Java

### Zweck von Gettern und Settern
- Kontrollierter Zugriff auf Klassenattribute (Felder)
- Umsetzung des Prinzips der Kapselung (Encapsulation)
- Schutz interner Daten vor direktem Zugriff von außen
- Moeglichkeit zur Validierung von Eingaben
- Bessere Wartbarkeit und Erweiterbarkeit des Codes

---

### Getter
- Dienen zum Auslesen privater Attribute
- Haben in der Regel keinen Seiteneffekt
- Rueckgabetyp entspricht dem Datentyp des Attributs
- Namenskonvention: `getAttributName()`

Beispiel:

~~~java
public class Person {
    private String name;

    public String getName() {
        return name;
    }
}
~~~

---

### Setter
- Dienen zum Setzen oder Aendern privater Attribute
- Rueckgabetyp ist immer `void`
- Koennen Pruefungen oder Zusatzlogik enthalten
- Namenskonvention: `setAttributName(...)`

Beispiel mit Validierung:

~~~java
public class Person {
    private int alter;

    public void setAlter(int alter) {
        if (alter >= 0) {
            this.alter = alter;
        }
    }
}
~~~

---

### Wichtige Hinweise
- Nicht jedes Attribut benoetigt zwingend einen Setter
- Lesender Zugriff kann erlaubt sein, schreibender bewusst verboten
- Getter und Setter sind kein Selbstzweck, sondern ein Kontrollmechanismus
- Konstante oder unveraenderliche Werte (z. B. ID) erhalten oft keinen Setter

---

## Konstruktoren in Java

### Zweck von Konstruktoren
- Werden beim Erzeugen eines Objekts automatisch aufgerufen
- Dienen der Initialisierung von Objektattributen
- Stellen sicher, dass ein Objekt in einem gueltigen Startzustand ist

---

### Merkmale eines Konstruktors
1. Name identisch mit dem Klassennamen
2. Kein Rueckgabewert (auch nicht `void`)
3. Kann Parameter haben, muss aber nicht
4. Kann ueberladen werden (mehrere Varianten)
5. In der Regel `public`, damit Objekte von außen erzeugt werden koennen

---

### Default-Konstruktor
- Keine Parameter
- Wird nur automatisch erzeugt, wenn kein anderer Konstruktor definiert ist
- Erlaubt leere Objekte

Beispiel:

~~~java
public class Person {
    public Person() {
        // leerer Konstruktor
    }
}
~~~

---

### Parametrisierter Konstruktor
- Setzt Attribute direkt beim Erzeugen
- Verhindert unvollstaendige oder inkonsistente Objekte
- Verwendung von `this.attribut` zur Unterscheidung

Beispiel:

~~~java
public class Person {
    private String name;
    private int alter;

    public Person(String name, int alter) {
        this.name = name;
        this.alter = alter;
    }
}
~~~

---

## Typischer Praxisansatz

- Attribute als `private`
- Initialisierung ueber Konstruktor
- Zugriff ueber Getter
- Setter nur, wenn Aenderbarkeit gewollt ist
- Immutable-Ansatz bei sensiblen Daten (kein Setter)

