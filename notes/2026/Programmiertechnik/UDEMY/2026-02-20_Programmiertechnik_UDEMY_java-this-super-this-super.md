---
title: "Java – this, super, this() & super()"
date: 2026-02-20
weekday: "Freitag"
subject: 'Programmiertechnik'
instructor: 'UDEMY'
program: "FIAE Umschulung 2025-2027"
module: "OOP Grundlagen"
topic: "this vs super, Constructor Chaining"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - this
  - super
  - Konstruktor
  - Vererbung
  - Constructor Chaining
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Java – this, super, this() & super()

## 1) `this` und `super` (ohne Klammern)

### `this`

`this` verweist auf das **aktuelle Objekt** (Instanz der Klasse).

Verwendung:

- Zugriff auf Instanzvariablen  
- Zugriff auf Methoden der eigenen Klasse  
- Auflösung von Namenskonflikten (Parameter = Feldname)  
- Übergabe des aktuellen Objekts als Parameter  

Beispiel:

```java
class Person {
    private String name;

    public Person(String name) {
        this.name = name; // Feld = Parameter
    }

    public void register() {
        Database.save(this); // Übergabe des aktuellen Objekts
    }
}
```

Ohne `this` wäre `name = name;` bedeutungslos,  
da der Parameter sich selbst zugewiesen würde.

---

### `super`

`super` verweist auf die **Elternklasse**.

Verwendung:

- Zugriff auf geerbte Variablen  
- Aufruf überschriebener Methoden  

Beispiel:

```java
class Person {
    void print() {
        System.out.println("Person");
    }
}

class Student extends Person {
    void print() {
        System.out.println("Student");
        super.print(); // Aufruf der Elternmethode
    }
}
```

Würde man statt `super.print()` einfach `print()` schreiben,  
würde die Methode sich selbst rekursiv aufrufen.

---

## Wichtige Regel

`this` und `super` können **nicht in statischen Kontexten** verwendet werden.

Warum?

Statische Elemente gehören zur Klasse,  
`this` und `super` beziehen sich auf eine Instanz (Objekt).

---

## 2) `this()` und `super()` (mit Klammern)

Hier handelt es sich um **Konstruktoraufrufe**.

---

### `this()`

- Ruft einen anderen Konstruktor derselben Klasse auf  
- Wird für Constructor Chaining verwendet  
- Muss die **erste Anweisung im Konstruktor** sein  

Beispiel (gute Variante):

```java
class Person {
    private String name;
    private int age;

    public Person() {
        this("Unbekannt", 0);
    }

    public Person(String name) {
        this(name, 0);
    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```

Nur der letzte Konstruktor initialisiert die Variablen.  
Die anderen rufen ihn auf.

Das nennt man **Constructor Chaining**.

Vorteile:

- Kein doppelter Code  
- Weniger Fehler  
- Klare Verantwortlichkeit  

---

### Schlechte Variante (Code-Duplikation)

```java
class Person {
    private String name;
    private int age;

    public Person() {
        this.name = "Unbekannt";
        this.age = 0;
    }

    public Person(String name) {
        this.name = name;
        this.age = 0;
    }
}
```

Hier wird Initialisierungslogik mehrfach geschrieben → fehleranfällig.

---

## 3) `super()`

`super()` ruft den Konstruktor der Elternklasse auf.

- Muss ebenfalls die **erste Anweisung im Konstruktor** sein  
- Wird automatisch eingefügt, wenn kein Konstruktoraufruf geschrieben wird  
- Standardmäßig wird `super()` ohne Parameter aufgerufen  

Beispiel:

```java
class Shape {
    int x;
    int y;

    Shape(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

class Rectangle extends Shape {
    int width;
    int height;

    Rectangle(int x, int y, int width, int height) {
        super(x, y); // ruft Parent-Konstruktor
        this.width = width;
        this.height = height;
    }
}
```

Der Parent-Konstruktor initialisiert `x` und `y`.  
Der Child-Konstruktor initialisiert `width` und `height`.

---

## Wichtige Besonderheit (prüfungsrelevant)

Wenn die Elternklasse **keinen parameterlosen (No-Arg) Konstruktor besitzt**,  
fügt der Compiler **kein** automatisches `super()` ein.

In diesem Fall muss `super(...)` explizit mit passenden Parametern  
aufgerufen werden — sonst entsteht ein **Compile-Fehler**.

---

## 4) Zentrale Regeln

- `this()` oder `super()` müssen immer **erste Zeile im Konstruktor** sein  
- Ein Konstruktor darf **entweder** `this()` **oder** `super()` enthalten  
- Niemals beide im selben Konstruktor  
- Der Compiler fügt automatisch `super()` ein, wenn nichts angegeben ist  
- Kein Zugriff auf `this` oder `super` in statischen Methoden  

---

## 5) Zusammenfassung

| Begriff     | Bedeutung |
|------------|------------|
| `this`     | aktuelles Objekt |
| `super`    | Elternklasse |
| `this()`   | ruft anderen Konstruktor derselben Klasse auf |
| `super()`  | ruft Konstruktor der Elternklasse auf |

---

## Prüfungsrelevant

- Unterschied Objektbezug (`this`) vs. Vererbungsbezug (`super`)  
- Constructor Chaining  
- Erste-Anweisung-Regel  
- Automatischer `super()`-Aufruf  
- Compile-Fehler bei fehlendem Parent-NoArg-Konstruktor  
- Kein Zugriff in statischen Methoden  

---

Sauberer Konstruktorcode spart später Debugging-Zeit.  
Constructor Chaining verhindert Code-Duplikation.  
Vererbung funktioniert nur korrekt, wenn Initialisierung klar strukturiert ist.

