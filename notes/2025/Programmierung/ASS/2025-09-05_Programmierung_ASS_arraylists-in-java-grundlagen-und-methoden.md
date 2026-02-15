---
title: "ArrayLists in Java – Grundlagen und Methoden"
date: 2025-09-05
weekday: "Freitag"
subject: "Programmierung"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "ArrayList, Collections, Listenstrukturen"
level: "Grundlagen"
tags:
  - Java
  - ArrayList
  - Collections
  - Datenstrukturen
  - Listen
  - OOP
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# ArrayLists in Java – 2025-09-05 (ASS)

## Grundlagen

- `ArrayList` gehört zum Paket `java.util`
- Import: `import java.util.ArrayList;`
- Dynamische Größe (wächst und schrumpft automatisch)
- Unterschied zu Arrays:
  - Array = feste Länge
  - ArrayList = flexible Länge

---

## Wichtige Eigenschaften

- Liste ist **0-basiert** (erstes Element = Index 0)
- Elemente einfügen mit:
  - `add(value)`
  - `add(index, value)`
- Elemente auslesen:
  - `get(index)`
- Elemente löschen:
  - `remove(index)`
  - `remove(object)`

---

## Grundlegende Methoden

- `add(value)` → Element am Ende einfügen
- `add(index, value)` → Element an bestimmter Position einfügen
- `get(index)` → Element zurückgeben
- `set(index, value)` → Element ersetzen
- `remove(index)` → Element löschen
- `clear()` → gesamte Liste leeren

Hinweis:
`addFirst()` und `addLast()` existieren nicht in `ArrayList`, sondern in `LinkedList`.

---

## Nützliche Methoden

- `size()` → Anzahl der Elemente
- `isEmpty()` → prüft, ob Liste leer ist
- `contains(value)` → prüft auf Vorhandensein
- `indexOf(value)` → erstes Vorkommen
- `lastIndexOf(value)` → letztes Vorkommen
- `equals(otherList)` → vergleicht Listeninhalte

---

## Erweiterte Methoden

- `clone()` → flache Kopie
- `Collections.sort(list)` → sortiert Liste
- `replaceAll(UnaryOperator)` → ersetzt alle Elemente
- `subList(from, to)` → Teilliste
- `forEach(action)` → Iteration mit Lambda
- `toArray()` → Umwandlung in Array

Hinweis:
`split()` ist keine Methode der ArrayList.  
Strings können mit `split()` zerlegt und über `Arrays.asList()` in Listen umgewandelt werden.

---

## Beispiel

```java
import java.util.ArrayList;
import java.util.Collections;

public class Example {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();

        list.add("Apfel");
        list.add("Banane");
        list.add(0, "Kirsche");

        System.out.println(list.get(1));

        list.set(1, "Mango");

        System.out.println("Größe: " + list.size());
        System.out.println("Index von Mango: " + list.indexOf("Mango"));

        Collections.sort(list);
        System.out.println("Sortiert: " + list);

        list.remove("Mango");
        System.out.println("Nach remove: " + list);

        System.out.println("Leer? " + list.isEmpty());
    }
}
```

---

## Zufallswerte in ArrayList

```java
import java.util.ArrayList;
import java.util.Random;

ArrayList<Integer> numbers = new ArrayList<>();
Random rand = new Random();

for (int i = 0; i < 5; i++) {
    numbers.add(rand.nextInt(100));
}

System.out.println(numbers);
```

---

## Prüfungsrelevante Kerngedanken

- ArrayList = dynamisches Array
- Zentrale Methoden: `add()`, `get()`, `set()`, `remove()`
- Unterschied kennen zwischen:
  - Array
  - ArrayList
  - LinkedList
- `Collections.sort()` für Sortierung verwenden
- LinkedList bietet zusätzliche Methoden wie `addFirst()` und `addLast()`
