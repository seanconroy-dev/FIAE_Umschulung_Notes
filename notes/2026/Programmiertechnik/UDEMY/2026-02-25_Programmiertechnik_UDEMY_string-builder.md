---
title: "StringBuilder"
date: 2026-02-25
weekday: "Mittwoch"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Strings & Mutable Objects"
topic: "String vs StringBuilder"
level: "Grundlagen – OOP relevant"
tags:
  - String
  - StringBuilder
  - mutable
  - immutable
  - append
  - capacity
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Mittwoch, 2026-02-25_Programmiertechnik_UDEMY

## 1) Warum gibt es StringBuilder?

Wichtiges Grundprinzip:

> String ist immutable (unveränderlich)  
> StringBuilder ist mutable (veränderlich)

Das bedeutet:

```java
String s = "Hello";
s.concat(" World");
```

➡️ erzeugt ein neues Objekt  
➡️ das alte bleibt unverändert  
➡️ wenn nicht zugewiesen → Ergebnis geht verloren

---

## 2) String vs StringBuilder – Unterschied

### String

```java
String text = "Hello";
text.concat(" World");
System.out.println(text);
```

Ausgabe:
```
Hello
```

Warum?

- concat() erstellt neues String-Objekt
- Ergebnis wurde nicht gespeichert

Richtig wäre:

```java
text = text.concat(" World");
```

---

### StringBuilder

```java
StringBuilder builder = new StringBuilder("Hello");
builder.append(" World");
System.out.println(builder);
```

Ausgabe:
```
Hello World
```

Warum?

- append() verändert dasselbe Objekt
- kein neues Objekt nötig

---

## 3) Konstruktoren von StringBuilder

Vier wichtige Varianten:

```java
new StringBuilder()
new StringBuilder("Text")
new StringBuilder(32)
new StringBuilder(CharSequence)
```

---

### Beispiel: Kapazität

```java
StringBuilder b1 = new StringBuilder();
StringBuilder b2 = new StringBuilder(32);
```

Standard-Kapazität:
```
16 Zeichen
```

Mit Zahl:
```
Kapazität = angegebene Größe
```

---

## 4) capacity() vs length()

```java
StringBuilder b = new StringBuilder();
System.out.println(b.length());    // 0
System.out.println(b.capacity());  // 16
```

- length() = tatsächliche Zeichenanzahl
- capacity() = Speicherreserve

Wenn capacity überschritten wird:
→ Speicher wird neu reserviert
→ Daten werden kopiert

Deshalb:
> Bei viel Text → gleich große Kapazität wählen

---

## 5) Wichtige Methoden

---

### append()

```java
builder.append(" Text");
```

Fügt Text an.

Sehr wichtig für Prüfung:
→ Gibt das gleiche Objekt zurück  
→ Method Chaining möglich

---

### deleteCharAt()

```java
builder.deleteCharAt(5);
```

Entfernt Zeichen an Position.

---

### insert()

```java
builder.insert(5, "X");
```

Fügt Text an bestimmter Position ein.

---

### replace()

Unterschied zu String.replace:

```java
builder.replace(3, 6, "ABC");
```

- Start inklusiv
- Ende exklusiv

---

### reverse()

```java
builder.reverse();
```

Dreht Text um.

---

### setLength()

```java
builder.setLength(5);
```

Schneidet Text ab (truncation).

---

## 6) Method Chaining

Weil append() das gleiche Objekt zurückgibt:

```java
builder.append("A")
       .append("B")
       .append("C");
```

Sehr effizient.

---

## 7) Performance-Unterschied (wichtig!)

Viele String-Verkettungen:

```java
String s = "";
for(int i = 0; i < 1000; i++){
    s += "A";
}
```

Problem:
- jedes Mal neues Objekt
- ineffizient

Besser:

```java
StringBuilder sb = new StringBuilder();
for(int i = 0; i < 1000; i++){
    sb.append("A");
}
```

---

## 8) Wann benutzt man was?

### String verwenden wenn:

- Text konstant ist
- wenig Änderungen
- Literale

---

### StringBuilder verwenden wenn:

- viel Text zusammengesetzt wird
- Schleifen
- Performance wichtig
- dynamische Manipulation

---

## 9) Prüfungsrelevante Punkte

- String ist immutable
- StringBuilder ist mutable
- append() verändert Objekt
- concat() erzeugt neues Objekt
- capacity() ≠ length()
- Method Chaining möglich
- besser für viele Verkettungen

---

## 10) Mini-Merkblock

String:
> sicher, einfach, unveränderlich

StringBuilder:
> schnell, flexibel, veränderlich

---
