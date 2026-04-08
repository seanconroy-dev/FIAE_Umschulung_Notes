---
title: "Interfaces und abstrakte Klassen / Abstraktalgorithmen"
date: 2026-04-08
weekday: "Mittwoch"
subject: "Programmiertechnik"
instructor: "POG"
program: "FIAE Umschulung 2025-2027"
module: "Objektorientierte Programmierung"
topic: "Interfaces, abstrakte Klassen und Template Method Pattern"
level: "Grundlagen"
tags:
  - OOP
  - Java
  - Interfaces
  - Abstraktion
  - Vererbung
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Interfaces und abstrakte Klassen

## Überblick / Definition

Interfaces und abstrakte Klassen sind zentrale Konzepte der objektorientierten Programmierung zur **Abstraktion** und **Strukturierung von Code**.

- **Interface**: Definiert einen *Vertrag* (was muss vorhanden sein)
- **Abstrakte Klasse**: Liefert eine *Teilimplementierung* (wie etwas teilweise funktioniert)
- **Abstraktalgorithmus**: Definiert eine feste Ablaufstruktur mit variablen Teil-Schritten (Template Method Pattern)

---

## Interfaces

Ein Interface beschreibt **nur die Methoden-Signaturen**, jedoch **keine Implementierung** (Ausnahme: `default`/`static` Methoden in Java).

➡️ Ziel: Einheitliche Schnittstelle für unterschiedliche Klassen

### Eigenschaften

- Keine Instanziierung möglich
- Methoden sind implizit `public abstract`
- Klassen können **mehrere Interfaces implementieren**
- Erzwingt die vollständige Implementierung aller Methoden

### Beispiel

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
```

### Kerngedanke

Ein Interface beantwortet die Frage:

👉 **„Was kann ein Objekt?“**

---

## Abstrakte Klassen

Eine abstrakte Klasse ist eine **nicht instanziierbare Basisklasse**, die sowohl:

- **abstrakte Methoden** (ohne Implementierung)
- **konkrete Methoden** (mit Implementierung)

enthalten kann.

### Eigenschaften

- Deklaration mit `abstract`
- Kann Attribute und Konstruktoren besitzen
- Unterklassen müssen abstrakte Methoden implementieren
- Unterstützt **Code-Wiederverwendung**

### Beispiel

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
```

### Kerngedanke

Eine abstrakte Klasse beantwortet:

👉 **„Was haben alle Objekte gemeinsam?“**

---

## Abstrakte Methoden

Abstrakte Methoden:

- Haben **keinen Methodenkörper**
- Werden in abstrakten Klassen definiert
- Müssen von Unterklassen implementiert werden

```java
public abstract void machenGeräusch();
```

➡️ Zweck: Erzwingen einer konkreten Umsetzung in Spezialisierungen

---

## Abstraktalgorithmen (Template Method Pattern)

Ein Abstraktalgorithmus beschreibt:

👉 **Eine feste Ablaufstruktur, aber variable Teilschritte**

Das ist ein klassisches Entwurfsmuster: **Template Method Pattern**

### Struktur

```mermaid
flowchart TD
    A[Start sortieren()] --> B[vorbereiten()]
    B --> C[sortierenImpl() - abstrakt]
    C --> D[abschließen()]
```

### Beispiel

```java
public abstract class SortierAlgorithmus {

    public void sortieren(int[] array) {
        vorbereiten(array);
        sortierenImpl(array);
        abschließen(array);
    }

    protected void vorbereiten(int[] array) {
        // z.B. Validierung
    }

    protected abstract void sortierenImpl(int[] array);

    protected void abschließen(int[] array) {
        // z.B. Ausgabe
    }
}
```

### Kerngedanke

- **Algorithmusstruktur ist fix**
- **Details sind variabel**

➡️ Wiederverwendbarkeit + Erweiterbarkeit

---

## Vergleich: Interface vs. abstrakte Klasse

| Kriterium            | Interface                     | Abstrakte Klasse              |
|---------------------|------------------------------|-------------------------------|
| Zweck               | Vertrag definieren           | Gemeinsame Basis schaffen     |
| Methoden            | Nur abstrakt (meist)         | Abstrakt + konkret            |
| Mehrfachvererbung   | ✅ möglich                   | ❌ nicht möglich              |
| Attribute           | Nur Konstanten               | Normale Attribute möglich     |
| Konstruktor         | ❌ nein                      | ✅ ja                         |
| Verwendung          | Fähigkeiten beschreiben      | Gemeinsamkeiten bündeln       |

---

## Praktisches Beispiel (Kombination)

```java
public interface Beweglich {
    void bewegen();
}

public abstract class Lebewesen {
    public abstract void atmen();
}

public class Mensch extends Lebewesen implements Beweglich {
    @Override
    public void atmen() {
        System.out.println("Mensch atmet.");
    }

    @Override
    public void bewegen() {
        System.out.println("Mensch läuft.");
    }
}
```

---

## Prüfungsrelevanz

Typische Prüfungsfragen:

- Unterschied zwischen Interface und abstrakter Klasse erklären
- Code analysieren: Was muss implementiert werden?
- Erkennen von **Template Method Pattern**
- Einsatzentscheidung:
  - Interface vs. abstrakte Klasse begründen

---

## Häufige Fehler & Klarstellungen

### ❌ Fehler 1: Interface = „besser“
➡️ Falsch — hängt vom Anwendungsfall ab

### ❌ Fehler 2: Abstrakte Klasse = nur abstrakte Methoden
➡️ Falsch — konkrete Methoden sind zentral!

### ❌ Fehler 3: Verwechslung von „Vertrag“ und „Implementierung“
- Interface → **nur Vertrag**
- Abstrakte Klasse → **teilweise Implementierung**

### ❌ Fehler 4: Abstraktalgorithmus nicht erkennen
➡️ Achte auf:
- `final` oder feste Ablaufmethode
- Aufruf abstrakter Methoden innerhalb dieser Struktur

---

## Zusammenfassung

- **Interface** = „Was kann ein Objekt?“  
- **Abstrakte Klasse** = „Was ist gemeinsam?“  
- **Abstraktalgorithmus** = „Wie läuft etwas grundsätzlich ab?“  

➡️ Kombination ermöglicht flexible, wartbare und erweiterbare Softwarearchitektur