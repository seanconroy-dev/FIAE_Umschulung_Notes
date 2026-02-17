---
title: "java.lang.Object – Root-Klasse, toString(), Vererbung und Überschreiben"
date: 2026-02-17
weekday: "Dienstag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "OOP"
topic: "Object-Klasse, toString(), hashCode/equals, Vererbungskette"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - Object
  - java.lang
  - Vererbung
  - toString
  - equals
  - hashCode
  - Overriding
  - Polymorphie
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Dienstag, 2026-02-17_Programmiertechnik_UDEMY

# Class Object (java.lang.Object)

## Kernidee
In Java erbst du **immer** – auch wenn du es nicht hinschreibst:

- **Jede Klasse** (die nicht explizit von einer anderen Klasse erbt) erbt **implizit von `java.lang.Object`**.
- `Object` ist die **Root-Klasse** (Wurzel) der Java-Klassenhierarchie.
- Dadurch hat jede Klasse automatisch grundlegende Methoden, die du **nutzen oder überschreiben (override)** kannst.

Merksatz:  
**Alles ist am Ende ein Object** (auch Arrays).

---

# 1) Was bringt mir das in der Praxis?

Weil deine eigenen Klassen dadurch schon „Out of the box“ können:

- als Text dargestellt werden (`toString()`)
- verglichen werden (`equals(Object)`)
- einen Hashwert liefern (`hashCode()`)
- zur Laufzeit Klassendaten liefern (`getClass()`)
- (fortgeschritten) Klonen / Thread-Methoden etc.

**Prüfungs-/Praxisrelevant:**  
Am häufigsten: `toString()`, `equals()`, `hashCode()`.

---

# 2) toString() – Standardverhalten vs. Override

## Standard (von Object)
Wenn du `toString()` **nicht** überschreibst, bekommst du typischerweise:

```
ClassName@HexHash
```

Beispielausgabe:
```
Student@65ab7765
```

- `Student` = Klassenname
- `@...` = (hexadezimale Darstellung eines Hash-Werts)

Das ist für Debugging ok, aber selten das, was man fachlich ausgeben will.

---

## Override: eigene Darstellung bauen

### Beispiel: Student
```java
class Student {
    private String name;
    private int age;

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return name + " ist " + age;
    }
}
```

### Wichtiger Effekt
Java ruft `toString()` oft automatisch auf:

```java
Student max = new Student("Max", 21);
System.out.println(max);  // implizit max.toString()
```

Ausgabe:
```
Max ist 21
```

---

# 3) Vererbungskette: Object → Student → PrimarySchoolStudent

## Subklasse erbt auch Object (indirekt)
Wenn `PrimarySchoolStudent extends Student`, dann gilt:

- `PrimarySchoolStudent` erbt von `Student`
- und **damit automatisch auch** alles, was `Student` von `Object` geerbt hat

**Kumulative Vererbung:**  
Du erbst „nach oben“ die ganze Kette.

---

## Beispiel: PrimarySchoolStudent + super.toString()

```java
class PrimarySchoolStudent extends Student {
    private String parentName;

    public PrimarySchoolStudent(String name, int age, String parentName) {
        super(name, age);
        this.parentName = parentName;
    }

    @Override
    public String toString() {
        return parentName + "s Kind, " + super.toString();
    }
}
```

Beispiel:
```java
PrimarySchoolStudent jimmy = new PrimarySchoolStudent("Jimmy", 8, "Carole");
System.out.println(jimmy);
```

Ausgabe:
```
Caroles Kind, Jimmy ist 8
```

**Wichtig:**  
`super.toString()` ruft hier **Student.toString()** auf (nicht Object), weil `Student` `toString()` bereits überschrieben hat.

---

# 4) Override vs. „nur super aufrufen“

Wenn du in einer Subklasse einfach nur das machst:

```java
@Override
public String toString() {
    return super.toString();
}
```

… bekommst du im Ergebnis dasselbe Verhalten wie ohne Override (nur explizit).

Sinnvoll ist Override dann, wenn du:

- Verhalten **änderst**
- oder Verhalten **erweiterst** (wie beim ParentName-Beispiel)

---

# 5) Hinweis: Single Inheritance in Java
Java erlaubt im `extends` nur **eine** direkte Superklasse:

✅ erlaubt:
```java
class Dog extends Animal { }
```

❌ nicht erlaubt:
```java
class X extends Student, Object { } // geht nicht
```

Aber: Die Kette „nach oben“ existiert trotzdem immer.

---

# Prüfungsfokus (AP1)

- `Object` ist Root der Klassenhierarchie
- Jede Klasse erbt implizit von `Object` (wenn nichts anderes angegeben ist)
- Standard-`toString()` liefert `ClassName@Hash`
- `toString()` wird bei `println(object)` implizit aufgerufen
- Override = gleiche Signatur, anderes/erweitertes Verhalten
- `super.toString()` ruft die nächsthöhere Implementierung auf (nicht zwingend Object)

---

