---
title: "Schreibtischtest"
date: 2026-05-06
weekday: "Mittwoch"
subject: "Programmiertechnik"
instructor: "POG"
program: "FIAE Umschulung 2025-2027"
module: "Softwarequalität & Testing"
topic: "Schreibtischtest / Dry Run"
level: "Grundlagen"
tags:
  - Testing
  - Schreibtischtest
  - Desk Test
  - Dry Run
  - Statischer Test
  - Programmablauf
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Schreibtischtest

## Kurzüberblick / Definition

Ein **Schreibtischtest** ist eine manuelle Prüfmethode, bei der ein Algorithmus, Programmablauf oder Quellcode **ohne tatsächliche Programmausführung** Schritt für Schritt nachvollzogen wird.

Dabei werden Variablenwerte, Bedingungen, Schleifendurchläufe und Ausgaben gedanklich oder tabellarisch verfolgt.

Der Schreibtischtest wird auch als **Desk Test** oder **Dry Run** bezeichnet.

Wichtig:  
Ein Schreibtischtest bedeutet **nicht**, dass eine Software an einem physischen Schreibtisch getestet wird. Gemeint ist das manuelle Durchgehen eines Programms oder Algorithmus „auf dem Papier“.

---

## Kernerklärung

### 1. Ziel eines Schreibtischtests

Das Ziel eines Schreibtischtests ist es, Fehler in der Logik eines Programms frühzeitig zu erkennen.

Typische Ziele sind:

- Programmablauf verstehen
- Variablenwerte nachvollziehen
- Fehler in Bedingungen erkennen
- Fehler in Schleifen erkennen
- falsche Ausgaben entdecken
- Sonderfälle prüfen
- Algorithmus vor der Implementierung oder Ausführung kontrollieren

Ein Schreibtischtest ist besonders hilfreich, wenn man prüfen möchte, ob ein Algorithmus logisch korrekt arbeitet.

---

### 2. Einordnung in das Testing

Ein Schreibtischtest gehört zu den **statischen Testverfahren**, weil der Code oder Algorithmus nicht tatsächlich ausgeführt wird.

| Testart | Bedeutung |
|---|---|
| **Statischer Test** | Prüfung ohne Programmausführung |
| **Dynamischer Test** | Prüfung mit Programmausführung |
| **Schreibtischtest** | Manuelles Nachvollziehen eines Programms oder Algorithmus ohne Ausführung |

Der Schreibtischtest unterscheidet sich von einem automatisierten Test, weil kein Testframework und keine echte Programmausführung verwendet werden.

---

### 3. Ablauf eines Schreibtischtests

Ein Schreibtischtest wird normalerweise Schritt für Schritt durchgeführt.

| Schritt | Beschreibung |
|---|---|
| **1. Code oder Algorithmus auswählen** | Der zu prüfende Programmteil wird festgelegt |
| **2. Testdaten bestimmen** | Es werden konkrete Eingabewerte gewählt |
| **3. Variablentabelle erstellen** | Wichtige Variablen werden tabellarisch notiert |
| **4. Anweisungen schrittweise durchgehen** | Jede Zeile oder jeder logische Schritt wird nachvollzogen |
| **5. Werte aktualisieren** | Variablenwerte werden nach jedem Schritt angepasst |
| **6. Ergebnis prüfen** | Das erwartete Ergebnis wird mit dem tatsächlichen gedanklichen Ergebnis verglichen |

---

### 4. Typische Bestandteile eines Schreibtischtests

Bei einem Schreibtischtest achtet man besonders auf:

- Eingabewerte
- Variablen
- Zuweisungen
- Bedingungen
- Schleifen
- Zähler
- Rückgabewerte
- Ausgaben
- Sonderfälle

Besonders wichtig sind Schleifen, weil dort häufig Fehler entstehen, zum Beispiel:

- Schleife läuft einmal zu viel
- Schleife läuft einmal zu wenig
- Schleife endet nie
- Zählvariable wird falsch erhöht
- Abbruchbedingung ist falsch formuliert

---

## Praktisches Beispiel

### Beispielcode

