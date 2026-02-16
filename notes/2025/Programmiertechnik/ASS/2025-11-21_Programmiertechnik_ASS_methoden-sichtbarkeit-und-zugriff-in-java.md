---
title: "Methoden, Sichtbarkeit und Zugriff in Java"
date: 2025-11-21
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Objektorientierte Programmierung"
topic: "Methoden, Zugriffsmodifizierer, Packages"
level: "Grundlagen"
tags:
  - Java
  - Methoden
  - Zugriffsmodifizierer
  - OOP
  - Packages
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Methoden, Sichtbarkeit und Zugriff – 2025-11-21 (ASS)

---

## 1. Was ist eine Methode?

Eine **Methode** ist ein benannter Programmblock, der:

- eine bestimmte Aufgabe ausführt  
- optional Parameter entgegennimmt  
- optional einen Wert zurückgibt  

Zweck von Methoden:

- Strukturierung des Codes  
- Wiederverwendbarkeit  
- Kapselung von Logik  

---

## 2. Methodendefinition

Bei der Definition werden festgelegt:

- Zugriffsmodifizierer  
- Rückgabetyp  
- Methodenname  
- Parameterliste  
- Methodenrumpf  

Beispiel:

```java
public int add(int a, int b) {
    return a + b;
}
```

Aufbau allgemein:

```java
[Modifizierer] Rückgabetyp Methodenname(Parameter) {
    // Anweisungen
}
```

---

## 3. Methodenaufruf

Eine Methode wird über ihren Namen aufgerufen.

```java
int ergebnis = add(3, 5);
```

Voraussetzungen:

- Methode ist sichtbar  
- Parameter stimmen in Anzahl und Typ  
- Aufruf erfolgt im gültigen Kontext  

---

## 4. Zugriffsmodifizierer

Sie bestimmen, **wo** eine Methode verwendet werden darf.

### public

- Zugriff überall  
- Klassen- und packageübergreifend  

```java
public void print() { }
```

---

### private

- Zugriff nur innerhalb derselben Klasse  
- Nicht von außen sichtbar  

```java
private void calc() { }
```

---

### package-private (Standard)

- Kein Schlüsselwort  
- Zugriff nur innerhalb desselben Packages  

```java
void helper() { }
```

---

### protected

- Zugriff im selben Package  
- Zugriff in Unterklassen (auch in anderen Packages)  

```java
protected void log() { }
```

---

## 5. Sichtbarkeitsübersicht

| Modifizierer | Gleiche Klasse | Gleiches Package | Unterklasse (anderes Package) | Anderes Package |
|--------------|----------------|------------------|-------------------------------|-----------------|
| public       | ✓              | ✓                | ✓                             | ✓               |
| protected    | ✓              | ✓                | ✓                             | ✗               |
| package      | ✓              | ✓                | ✗                             | ✗               |
| private      | ✓              | ✗                | ✗                             | ✗               |

Wichtig:  
`protected` erlaubt Zugriff in Unterklassen auch außerhalb des Packages – jedoch nicht für beliebige fremde Klassen.

---

## 6. Packages

Ein **Package** ist ein logischer Namensraum für Klassen.

```java
package de.bfw.example;
```

Funktionen von Packages:

- Strukturierung großer Projekte  
- Vermeidung von Namenskonflikten  
- Steuerung von Sichtbarkeit  

---

## 7. Zugriff über Package-Grenzen

Grundregel:

Über Package-Grenzen hinweg sind Methoden nur mit `public` zugreifbar.  
`protected` funktioniert zusätzlich bei Vererbung.

Nicht zugreifbar von außen:

- `private`
- `package-private`

---

## 8. Typische Fehler

- Methode ohne `public`, aber Zugriff aus anderem Package erwartet  
- Verwechslung von `private` und package-private  
- Falsche Parameter beim Methodenaufruf  
- Annahme, dass Ordnerstruktur allein Sichtbarkeit regelt  

---

## 9. Prüfungsrelevanz (FIAE)

Typische Fragestellungen:

- Welche Bestandteile hat eine Methode?  
- Welche Zugriffsmodifizierer gibt es?  
- Warum ist eine Methode aus einem anderen Package nicht erreichbar?  
- Wann sollte man `private` verwenden?  

---

## Kernaussagen

- Methoden kapseln Verhalten  
- Sichtbarkeit wird durch Modifizierer geregelt  
- Packages definieren Zugriffsbereiche  
- Für Zugriff über Package-Grenzen ist `public` erforderlich

