---
title: "String Manipulation"
date: 2026-02-25
weekday: "Mittwoch"
subject: "Programmiertechnik"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Strings"
topic: "String Manipulation Methoden"
level: "Grundlagen"
tags:
  - String
  - substring
  - replace
  - join
  - concat
  - repeat
  - indent
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Mittwoch, 2026-02-25_Programmiertechnik_UDEMY

## Überblick

String-Methoden zur Manipulation kann man in zwei Gruppen teilen:

### 1️⃣ „Aufräumen“ (Bedeutung bleibt gleich)

Diese Methoden ändern **nicht die inhaltliche Aussage**, sondern nur das Format:

- `trim()`
- `strip()`
- `toLowerCase()`
- `toUpperCase()`
- `indent()`

---

### 2️⃣ „Verändern“ (Inhalt ändert sich)

Diese Methoden erzeugen **neue Strings mit verändertem Inhalt**:

- `substring()`
- `concat()`
- `join()`
- `replace()`
- `replaceFirst()`
- `replaceAll()`
- `repeat()`

Wichtig:
> Strings sind immutable → jede Änderung erzeugt ein neues Objekt.

---

# 1) substring()

Sehr wichtig für Prüfungen.

## Variante 1

```java
String text = "25/11/1982";
System.out.println(text.substring(6));
```

Ergebnis:
```
1982
```

→ Startet bei Index 6 und nimmt den Rest.

---

## Variante 2 (mit Endindex)

```java
System.out.println(text.substring(3, 5));
```

Ergebnis:
```
11
```

Regel:
- Startindex inklusive
- Endindex exklusiv

Merksatz:
> substring(start, end) → Zeichen von start bis end-1

---

# 2) join()

Fügt mehrere Strings zusammen.

```java
String date = String.join("/", "25", "11", "1982");
System.out.println(date);
```

Ergebnis:
```
25/11/1982
```

Sehr sauber und lesbar.

---

# 3) concat()

```java
String date = "25".concat("/")
                  .concat("11")
                  .concat("/")
                  .concat("1982");
```

→ Funktioniert, aber ineffizient.

Besser:
```java
String date = "25" + "/" + "11" + "/" + "1982";
```

Wichtig für Prüfung:
Viele concat-Aufrufe erzeugen viele neue Objekte.

---

# 4) replace()

## Einzelnes Zeichen ersetzen

```java
System.out.println("25/11/1982".replace('/', '-'));
```

Ergebnis:
```
25-11-1982
```

---

## String ersetzen

```java
System.out.println("25/11/1982".replace("2", "00"));
```

Ergebnis:
```
005/11/100008000
```

---

# 5) replaceFirst() vs replaceAll()

```java
String text = "A-B-C-B";
```

```java
text.replaceFirst("B", "X");
```
Ergebnis:
```
A-X-C-B
```

```java
text.replaceAll("B", "X");
```
Ergebnis:
```
A-X-C-X
```

Wichtig:
- replaceAll arbeitet mit regulären Ausdrücken
- replace ersetzt direkt

---

# 6) repeat() (seit Java 11)

```java
System.out.println("ABC\n".repeat(3));
```

Ergebnis:
```
ABC
ABC
ABC
```

Sehr praktisch für Formatierungen.

---

# 7) indent() (seit Java 15)

Positive Zahl → Einrücken  
Negative Zahl → Einrückung entfernen

```java
System.out.println("ABC\n".repeat(3).indent(4));
```

→ Jede Zeile bekommt 4 Leerzeichen vorne.

```java
System.out.println("    ABC\n".repeat(2).indent(-2));
```

→ Entfernt 2 Leerzeichen pro Zeile.

---

# Wichtige Prüfungsmerksätze

- Strings sind immutable.
- substring() Endindex ist exklusiv.
- replaceAll() nutzt Regex.
- concat() erzeugt neue Objekte.
- repeat() und indent() sind neuere Features.
- Für viele Verkettungen → später StringBuilder verwenden.

---

# Typische IHK-Fragen

- Unterschied replace vs replaceAll?
- Was bedeutet immutable?
- Warum ist concat ineffizient?
- Wie funktioniert substring(start, end)?
- Was ist der Unterschied zwischen trim und strip?

---