```java
int summe = 0;

for (int i = 1; i <= 4; i++) {
    summe = summe + i;
}

System.out.println(summe);
```

### Ziel

Es soll geprüft werden, welche Ausgabe das Programm erzeugt.

### Schreibtischtest als Tabelle

| Schritt | i | summe vor Rechnung | Rechnung | summe nach Rechnung |
|---|---:|---:|---|---:|
| Start | - | 0 | - | 0 |
| 1. Durchlauf | 1 | 0 | 0 + 1 | 1 |
| 2. Durchlauf | 2 | 1 | 1 + 2 | 3 |
| 3. Durchlauf | 3 | 3 | 3 + 3 | 6 |
| 4. Durchlauf | 4 | 6 | 6 + 4 | 10 |
| Ende | 5 | 10 | Bedingung `i <= 4` ist falsch | 10 |

### Ergebnis

Die Ausgabe lautet:

```text
10
```

### Erklärung

Die Schleife addiert die Zahlen von 1 bis 4.

```text
1 + 2 + 3 + 4 = 10
```

Der Schreibtischtest zeigt, dass die Schleife viermal ausgeführt wird und danach korrekt endet.

---

## Beispiel mit Fehler

### Fehlerhafter Code

```java
int summe = 0;

for (int i = 1; i < 4; i++) {
    summe = summe + i;
}

System.out.println(summe);
```

### Schreibtischtest

| Schritt | i | summe vor Rechnung | Rechnung | summe nach Rechnung |
|---|---:|---:|---|---:|
| Start | - | 0 | - | 0 |
| 1. Durchlauf | 1 | 0 | 0 + 1 | 1 |
| 2. Durchlauf | 2 | 1 | 1 + 2 | 3 |
| 3. Durchlauf | 3 | 3 | 3 + 3 | 6 |
| Ende | 4 | 6 | Bedingung `i < 4` ist falsch | 6 |

### Fehleranalyse

Die Ausgabe lautet:

```text
6
```

Wenn eigentlich die Summe von 1 bis 4 berechnet werden sollte, ist die Schleifenbedingung falsch.

Fehler:

```java
i < 4
```

Korrekt wäre:

```java
i <= 4
```

Dieser Fehler ist ein typischer **Off-by-one-Fehler**. Das bedeutet, dass eine Schleife einmal zu wenig oder einmal zu oft ausgeführt wird.

---

## Zusammenhang mit anderen Testarten

| Begriff | Zusammenhang |
|---|---|
| **Schreibtischtest** | Manuelles Nachvollziehen von Code oder Algorithmen |
| **Statischer Test** | Oberbegriff für Prüfungen ohne Programmausführung |
| **Review** | Gemeinsame Prüfung von Code oder Dokumenten durch Personen |
| **Codeanalyse** | Prüfung des Codes, oft mit Werkzeugen |
| **Unit-Test** | Automatisierter Test einzelner Methoden mit Programmausführung |

Der Schreibtischtest ist besonders einfach und benötigt keine spezielle Software. Er eignet sich gut zum Lernen, zur Prüfungsvorbereitung und zur Kontrolle kleiner Algorithmen.

---

## Abgrenzung: Schreibtischtest vs. Usability-Test

Ein häufiger Fehler ist die Verwechslung von Schreibtischtest und Usability-Test.

| Begriff | Bedeutung |
|---|---|
| **Schreibtischtest** | Manuelles Durchgehen eines Algorithmus oder Codes ohne Ausführung |
| **Usability-Test** | Prüfung der Benutzerfreundlichkeit einer Anwendung durch Benutzer oder Tester |

Ein Schreibtischtest prüft also nicht hauptsächlich die Benutzerfreundlichkeit, sondern die **logische Korrektheit** eines Programms oder Algorithmus.

---

## Vorteile eines Schreibtischtests

- Einfach durchzuführen
- Keine Testumgebung notwendig
- Keine Programmausführung notwendig
- Gut geeignet für kleine Programme und Algorithmen
- Hilft beim Verstehen von Programmabläufen
- Fehler können früh erkannt werden
- Besonders nützlich bei Bedingungen und Schleifen

