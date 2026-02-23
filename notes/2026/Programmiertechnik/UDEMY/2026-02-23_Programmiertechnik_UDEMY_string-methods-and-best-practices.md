---
title: "String Inspection & Comparison Methods"
date: 2026-02-22
weekday: "Sonntag"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Strings"
topic: "Inspection, Comparison, Indexing"
level: "Grundlagen"
tags:
  - String
  - length
  - charAt
  - equals
  - contains
  - indexOf
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Sonntag, 2026-02-22_Programmiertechnik_UDEMY

## 1) Grundprinzip von Strings

Ein `String` ist:

- Eine **Sequenz von Zeichen**
- Geordnet
- Indiziert ab **0**

Beispiel:

```
"Hello World"
```

| H | e | l | l | o |   | W | o | r | l | d |
|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |

- Länge = 11  
- Letzter Index = 10  

Wichtig:
> Länge ≠ letzter Index

---

# 2) String Inspection Methods

Diese Methoden liefern Informationen über den String.

---

## length()

Gibt Anzahl der Zeichen zurück.

```java
int length = string.length();
```

---

## charAt(index)

Gibt das Zeichen an einer Position zurück.

```java
string.charAt(0);  // erstes Zeichen
string.charAt(length - 1); // letztes Zeichen
```

Wichtig:
- Gültiger Index: `0` bis `length - 1`
- Ungültiger Index → Runtime Exception

---

## isEmpty()

```java
string.isEmpty();
```

True wenn:
- Länge = 0

---

## isBlank()

```java
string.isBlank();
```

True wenn:
- Nur Whitespace enthalten (Leerzeichen, Tab, Newline)

Unterschied:

| Methode | Bedeutung |
|----------|------------|
| isEmpty() | Keine Zeichen |
| isBlank() | Nur Leerzeichen |

Beispiel:

```java
""          → empty & blank
"   "       → blank, aber nicht empty
"\t  \n"    → blank
```

---

## indexOf()

Sucht erstes Vorkommen.

```java
string.indexOf("l");
string.indexOf("World");
```

---

## lastIndexOf()

Sucht letztes Vorkommen.

```java
string.lastIndexOf("l");
```

---

## Mit Startposition

```java
string.indexOf("l", 3);
string.lastIndexOf("l", 8);
```

Erklärung:

- indexOf sucht vorwärts
- lastIndexOf sucht rückwärts

Beispiel "Hello World":

- Erstes "l" → Index 2
- Letztes "l" → Index 9
- Zweites "l" → 3 (durch Startindex 3)

---

# 3) String Comparison Methods

Diese prüfen Gleichheit oder Teilstrings.

---

## equals()

Case-sensitiv.

```java
helloWorld.equals(helloWorldLower);
```

---

## equalsIgnoreCase()

Case-insensitiv.

```java
helloWorld.equalsIgnoreCase(helloWorldLower);
```

---

## contentEquals()

Vergleicht Inhalt.

Unterschied:
- Funktioniert auch mit `StringBuilder`

---

## startsWith()

```java
string.startsWith("Hello");
```

---

## endsWith()

```java
string.endsWith("World");
```

---

## contains()

```java
string.contains("World");
```

---

# 4) Beispielcode

```java
String helloWorld = "Hello World";

System.out.println(helloWorld.length());
System.out.println(helloWorld.charAt(0));
System.out.println(helloWorld.charAt(helloWorld.length() - 1));

System.out.println(helloWorld.indexOf("l"));
System.out.println(helloWorld.lastIndexOf("l"));

System.out.println(helloWorld.startsWith("Hello"));
System.out.println(helloWorld.endsWith("World"));
System.out.println(helloWorld.contains("World"));
```

---

# 5) Typische Prüfungsfragen

- Warum beginnt Index bei 0?
- Unterschied isEmpty() vs isBlank()?
- Unterschied equals() vs equalsIgnoreCase()?
- Unterschied indexOf() vs lastIndexOf()?
- Was passiert bei ungültigem Index?

---

# 6) Merksätze

Index:
> Startet immer bei 0.

Letztes Zeichen:
> length - 1

isEmpty:
> Keine Zeichen.

isBlank:
> Nur Leerzeichen.

indexOf:
> Sucht erstes Vorkommen.

lastIndexOf:
> Sucht letztes Vorkommen.

---

Im nächsten Abschnitt folgen die **String Manipulation Methods**  
(z. B. substring, replace, trim, toUpperCase, split).

---

