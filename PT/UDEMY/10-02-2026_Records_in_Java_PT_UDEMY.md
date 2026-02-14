---
title: "Records in Java – Grundlagen und Vergleich zu POJOs"
date: 2026-02-10
weekday: "Dienstag"
subject: "Programmierung"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Records, Immutable Klassen, Vergleich zu POJO"
level: "Grundlagen"
tags:
  - Java
  - Records
  - Immutable
  - POJO
  - DTO
  - OOP
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Records in Java – 2026-02-10 (UDEMY)

## Definition und Einführung

Records sind eine spezielle Klassenart in Java.

- Eingeführt in **Java 14** (Preview)
- Seit **Java 16** offiziell Bestandteil der Sprache
- Konzipiert für **reine Datenklassen**

Records sind standardmäßig:

- **immutable**
- kompakt in der Syntax
- stark reduziert im Boilerplate-Code

Der Compiler generiert automatisch:

- Konstruktor
- `equals()`
- `hashCode()`
- `toString()`
- Accessor-Methoden

---

# Grundsyntax

```java
public record RecordName(Typ1 feld1, Typ2 feld2) {}
```

## Beispiel

```java
public record Person(String name, int age) {}
```

Automatisch generiert:

- Konstruktor `Person(String name, int age)`
- Accessor-Methoden:
  - `name()`
  - `age()`
- `equals()`
- `hashCode()`
- `toString()`

Wichtig:  
Keine klassischen Getter (`getName()`), sondern:

```java
person.name();
person.age();
```

---

# Vorteile von Records

| Vorteil | Erklärung |
|----------|-----------|
| Weniger Boilerplate | Keine manuelle Implementierung von Getter, equals, etc. |
| Immutable | Felder sind implizit `private final` |
| Automatische Methoden | equals, hashCode, toString werden generiert |
| Kompakte Syntax | Sehr kurze Klassendefinition |

---

# Einschränkungen von Records

| Einschränkung | Erklärung |
|---------------|-----------|
| Keine Klassenvererbung | Records können keine andere Klasse erweitern |
| Keine zusätzlichen Instanzfelder | Nur Felder aus dem Header |
| Keine Setter | Immutable |
| Eingeschränkte Flexibilität | Fokus auf Datenhaltung |

Records können jedoch:

- Interfaces implementieren
- Zusätzliche Methoden enthalten
- Validierung im Konstruktor durchführen

---

# Records vs. POJOs

| Merkmal | Record | POJO |
|----------|--------|------|
| Zweck | Datenhaltung | Allgemeine Klassen |
| Immutable | Immer | Optional |
| Boilerplate | Minimal | Hoch |
| Vererbung | Nicht möglich | Möglich |
| Flexibilität | Eingeschränkt | Hoch |

---

# Accessor-Methoden

Records generieren automatisch Accessor-Methoden mit dem Feldnamen:

```java
String name = person.name();
int age = person.age();
```

Nicht:

```java
person.getName();
```

---

# Wann Records verwenden?

- DTOs (Data Transfer Objects)
- Wertobjekte (z. B. Point, Range)
- Datenmodelle ohne komplexe Logik
- Immutable Objekte

---

# Wann POJOs verwenden?

- Wenn Vererbung benötigt wird
- Bei komplexer Geschäftslogik
- Wenn Objekte veränderbar sein sollen
- Wenn zusätzliche Felder außerhalb des Headers nötig sind

---

# Prüfungsrelevante Kernaussagen

- Records sind seit Java 16 Standard
- Immer immutable
- Automatische Generierung wichtiger Methoden
- Keine Setter
- Keine Klassenvererbung möglich
- Ideal für reine Datenstrukturen

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand am 10.02.2026 im Rahmen eines Udemy-Kurses.<br>
Die Version wurde inhaltlich ueberarbeitet und strukturell optimiert,<br>
um Lernerfolg und Nachvollziehbarkeit zu foerdern.<br><br>
Quelle: Eigene Mitschrift (Udemy)<br>
Autor: Sean Conroy<br>
Lizenz: CC BY-NC-SA 4.0
</p>
</details>
```
