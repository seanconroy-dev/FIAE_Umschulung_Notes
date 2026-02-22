---
title: "Method Overloading vs Method Overriding"
date: 2026-02-22
weekday: "Sonntag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "OOP – Polymorphismus"
topic: "Overloading, Overriding, Covariant Return Types"
level: "Grundlagen"
tags:
  - OOP
  - Overloading
  - Overriding
  - Polymorphismus
  - Covariant
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Sonntag, 2026-02-22_Programmiertechnik_UDEMY

## 1) Method Overloading

### Definition

Method Overloading bedeutet:

> Gleicher Methodenname, aber unterschiedliche Parameterliste.

Die Methoden befinden sich meistens in derselben Klasse.

Beispiel:

```java
class Dog {

    public void bark() {
        System.out.println("woof");
    }

    public void bark(int number) {
        for (int i = 0; i < number; i++) {
            System.out.println("woof");
        }
    }
}
```

### Regeln für Overloading

- Muss denselben Methodennamen haben
- Muss unterschiedliche Parameter haben
- Darf unterschiedliche Rückgabetypen haben
- Darf unterschiedliche Access Modifier haben
- Darf unterschiedliche Exceptions werfen
- Funktioniert mit static und Instanzmethoden

### Wichtig

Overloading = **Compile-Time Polymorphism**

Der Compiler entscheidet anhand der Parameterliste,
welche Methode aufgerufen wird.

---

## 2) Method Overriding

### Definition

Method Overriding bedeutet:

> Eine Methode aus der Elternklasse wird in der Kindklasse neu definiert.

Voraussetzung:  
IS-A Beziehung (Vererbung)

Beispiel:

```java
class Dog {
    public void bark() {
        System.out.println("woof");
    }
}

class GermanShepherd extends Dog {

    @Override
    public void bark() {
        System.out.println("woof woof woof");
    }
}
```

### Regeln für Overriding

- Gleicher Name
- Gleiche Parameter
- Nur in Vererbungshierarchie
- Nur Instanzmethoden (keine static)
- Konstruktoren können nicht überschrieben werden
- private Methoden können nicht überschrieben werden
- final Methoden können nicht überschrieben werden

### Rückgabetyp

- Muss gleich sein  
oder  
- darf ein **covarianter Rückgabetyp** sein

---

## 3) Covariant Return Type

Beim Overriding darf der Rückgabetyp:

- identisch sein  
oder
- eine Subklasse des ursprünglichen Rückgabetyps sein

Beispiel mit `clone()`:

In `Object`:

```java
protected Object clone() throws CloneNotSupportedException
```

In einer Person-Klasse:

```java
@Override
public Person clone() {
    return new Person(name, birthDate);
}
```

Warum erlaubt?

- Person ist eine Subklasse von Object
- Somit ist Person ein gültiger covarianter Rückgabetyp

Zusätzlich:

- protected → public ist erlaubt (weniger restriktiv)
- public → protected wäre nicht erlaubt

---

## 4) Overloading vs Overriding Vergleich

| Merkmal | Overloading | Overriding |
|----------|------------|------------|
| Klassenanzahl | Meist 1 Klasse | Immer 2 Klassen |
| Parameter | Müssen unterschiedlich sein | Müssen identisch sein |
| Rückgabetyp | Beliebig | Gleich oder covariant |
| Access Modifier | Beliebig | Nicht restriktiver |
| Exceptions | Beliebig | Keine breiteren checked Exceptions |
| Entscheidung | Compile-Time | Runtime |
| Polymorphismus | Statisch | Dynamisch |

---

## 5) Wichtige Konzepte

### Compile-Time Polymorphism
= Overloading  
Compiler entscheidet.

### Runtime Polymorphism
= Overriding  
JVM entscheidet zur Laufzeit.

Beispiel:

```java
Dog dog = new GermanShepherd();
dog.bark();
```

Zur Laufzeit wird die Methode der GermanShepherd-Klasse ausgeführt.

---

## 6) @Override Annotation

- Nicht verpflichtend
- Sehr empfohlen
- Compiler prüft, ob wirklich überschrieben wird
- Verhindert Fehler bei falscher Signatur

---

## 7) Merksätze

Overloading:
> Gleicher Name, andere Parameter.

Overriding:
> Gleicher Name, gleiche Parameter, neue Implementierung.

Covariant:
> Rückgabetyp darf spezifischer werden.

---

## 8) Typische Prüfungsfragen

- Unterschied Overloading / Overriding?
- Wann entscheidet der Compiler?
- Wann entscheidet die JVM?
- Was ist ein covarianter Rückgabetyp?
- Warum kann man static nicht überschreiben?
- Warum kann private nicht überschrieben werden?

---

## 9) Zusammenfassung
- Overloading: Gleicher Name, andere Parameter, Compiler entscheidet.
- Overriding: Gleicher Name, gleiche Parameter, neue Implementierung, JVM entscheidet.
- Covariant Return Type: Rückgabetyp darf spezifischer sein.
- @Override Annotation schützt vor Fehlern.
- Wichtig für Polymorphismus und flexible Softwareentwicklung.
- Verstehen der Unterschiede ist essenziell für OOP.