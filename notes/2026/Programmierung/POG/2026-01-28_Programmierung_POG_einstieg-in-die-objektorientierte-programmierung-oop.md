---
title: "Einstieg in die objektorientierte Programmierung (OOP)"
date: 2026-01-28
weekday: "Mittwoch"
subject: "Programmierung"
instructor: "POG"
program: "FIAE Umschulung 2025-2027"
module: "Objektorientierte Programmierung"
topic: "Grundlagen der OOP, Klassen und Objekte"
level: "Grundlagen"
tags:
  - OOP
  - Klassen
  - Objekte
  - Vererbung
  - Polymorphismus
  - Abstraktion
  - Kapselung
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Einstieg in die objektorientierte Programmierung – 2026-01-28 (POG)

## Was ist OOP?

Objektorientierte Programmierung ist ein **Programmierparadigma**.

Zentrale Konzepte:

- Klassen  
- Objekte  
- Vererbung  
- Kapselung  
- Polymorphismus  
- Abstraktion  

---

## Was ist ein Objekt?

Ein Objekt ist eine **Instanz einer Klasse**.

Es besteht aus:

- Eigenschaften (Attribute)
- Verhalten (Methoden)

Ein Objekt ist eine Sammlung von Daten und den dazugehörigen Methoden, die auf diesen Daten arbeiten.

---

## Unterschied zwischen Methode und Funktion

**Methode**
- An eine Klasse oder ein Objekt gebunden
- Arbeitet typischerweise mit den Attributen des Objekts

**Funktion**
- Eigenständiger Codeblock
- Nicht zwingend an ein Objekt gebunden
- Nimmt Parameter entgegen und liefert einen Rückgabewert

---

## Wichtige Prinzipien der OOP

### Kapselung
Daten und Methoden werden in einem Objekt zusammengefasst.  
Direkter Zugriff von außen wird eingeschränkt.

### Modularität
Code wird in klar abgegrenzte, wiederverwendbare Einheiten aufgeteilt.

### Vererbung
Eine Klasse kann Eigenschaften und Methoden einer anderen Klasse übernehmen.

### Polymorphismus
Eine Methode kann in unterschiedlichen Klassen verschieden implementiert sein.

### Abstraktion
Komplexe Details werden verborgen, nur das Wesentliche wird sichtbar gemacht.

**Beispiel:**  
Klasse = Bäcker  
Objekt = einzelnes Brötchen  

---

## Vorteile der OOP

- Strukturierter Code
- Hohe Wiederverwendbarkeit
- Gute Wartbarkeit
- Realitätsnahe Modellierung

---

# Klassen

Eine Klasse ist der **Bauplan für Objekte**.

Sie definiert:

- Attribute (Eigenschaften)
- Methoden (Verhalten)

## Instanziierung

Instanziierung bedeutet:  
Ein Objekt wird aus einer Klasse erzeugt.

---

## Aufbau einer Klasse

Eine Klasse besteht typischerweise aus:

- Klassenname
- Attributen (Instanzvariablen)
- Methoden
- Konstruktor

### Konstruktor

- Initialisiert ein Objekt beim Erzeugen
- Wird automatisch aufgerufen
- Setzt Startwerte für Attribute
- In Python heißt der Konstruktor `__init__`

---

# Objekte

- Konkrete Instanzen einer Klasse
- Repräsentieren reale oder abstrakte Dinge
- Besitzen individuelle Attributwerte

