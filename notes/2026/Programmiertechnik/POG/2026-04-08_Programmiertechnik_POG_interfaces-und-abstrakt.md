---
title: 'Interfaces und Abstraktalgorithmen'
date: 2026-04-08
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: ''
topic: ''
level: ''
tags:
  -
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Interfaces und Abstraktalgorithmen

## Interfaces
Ein Interface ist eine Sammlung von Methoden, die von einer Klasse implementiert werden müssen. Es definiert einen Vertrag, den die implementierende Klasse erfüllen muss. Ein Interface enthält keine Implementierung, sondern nur die Methodensignaturen.
In Java wird ein Interface mit dem Schlüsselwort `interface` definiert. Eine Klasse, die ein Interface implementiert, muss alle Methoden des Interfaces implementieren.
```java
public interface Fahrzeug {
    void fahren();
    void bremsen();
}
public class Auto implements Fahrzeug {
    @Override
    public void fahren() {
        System.out.println("Das Auto fährt.");
    }

    @Override
    public void bremsen() {
        System.out.println("Das Auto bremst.");
    }
}
```In diesem Beispiel definiert das Interface `Fahrzeug` zwei Methoden: `fahren()` und `bremsen()`. Die Klasse `Auto` implementiert das Interface und muss daher beide Methoden implementieren.

## Abstrakte Klassen
Eine abstrakte Klasse ist eine Klasse, die nicht instanziiert werden kann und mindestens eine abstrakte Methode enthält. Eine abstrakte Methode ist eine Methode, die keine Implementierung hat und von den Unterklassen implementiert werden muss. Abstrakte Klassen können auch konkrete Methoden enthalten, die von den Unterklassen geerbt werden.
In Java wird eine abstrakte Klasse mit dem Schlüsselwort `abstract` definiert. Eine Klasse, die von einer abstrakten Klasse erbt, muss alle abstrakten Methoden implementieren oder selbst als abstrakt deklariert werden.
## zweck von abstrakten Klassen
Abstrakte Klassen dienen dazu, eine gemeinsame Basis für verwandte Klassen zu schaffen. Sie ermöglichen es, gemeinsame Eigenschaften und Methoden zu definieren, die von den Unterklassen geerbt werden können, während sie gleichzeitig die Flexibilität bieten, spezifische Implementierungen in den Unterklassen bereitzustellen.

## abstrakte methoden 
Abstrakte Methoden sind Methoden, die in einer abstrakten Klasse definiert sind und keine Implementierung haben. Sie müssen von den Unterklassen implementiert werden. Abstrakte Methoden dienen dazu, sicherzustellen, dass bestimmte Methoden in den Unterklassen bereitgestellt werden, während die allgemeine Struktur der Klasse in der abstrakten Klasse definiert wird.



```java
public abstract class Tier {
    public abstract void machenGeräusch();
    public void schlafen() {
        System.out.println("Das Tier schläft.");
    }
}
public class Hund extends Tier {
    @Override
    public void machenGeräusch() {
        System.out.println("Der Hund bellt.");
    }
}
```In diesem Beispiel definiert die abstrakte Klasse `Tier` eine abstrakte Methode `machenGeräusch()` und eine konkrete Methode `schlafen()`. Die Klasse `Hund` erbt von `Tier` und implementiert die abstrakte Methode `machenGeräusch()`, während sie die konkrete Methode `schlafen()` erbt.
## Abstraktalgorithmen
Ein Abstraktalgorithmus ist ein Algorithmus, der in einer abstrakten Klasse definiert ist und von den Unterklassen implementiert wird. Er ermöglicht es, die allgemeine Struktur eines Algorithmus zu definieren, während die spezifischen Schritte von den Unterklassen bereitgestellt werden.
```java
public abstract class SortierAlgorithmus {
    public void sortieren(int[] array) {
        // Allgemeine Struktur des Sortieralgorithmus
        vorbereiten(array);
        sortierenImpl(array);
        abschließen(array);
    }

    protected void vorbereiten(int[] array) {
        // Vorbereitungsschritte, z.B. Überprüfen der Eingabe
    }

    protected abstract void sortierenImpl(int[] array); // Abstrakte Methode für die spezifische Sortierlogik

    protected void abschließen(int[] array) {
        // Abschließende Schritte, z.B. Ausgabe des sortierten Arrays
    }
}
