---
title: "Kopf- und Fußgesteuerte Schleifen in Java"
date: 2025-09-22
weekday: "Montag"
subject: "Programmiertechnik"
instructor: "PAS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Schleifen und Kontrollstrukturen"
level: "Grundlagen"
tags:
  - Java
  - Schleifen
  - while
  - for
  - do-while
  - Kontrollstrukturen
  - Programmierlogik
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Kopf- und Fußgesteuerte Schleifen – 2025-09-22 (PAS)

## Thema
Schleifen (Loops) in Java – Grundlagen der Kontrollstrukturen

---

## 1. Was sind Schleifen?

Schleifen sind Kontrollstrukturen, mit denen ein Anweisungsblock mehrfach ausgeführt wird.

Zweck:
- Wiederholungen automatisieren
- Code verkürzen
- Datenmengen verarbeiten
- Logik klar strukturieren

---

## 2. Kopfgesteuerte Schleifen

### Definition
Die Bedingung wird **vor** dem Schleifenrumpf geprüft.

Ist sie von Anfang an falsch, wird der Codeblock **kein einziges Mal** ausgeführt.

Vertreter:
- `while`
- `for`

---

### 2.1 while-Schleife

```java
int i = 0;

while (i < 5) {
    System.out.println(i);
    i++;
}
```

Eigenschaften:
- Bedingung wird vor jedem Durchlauf geprüft
- Häufig bei unbekannter Anzahl an Wiederholungen

---

### 2.2 for-Schleife

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

Eigenschaften:
- Startwert, Bedingung und Änderung in einer Zeile
- Ideal bei bekannter Wiederholungsanzahl
- Zählergesteuerte Abläufe

---

## 3. Fußgesteuerte Schleifen

### Definition
Die Bedingung wird **nach** dem Schleifenrumpf geprüft.

Die Schleife wird **mindestens einmal** ausgeführt.

Vertreter:
- `do-while`

---

### 3.1 do-while-Schleife

```java
int i = 0;

do {
    System.out.println(i);
    i++;
} while (i < 5);
```

Eigenschaften:
- Mindestens ein Durchlauf
- Typisch bei Menü- oder Eingabeabfragen

---

## 4. Vergleich

| Merkmal | Kopfgesteuert | Fußgesteuert |
|----------|---------------|--------------|
| Bedingung geprüft | vor dem Durchlauf | nach dem Durchlauf |
| Mindestdurchläufe | 0 | 1 |
| Typische Formen | while, for | do-while |
| Einsatz | bekannte oder unbekannte Wiederholungen | Eingaben, Menüsysteme |

---

## 5. Verschachtelte Schleifen

### Definition
Eine Schleife innerhalb einer anderen Schleife.

Die innere Schleife läuft bei jedem Durchlauf der äußeren Schleife vollständig durch.

### Beispiel

```java
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        System.out.println("i = " + i + ", j = " + j);
    }
}
```

Ablauf:
- äußere Schleife: 3 Durchläufe
- innere Schleife: 3 Durchläufe je äußerem Durchlauf
- Gesamt: 9 Ausgaben

---

## 6. Typische Einsatzbereiche

- Tabellen (Zeilen/Spalten)
- Matrizen
- Koordinatensysteme
- Mehrdimensionale Datenstrukturen

---

## 7. Typische Fehlerquellen

- Endlosschleifen (Bedingung wird nie falsch)
- Zählvariable wird nicht verändert
- Falsche Bedingung bei do-while
- Zu tiefe Verschachtelung → schlechter lesbarer Code

---

## Kernaussagen

- Kopfgesteuerte Schleifen prüfen zuerst.
- Fußgesteuerte laufen mindestens einmal.
- `for` → bekannte Anzahl.
- `while` → unbekannte Anzahl.
- Verschachtelung multipliziert Durchläufe.

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Unterricht am 22.09.2025 mit PAS.<br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte.<br>
Autor: Sean Conroy<br>
Lizenz: CC BY-NC-SA 4.0
</p>
</details>
