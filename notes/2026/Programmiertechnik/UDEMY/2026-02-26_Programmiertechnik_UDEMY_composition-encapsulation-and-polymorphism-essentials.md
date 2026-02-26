---
title: "Composition, Encapsulation & Polymorphism Essentials"
date: 2026-02-26
weekday: "Donnerstag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "OOP Grundlagen"
topic: "Inheritance vs Composition"
level: "AP1/AP2 relevant"
tags:
  - OOP
  - Composition
  - Encapsulation
  - Polymorphism
  - Design Principles
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Donnerstag, 2026-02-26_Programmiertechnik_UDEMY

# 1 Inheritance (Vererbung)

Inheritance beschreibt eine:

```
IS-A Beziehung
```

Beispiel:

```
Monitor IS A Product
Motherboard IS A Product
ComputerCase IS A Product
```

Das bedeutet:
Eine Unterklasse ist eine Spezialisierung der Oberklasse.

➡ Inheritance = Wiederverwendung durch Spezialisierung.

Alle Subklassen erben:

- manufacturer
- model
- width
- height
- depth

---

# 2 Composition (Komposition)

Composition beschreibt eine:

```
HAS-A Beziehung
```

Beispiel:

```
PersonalComputer HAS A
   - Monitor
   - Motherboard
   - ComputerCase
```

Ein PC IST ein Product,  
aber er HAT andere Objekte.

➡ Composition = Wiederverwendung durch Delegation.

Delegation bedeutet:
Ein Objekt übergibt Aufgaben an seine Bestandteile.

---

# 3 IS-A vs HAS-A Denkregel

Wenn der Satz in natürlicher Sprache komisch klingt, ist das Design falsch.

```
DigitalProduct IS A physical Product.
```

Das klingt falsch → also keine Vererbung.

Inheritance muss reale Logik widerspiegeln.

---

# 4 Klassenstruktur

## Basisklasse

```
Product
 ├── manufacturer
 ├── model
 └── dimensions
```

---

## Spezifische Produkte

```
Monitor extends Product
Motherboard extends Product
ComputerCase extends Product
```

---

## Zusammengesetztes Objekt

```
PersonalComputer extends Product
   ├── Monitor
   ├── Motherboard
   └── ComputerCase
```

---

# 5 Encapsulation (Kapselung)

Encapsulation bedeutet:

```
Kontrollierter Zugriff auf internen Zustand.
```

Nicht:
❌ „Keine Getter“

Sondern:
✔ Private Felder  
✔ Öffentliche Methoden  
✔ Objekt schützt seine Konsistenz  

---

## ❌ Schlechter Zugriff

```java
pc.getMonitor().drawPixelAt(...)
```

Problem:
→ Außenwelt kennt interne Struktur  
→ Starke Kopplung

---

## ✔ Besseres Design

```java
public void powerUp() {
    computerCase.pressPowerButton();
    drawLogo();
}
```

Außenwelt:

```java
pc.powerUp();
```

Die Details bleiben intern verborgen.

---

# 6 Warum Composition bevorzugt wird

Design-Prinzip:

```
Favor Composition over Inheritance.
```

---

## Vorteil 1 – Geringere Kopplung

Inheritance:
→ starke Abhängigkeit von Elternklasse

Composition:
→ lose Kopplung

---

## Vorteil 2 – Flexibilität

Monitor austauschen?
Kein Problem.

Hierarchie ändern?
Nicht nötig.

---

## Vorteil 3 – Erweiterbarkeit

Inheritance ist starr:

Java erlaubt nur:

```
extends eine Klasse
```

Composition erlaubt:

```
Beliebig viele Objekte kombinieren
```

---

# 7 DigitalProduct Problem

Wenn Product width/height/depth enthält:

```
DigitalProduct extends Product
```

→ erbt physische Eigenschaften  
→ fachlich falsch  

Bessere Lösung:

```
Product (allgemein)

Dimensions
 ├── width
 ├── height
 └── depth
```

Dann:

```
Motherboard HAS A Dimensions
```

DigitalProduct braucht keine Dimensions.

Flexibles Modell.

---

# 8 Polymorphism (Laufzeitverhalten)

Polymorphism bedeutet:

```
Gleicher Typ – unterschiedliches Verhalten zur Laufzeit.
```

Beispiel:

```java
Product p = new Monitor();
```

Hier entscheidet sich zur Laufzeit,
welche Methode ausgeführt wird.

Das nennt man:

```
Dynamic Dispatch
```

---

## Beispiel

```java
public void start(Product product) {
    product.start();
}
```

Wenn Monitor start() überschreibt,
wird die Monitor-Version ausgeführt.

Das ist echte Austauschbarkeit.

---

# 9 Liskov Substitution Principle

Wichtige Regel:

```
Subtypen müssen vollständig ersetzbar sein.
```

Wenn ein Subtyp spezielles Verhalten erzwingt,
das nicht zur Basisklasse passt,
ist das Design falsch.

---

# 10 Kopplung (Coupling)

Inheritance:
→ starke Kopplung  
→ Änderungen wirken sich auf Unterklassen aus  

Composition:
→ lose Kopplung  
→ Teile können unabhängig geändert werden  

---

# 11 Denkmodell

Inheritance:
```
Hierarchie
```

Composition:
```
Bausteinsystem
```

---

# 12 Prüfungs-Merksätze

- Inheritance = IS-A
- Composition = HAS-A
- Encapsulation = interne Struktur schützen
- Polymorphism = gleiches Interface, anderes Verhalten
- Delegation statt Vererbung bevorzugen
- Subtypen müssen ersetzbar sein
- Favor Composition over Inheritance

---

# 13 Zusammenfassung

Inheritance:
✔ Wiederverwendung durch Spezialisierung  
✖ Starr  
✖ Starke Kopplung  

Composition:
✔ Flexibel  
✔ Erweiterbar  
✔ Realitätsnah  
✔ Lose Kopplung  

Encapsulation:
✔ Schutz der Objekt-Integrität  

Polymorphism:
✔ Austauschbarkeit  
✔ Laufzeitverhalten  

---
