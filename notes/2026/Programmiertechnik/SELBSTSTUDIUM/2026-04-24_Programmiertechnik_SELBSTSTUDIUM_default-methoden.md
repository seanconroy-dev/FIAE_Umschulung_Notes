---
title: "Default Methoden (Interfaces in Java)"
date: 2026-04-24
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "SELBSTSTUDIUM"
program: "FIAE Umschulung 2025-2027"
module: ""
topic: "Default Methoden in Interfaces"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - Interfaces
  - API Design
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

## Kurzüberblick / Definition

**Default Methoden** sind Methoden in Java-Interfaces, die bereits eine **konkrete Implementierung enthalten**.

- Eingeführt mit **Java 8**
- Ziel: **Interfaces erweitern**, ohne bestehende Implementierungen zu brechen
- Verwendung des Schlüsselworts `default`
- Können von implementierenden Klassen **optional überschrieben** werden

---

## Core-Erklärung

### Warum das in der Praxis existiert

In realen Systemen (Frameworks, APIs, Libraries):

- Viele Klassen implementieren dasselbe Interface
- Interfaces entwickeln sich im Laufe der Zeit weiter

Ohne Default Methoden müssten bei jeder Erweiterung alle bestehenden Implementierungen angepasst werden.

---

## Praxisbeispiele

### 1. E-Commerce Plattform – Zahlungsabwicklung

```java
public interface PaymentService {

    void pay(double amount);

    default double applyDiscount(double amount) {
        return amount;
    }
}
```

Implementierung einer bestehenden Zahlungsart:

```java
public class CreditCardPayment implements PaymentService {

    @Override
    public void pay(double amount) {
        System.out.println("Bezahlt mit Kreditkarte: " + amount);
    }
}
```

Spezialisierte Zahlungsart mit Rabatt:

```java
public class VipPayment implements PaymentService {

    @Override
    public void pay(double amount) {
        double finalAmount = applyDiscount(amount);
        System.out.println("VIP bezahlt: " + finalAmount);
    }

    @Override
    public double applyDiscount(double amount) {
        return amount * 0.9;
    }
}
```

---

### 2. Collections – Erweiterung von Funktionalität

```java
public interface SimpleList<T> {

    void add(T element);

    default void addAll(List<T> elements) {
        for (T e : elements) {
            add(e);
        }
    }
}
```

---

### 3. Logging in Services

```java
public interface Service {

    void execute();

    default void logError(Exception e) {
        System.err.println("[ERROR] " + e.getMessage());
    }
}
```

Verwendung:

```java
public class OrderService implements Service {

    @Override
    public void execute() {
        try {
            System.out.println("Bestellung wird verarbeitet...");
            throw new RuntimeException("Datenbankfehler");
        } catch (Exception e) {
            logError(e);
        }
    }
}
```

---

### 4. API-Weiterentwicklung

```java
public interface UserService {
    String getUserName(int id);

    default void logAccess(int id) {
        System.out.println("User accessed: " + id);
    }
}
```

---

## Wichtige Konzepte

### Unterschied zu abstrakten Methoden

| Merkmal               | Abstrakte Methode | Default Methode |
|----------------------|------------------|-----------------|
| Implementierung      | Nein             | Ja              |
| Muss implementiert werden | Ja         | Nein            |
| Erweiterbarkeit      | Eingeschränkt    | Flexibel        |

---

### Unterschied zu `static` Methoden

| Merkmal              | Default Methode | Static Methode |
|---------------------|----------------|----------------|
| Aufruf über Objekt  | Ja             | Nein           |
| Aufruf über Interface | Nein         | Ja             |
| Überschreibbar      | Ja             | Nein           |

---

### Mehrfachvererbung – Konfliktfall

```java
interface A {
    default void hello() {
        System.out.println("A");
    }
}

interface B {
    default void hello() {
        System.out.println("B");
    }
}

class C implements A, B {

    @Override
    public void hello() {
        A.super.hello();
    }
}
```

---

## Exam-Relevanz

- Zweck von Default Methoden
- Unterschied zu abstrakten und statischen Methoden
- Verhalten bei Erweiterung von Interfaces
- Konfliktlösung bei Mehrfachvererbung

---

## Best Practices

Geeignet für:

- Erweiterung bestehender Interfaces
- Gemeinsame Standardlogik
- Kleine, wiederverwendbare Funktionalität

Nicht geeignet für:

- Komplexe Geschäftslogik
- Zustandsbehaftete Logik
- Unübersichtliche Interface-Strukturen

---

## Häufige Fehler

- Zu viel Logik im Interface
- Verwechslung mit statischen Methoden
- Ignorieren von Konflikten bei Mehrfachvererbung

---

## Fazit

Default Methoden ermöglichen die Erweiterung von Interfaces bei gleichzeitiger Wahrung der Abwärtskompatibilität. Sie sind ein zentrales Werkzeug für wartbare und evolvierbare API-Designs.

--- 
