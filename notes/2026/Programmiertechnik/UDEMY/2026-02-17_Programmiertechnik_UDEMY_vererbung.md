---
title: "Vererbung in Java – extends, super(), Überschreiben und Polymorphie"
date: 2026-02-17
weekday: "Dienstag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "OOP"
topic: "Inheritance, extends, super(), Method Overriding, Polymorphism"
level: "Grundlagen"
tags:
  - OOP
  - Vererbung
  - Inheritance
  - extends
  - super
  - Konstruktor
  - Overriding
  - Polymorphie
  - Java
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Dienstag, 2026-02-17_Programmiertechnik_UDEMY

# Vererbung (Inheritance) – Kernideen

Vererbung ist ein OOP-Konzept zur **Code-Wiederverwendung** und **Strukturierung von Klassen** in einer Eltern-Kind-Hierarchie.

- **Superklasse (Parent)**: Allgemeine Eigenschaften/Verhalten
- **Subklasse (Child)**: Erbt und spezialisiert

Merksatz:  
**Dog ist ein Animal** (is-a-Beziehung).

---

# 1) extends – Wie Vererbung in Java entsteht

```java
class Dog extends Animal { }
```

- `extends` verbindet Subklasse mit Superklasse
- Eine Klasse kann **nur eine** direkte Superklasse haben (Single Inheritance)

---

# 2) super() – Konstruktor der Superklasse aufrufen

## Wichtige Regeln

- `super()` ruft einen Konstruktor der Superklasse auf
- `super(...)` muss **immer die erste Anweisung** im Konstruktor sein
- Wenn du `super(...)` nicht schreibst, versucht Java automatisch `super()` aufzurufen
- Gibt es in der Superklasse **keinen** No-Args-Konstruktor, musst du `super(...)` **explizit** mit passenden Parametern aufrufen

---

## Beispiel: Animal (Superklasse)

```java
class Animal {
    protected String type;
    protected String size;
    protected double weight;

    public Animal() { }

    public Animal(String type, String size, double weight) {
        this.type = type;
        this.size = size;
        this.weight = weight;
    }

    public void move(String speed) {
        System.out.println(type + " moves " + speed);
    }

    public void makeNoise() {
        System.out.println(type + " makes some kind of noise");
    }

    @Override
    public String toString() {
        return "Animal{" +
                "type='" + type + '\'' +
                ", size='" + size + '\'' +
                ", weight=" + weight +
                '}';
    }
}
```

**Warum `protected`?**  
- `private` → Subklassen kommen nicht dran  
- `protected` → Subklassen dürfen zugreifen (plus Klassen im gleichen Package)

---

## Beispiel: Dog (Subklasse) – Konstruktor mit super(...)

```java
class Dog extends Animal {
    private String earShape;
    private String tailShape;

    public Dog(String type, double weight, String earShape, String tailShape) {
        super(type, deriveSize(weight), weight);
        this.earShape = earShape;
        this.tailShape = tailShape;
    }

    public Dog(String type, double weight) {
        this(type, weight, "perky", "curled");
    }

    private static String deriveSize(double weight) {
        if (weight < 15) return "small";
        if (weight < 35) return "medium";
        return "large";
    }

    @Override
    public String toString() {
        return "Dog{" +
                "earShape='" + earShape + '\'' +
                ", tailShape='" + tailShape + '\'' +
                "} " + super.toString();
    }
}
```

Prüfungsrelevant:
- **Constructor Chaining**: `this(...)` ruft anderen Konstruktor der gleichen Klasse
- `super(...)` ruft Konstruktor der Elternklasse
- `this(...)` und `super(...)` können **nicht** zusammen im selben Konstruktor vorkommen (beide müssten „first“ sein)

---

# 3) Überschreiben (Method Overriding)

## Was ist Overriding?

Eine Subklasse definiert eine Methode **mit gleicher Signatur** wie in der Superklasse:

- gleicher Name
- gleiche Parameterliste

→ Java nimmt zur Laufzeit die passendste Methode (dynamische Bindung).

Beispiel:

```java
@Override
public void makeNoise() {
    bark();
    System.out.println();
}
```

**Wichtig:**  
Wenn du eine Methode überschreibst und sie leer lässt, ersetzt du das Verhalten komplett.

---

## Verhalten erweitern statt ersetzen

```java
@Override
public void move(String speed) {
    super.move(speed); // Verhalten der Superklasse
    System.out.println("Dogs walk, run, and wag their tail");
}
```

3 typische Varianten beim Overriding:

1. **Ersetzen** (komplett anderes Verhalten)
2. **Delegieren** (nur `super.method()` – meist redundant)
3. **Erweitern** (`super.method()` + eigenes Verhalten)

---

# 4) Subklassenspezifische Methoden

Dog-spezifisches Verhalten wird **nur in Dog** implementiert:

```java
private void bark() { System.out.print("woof! "); }
private void run()  { System.out.print("dog running "); }
private void walk() { System.out.print("dog walking "); }
private void wagTail(){ System.out.print("tail wagging "); }
```

Beispiel: Dog-Move abhängig von Speed:

```java
@Override
public void move(String speed) {
    super.move(speed);

    if ("slow".equals(speed)) {
        walk();
        wagTail();
    } else {
        run();
        bark();
    }
    System.out.println();
}
```

---

# 5) Polymorphie – „Animal hat viele Formen“

Polymorphie bedeutet: Eine Variable vom Typ `Animal` kann ein `Dog` oder `Fish` sein.

```java
static void doAnimalStuff(Animal animal, String speed) {
    animal.makeNoise();
    animal.move(speed);
    System.out.println(animal);
    System.out.println("____");
}
```

Dann funktioniert:

```java
Animal a = new Animal("Generic animal", "huge", 400);
Dog d = new Dog("Yorkie", 15);
doAnimalStuff(a, "slow");
doAnimalStuff(d, "fast");
```

Wichtig:
- Der Parameter ist `Animal`
- Übergeben werden kann jede Subklasse (Dog, Fish, …)
- Welche Methode ausgeführt wird, entscheidet Java **zur Laufzeit** (Dynamic Dispatch)

---

# 6) Fish als zweite Subklasse (Kurz)

```java
class Fish extends Animal {
    private int gills;
    private int fins;

    public Fish(String type, double weight, int gills, int fins) {
        super(type, "small", weight);
        this.gills = gills;
        this.fins = fins;
    }

    @Override
    public void move(String speed) {
        System.out.print("muscles moving ");
        if ("fast".equals(speed)) {
            System.out.print("backfin moving ");
        }
        System.out.println();
    }

    @Override
    public String toString() {
        return "Fish{" +
                "gills=" + gills +
                ", fins=" + fins +
                "} " + super.toString();
    }
}
```

---

# Prüfungsfokus (AP1)

- `extends` erklären (is-a)
- `super(...)` Regeln (muss first sein, kein Default-Konstruktor → explizit nötig)
- Overriding vs. Overloading unterscheiden
- Polymorphie erklären (Basistyp-Referenz, Laufzeitbindung)
- Sichtbarkeiten: `private` vs `protected`

---

