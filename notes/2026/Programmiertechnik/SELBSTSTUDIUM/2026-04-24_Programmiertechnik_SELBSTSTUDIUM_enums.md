---
title: "Enums (Aufzählungstypen in Java)"
date: 2026-04-24
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "Selbststudium"
program: "FIAE Umschulung 2025-2027"
module: ""
topic: "Enums in Java"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - Datentypen
  - Clean Code
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

## Kurzüberblick / Definition

**Enums** (Enumerations) sind spezielle Klassen in Java, die eine **feste Menge vordefinierter Konstanten** darstellen.

- Jede Konstante ist ein **Objekt**
- Enums sind **typsicher**
- Können **Attribute, Konstruktoren und Methoden** enthalten
- Verhindern ungültige Werte (z. B. falsche Strings oder Zahlen)

---

## Core-Erklärung

### Das eigentliche Problem (Praxisblick)

Ohne Enums wird oft so gearbeitet:

```java
String status = "OPEN";
```

Probleme:

- Tippfehler (`"OPNE"`) → Laufzeitfehler
- Keine Einschränkung der erlaubten Werte
- Schlechte Wartbarkeit
- Kein Compiler-Schutz

---

### Lösung: Enum als fachliches Modell

```java
public enum OrderStatus {
    OPEN,
    PROCESSING,
    SHIPPED,
    DELIVERED,
    CANCELLED
}
```

Verwendung:

```java
OrderStatus status = OrderStatus.OPEN;
```

➡️ Der Compiler erzwingt gültige Werte  
➡️ Der Code beschreibt **fachliche Zustände klar und eindeutig**

---

### Mentales Modell (entscheidend)

Ein Enum ist nicht nur eine Liste von Werten.

👉 Ein Enum ist ein **Modell eines festen Zustandsraums** eines Systems.

Beispiele:

- Bestellung → Status
- Benutzer → Rolle
- Zahlung → Methode
- Prozess → Zustand

---

## Praxisbeispiele (Realistisch & prüfungsrelevant)

### 1. Bestellstatus im Online-Shop

```java
public enum OrderStatus {
    OPEN,
    PROCESSING,
    SHIPPED,
    DELIVERED,
    CANCELLED
}
```

```java
public class Order {

    private OrderStatus status;

    public Order(OrderStatus status) {
        this.status = status;
    }

    public void printStatus() {
        System.out.println("Status: " + status);
    }
}
```

---

### 2. Benutzerrollen (Security / Rechte)

```java
public enum UserRole {
    ADMIN,
    USER,
    GUEST
}
```

```java
public class User {

    private UserRole role;

    public boolean canDelete() {
        return role == UserRole.ADMIN;
    }
}
```

➡️ Vergleich mit `==` ist korrekt, da Enum-Konstanten Singleton-Objekte sind

---

### 3. Versandkosten (Daten + Verhalten)

```java
public enum ShippingType {

    STANDARD(4.99),
    EXPRESS(9.99),
    OVERNIGHT(19.99);

    private final double cost;

    ShippingType(double cost) {
        this.cost = cost;
    }

    public double getCost() {
        return cost;
    }
}
```

➡️ Enum bündelt **Daten und Bedeutung**

---

### 4. Verhalten pro Zustand (State Pattern light)

```java
public enum OrderStatus {

    OPEN {
        @Override
        public boolean canBeCancelled() {
            return true;
        }
    },
    SHIPPED {
        @Override
        public boolean canBeCancelled() {
            return false;
        }
    };

    public abstract boolean canBeCancelled();
}
```

Verwendung:

```java
if (order.getStatus().canBeCancelled()) {
    // Bestellung stornieren
}
```

➡️ Logik gehört direkt zum Zustand

---

### 5. Typischer Enterprise-Use-Case: API / DTO

```java
public enum HttpMethod {
    GET,
    POST,
    PUT,
    DELETE
}
```

```java
public void sendRequest(HttpMethod method) {
    if (method == HttpMethod.POST) {
        // body required
    }
}
```

➡️ Verhindert ungültige API-Aufrufe

---

## Wichtige Konzepte

### Enums sind vollwertige Klassen

Ein Enum entspricht intern etwa:

```java
public final class OrderStatus extends Enum<OrderStatus>
```

Eigenschaften:

- Konstruktoren sind immer `private`
- Jede Konstante ist eine Instanz
- Vergleich mit `==` möglich und korrekt

---

### Nützliche Methoden

```java
OrderStatus status = OrderStatus.valueOf("OPEN");
OrderStatus[] values = OrderStatus.values();
String name = status.name();
int ordinal = status.ordinal();
```

⚠️ `ordinal()` sollte **nicht für Logik verwendet werden** (unstabil bei Änderungen)

---

### Verwendung in `switch`

```java
switch (status) {
    case OPEN -> System.out.println("Offen");
    case SHIPPED -> System.out.println("Versendet");
    default -> System.out.println("Andere");
}
```

---

## Entscheidungslogik (sehr wichtig)

### Verwende ein Enum wenn:

- Werte sind **fest definiert**
- Werte ändern sich **selten**
- Werte haben **fachliche Bedeutung**

---

### Verwende KEIN Enum wenn:

- Werte sind dynamisch (z. B. Benutzernamen)
- Werte kommen aus Datenbank/API
- Unbekannte Anzahl an Möglichkeiten

---

## Vergleich: Enum vs String

| Kriterium        | String        | Enum           |
|------------------|--------------|----------------|
| Typsicherheit    | ❌ Nein       | ✅ Ja           |
| Compilerprüfung  | ❌ Nein       | ✅ Ja           |
| Lesbarkeit       | ⚠️ Mittel     | ✅ Hoch         |
| Wartbarkeit      | ❌ Schlecht   | ✅ Gut          |

---

## Exam-Relevanz

Typische Fragen:

- Definition eines Enums
- Vorteile gegenüber String/int
- Können Enums Methoden enthalten?
- Bedeutung von Typsicherheit
- Verwendung in `switch`
- Warum ist `==` erlaubt?

---

## Best Practices

Verwenden für:

- Zustände (OrderStatus, TicketStatus)
- Rollen (UserRole)
- Konfigurationen (PaymentType, ShippingType)

---

Vermeiden:

- Business-Logik überladen
- Verwendung von `ordinal()` für Logik
- Einsatz bei dynamischen Daten

---

## Häufige Fehler

❌ Strings statt Enum verwenden  
→ Keine Typsicherheit  

❌ Enum nur als Konstantensammlung sehen  
→ Verhalten wird nicht genutzt  

❌ Zu komplexe Logik im Enum  
→ Verletzt Separation of Concerns  

❌ Vergleich mit `.equals()` statt `==`  
→ Unnötig und schlechter Stil  

---

## Fazit

Enums sind ein zentrales Werkzeug für sauberes Java-Design:

- Modellieren **klare, feste Zustände**
- Erzwingen **korrekte Verwendung durch den Compiler**
- Verbessern **Lesbarkeit und Wartbarkeit**

---

## Merksatz

> Ein Enum ist keine Liste von Werten,  
> sondern ein **typsicheres Modell eines festen Zustandsraums** in deinem System.

---