---

## Grenzen eines Schreibtischtests

Ein Schreibtischtest hat auch Grenzen.

| Grenze | Erklärung |
|---|---|
| **Manuell und fehleranfällig** | Der Tester kann sich beim Nachvollziehen verrechnen |
| **Nicht gut für große Programme** | Bei komplexem Code wird der Aufwand schnell zu hoch |
| **Keine echte Laufzeitprüfung** | Speicher-, Laufzeit- oder Umgebungsfehler werden nicht zuverlässig erkannt |
| **Keine Automatisierung** | Der Test muss jedes Mal manuell durchgeführt werden |
| **Begrenzte Aussagekraft** | Nur ausgewählte Eingaben und Fälle werden geprüft |

Ein Schreibtischtest ersetzt daher keine Unit-Tests, Integrationstests oder Systemtests, sondern ergänzt sie.

---

## Exam Relevance (IHK)

Für die IHK-Prüfung ist der Schreibtischtest besonders relevant, weil häufig kleine Codebeispiele oder Algorithmen gegeben werden, deren Ergebnis man bestimmen soll.

Wichtige Prüfungsaspekte:

- Bedeutung des Begriffs **Schreibtischtest**
- Einordnung als **statisches Testverfahren**
- Unterschied zwischen statischem und dynamischem Test
- Schrittweises Nachvollziehen von Programmabläufen
- Arbeiten mit Variablentabellen
- Erkennen von Schleifenfehlern
- Erkennen von falschen Bedingungen
- Bestimmen von Ausgaben
- Nachvollziehen von Algorithmen ohne Programmausführung

Typische Prüfungsfragen:

- „Was versteht man unter einem Schreibtischtest?“
- „Ordnen Sie den Schreibtischtest statischen oder dynamischen Tests zu.“
- „Führen Sie einen Schreibtischtest für folgenden Algorithmus durch.“
- „Welche Ausgabe erzeugt das folgende Programm?“
- „Wie oft wird die Schleife ausgeführt?“
- „Welche Werte haben die Variablen nach dem dritten Schleifendurchlauf?“
- „Welcher Fehler liegt in der Schleifenbedingung vor?“

---

## Häufige Fehler & Missverständnisse

| Missverständnis | Richtigstellung |
|---|---|
| „Ein Schreibtischtest testet eine Software am Arbeitsplatz.“ | Falsch. Ein Schreibtischtest bedeutet, dass Code oder ein Algorithmus manuell nachvollzogen wird. |
| „Ein Schreibtischtest ist ein Usability-Test.“ | Falsch. Usability-Tests prüfen Benutzerfreundlichkeit, Schreibtischtests prüfen Programmlogik. |
| „Ein Schreibtischtest führt das Programm aus.“ | Falsch. Der Code wird nicht ausgeführt, sondern manuell durchgegangen. |
| „Schreibtischtests sind dynamische Tests.“ | Falsch. Sie gehören zu den statischen Tests. |
| „Schreibtischtests ersetzen Unit-Tests.“ | Falsch. Sie helfen beim Verständnis, ersetzen aber keine automatisierten Tests. |
| „Nur fertiger Code kann per Schreibtischtest geprüft werden.“ | Falsch. Auch Pseudocode und Algorithmen können geprüft werden. |

---

## Fazit

Ein Schreibtischtest ist eine einfache, manuelle Methode zur Prüfung von Algorithmen und Programmabläufen.

Wichtigste Kernaussagen:

- Ein Schreibtischtest wird **ohne Programmausführung** durchgeführt
- Er gehört zu den **statischen Testverfahren**
- Er dient dem Nachvollziehen von Variablen, Bedingungen, Schleifen und Ausgaben
- Er ist besonders hilfreich zum Erkennen von Logikfehlern
- Für die IHK-Prüfung ist wichtig, Code Schritt für Schritt analysieren und Variablenwerte tabellarisch darstellen zu können

Merksatz:

> Beim Schreibtischtest wird ein Programm nicht ausgeführt, sondern Schritt für Schritt im Kopf oder auf Papier nachvollzogen.