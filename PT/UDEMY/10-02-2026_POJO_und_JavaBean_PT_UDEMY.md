---
title: "POJO, JavaBean & Annotationen in Java"
date: 2026-02-10
weekday: "Dienstag"
subject: "Programmierung"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "POJO, JavaBean, Annotationen, Method Overriding"
level: "Grundlagen"
tags:
  - Java
  - POJO
  - JavaBean
  - Annotationen
  - Serializable
  - Overriding
  - OOP
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# POJO und JavaBean – 2026-02-10 (UDEMY)

## POJO (Plain Old Java Object)

### Definition
Ein POJO ist ein einfaches Java-Objekt ohne Abhängigkeit zu speziellen Frameworks oder technischen Anforderungen.  
Es unterliegt keinen besonderen Konventionen außer den allgemeinen Java-Regeln.

POJOs werden häufig für:
- Datenübertragung (DTO)
- Serialisierung / Deserialisierung
- Domänenmodelle

### Typische Merkmale
- Private Felder
- Öffentliche Getter und Setter
- Parameterloser Konstruktor (üblich, aber nicht zwingend)
- Keine Framework-Abhängigkeit

### Beispiel
```java
public class Person {
    private String name;
    private int age;

    public Person() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
```

---

## JavaBean

### Definition
Eine JavaBean ist ein spezieller Typ eines POJO, der definierte Konventionen einhält.

### Verpflichtende Konventionen
- Parameterloser Konstruktor (erforderlich)
- Private Felder
- Öffentliche Getter und Setter
- Implementierung von `Serializable`

### Beispiel
```java
import java.io.Serializable;

public class Employee implements Serializable {
    private String name;
    private int id;

    public Employee() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
```

### Zusammenhang

- Jede JavaBean ist ein POJO.
- Nicht jedes POJO ist eine JavaBean.
- JavaBeans folgen klar definierten Konventionen.
- POJOs sind allgemeiner und flexibler.

---

# Annotationen in JavaBeans

Annotationen liefern Metadaten über Codeelemente.

## Beispiele im Bean-Kontext

| Annotation       | Zweck |
|------------------|-------|
| `@BeanProperty`  | Markiert Getter/Setter als Property-Accessor |
| `@Transient`     | Feld wird nicht serialisiert |
| `@NotNull`       | Feld darf nicht `null` sein (z. B. in Validation-Frameworks) |

---

# Wichtige Standard-Annotationen in Java

| Annotation              | Bedeutung |
|-------------------------|-----------|
| `@Override`             | Methode überschreibt Superklassenmethode |
| `@Deprecated`           | Markiert Code als veraltet |
| `@SuppressWarnings`     | Unterdrückt Compiler-Warnungen |
| `@FunctionalInterface`  | Interface mit genau einer abstrakten Methode |
| `@Retention`            | Definiert Lebensdauer einer Annotation |

Annotationen sind Metadaten – sie verändern nicht direkt das Verhalten, sondern liefern Informationen für Compiler oder Frameworks.

---

# Method Overriding

## Definition
Method Overriding bedeutet:
Eine Subklasse implementiert eine Methode neu, die bereits in der Superklasse existiert.

### Voraussetzungen
- Gleicher Methodenname
- Gleiche Parameterliste
- Gleicher oder kompatibler Rückgabetyp
- Sichtbarkeit darf nicht eingeschränkt werden

### Beispiel
```java
public class SuperClass {
    public void display() {
        System.out.println("Display method in SuperClass");
    }
}

public class SubClass extends SuperClass {
    @Override
    public void display() {
        System.out.println("Display method in SubClass");
    }
}
```

### Wichtiger Hinweis
Die Annotation `@Override` hilft dem Compiler, Fehler frühzeitig zu erkennen.

---

# Prüfungsrelevante Kernaussagen

- POJO = einfaches Java-Objekt ohne spezielle Anforderungen
- JavaBean = POJO + Konventionen (Serializable + No-Arg-Konstruktor)
- Annotationen liefern Metadaten
- Overriding erfordert identische Signatur
- `@Override` erhöht Typsicherheit

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
