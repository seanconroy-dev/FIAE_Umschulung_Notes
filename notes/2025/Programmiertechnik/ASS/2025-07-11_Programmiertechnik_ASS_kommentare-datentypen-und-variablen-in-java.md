---
title: "Kommentare, Datentypen, Variablen und Operatoren in Java"
date: 2025-07-11
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "Kommentare, Datentypen, Variablen, Operatoren"
level: "Grundlagen"
tags:
  - Java
  - Datentypen
  - Variablen
  - Operatoren
  - Kommentare
  - Programmiertechnik
  - primitive Datentypen
  - String
  - Typumwandlung
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Kommentare, Datentypen, Variablen und Operatoren in Java – 2025-07-11 (ASS)

## 1. Kommentare in Java

Kommentare sind Textstellen im Quellcode, die der Dokumentation dienen. Sie werden vom Compiler nicht als ausführbarer Programmcode behandelt.

### Warum Kommentare wichtig sind

Kommentare helfen dabei,

- die Absicht des Codes zu erklären
- Entscheidungen zu dokumentieren
- komplexe Logik verständlicher zu machen
- anderen Entwicklern den Einstieg zu erleichtern
- den eigenen Code später schneller wieder zu verstehen

### Wichtiger Grundsatz

Kommentare sollen **erklären, warum etwas getan wird**, nicht einfach nur wiederholen, was der Code ohnehin schon klar zeigt.

### Schlechter Kommentar

```java
int alter = 18; // setzt alter auf 18
```

Dieser Kommentar bringt kaum Mehrwert, weil der Code selbst bereits eindeutig ist.

### Besserer Kommentar

```java
int alter = 18; // Mindestalter für den Zugang zum System
```

Hier wird der fachliche Zweck erklärt.

---

## 2. Arten von Kommentaren

### 2.1 Einzeiliger Kommentar

```java
// Das ist ein einzeiliger Kommentar
```

Verwendung:

- kurze Hinweise
- einzelne Erklärungen
- temporäres Auskommentieren von Code

---

### 2.2 Mehrzeiliger Kommentar

```java
/*
 Das ist ein
 mehrzeiliger Kommentar
*/
```

Verwendung:

- längere Beschreibungen
- zusammenhängende Erklärungen
- Blockkommentare

---

### 2.3 JavaDoc-Kommentar

```java
/**
 * Beschreibt eine Klasse oder Methode.
 */
```

JavaDoc wird für technische Dokumentation von Klassen, Methoden und Parametern verwendet.

### Beispiel

```java
/**
 * Addiert zwei ganze Zahlen.
 *
 * @param a erste Zahl
 * @param b zweite Zahl
 * @return Summe aus a und b
 */
public static int addiere(int a, int b) {
    return a + b;
}
```

### Bedeutung in der Praxis

JavaDoc ist besonders wichtig für:

- Bibliotheken
- Teamprojekte
- API-Dokumentation
- professionelle Softwareentwicklung

---

## 3. Daten und Datentypen

Programme verarbeiten Daten. Damit Java weiß, wie ein Wert gespeichert und verarbeitet werden soll, braucht jede Variable einen Datentyp.

Der Datentyp legt fest:

- welche Art von Wert gespeichert wird
- wie viel Speicher benötigt wird
- welche Operationen erlaubt sind
- wie genau ein Wert dargestellt werden kann

### Beispiel

- `int` für ganze Zahlen
- `double` für Dezimalzahlen
- `boolean` für Wahrheitswerte
- `char` für einzelne Zeichen
- `String` für Texte

---

## 4. Primitive Datentypen und Referenztypen

In Java unterscheidet man grundlegend zwischen **primitiven Datentypen** und **Referenztypen**.

### 4.1 Primitive Datentypen

Primitive Datentypen speichern ihren Wert direkt.

Java kennt 8 primitive Datentypen:

| Datentyp | Bedeutung | Beispiel |
|---------|-----------|----------|
| `byte` | kleine ganze Zahl | `100` |
| `short` | mittlere ganze Zahl | `1000` |
| `int` | Standard für ganze Zahlen | `42` |
| `long` | große ganze Zahl | `10000000000L` |
| `float` | Dezimalzahl, geringere Genauigkeit | `3.14f` |
| `double` | Dezimalzahl, höhere Genauigkeit | `3.14159` |
| `char` | einzelnes Zeichen | `'A'` |
| `boolean` | Wahrheitswert | `true` |

---

### 4.2 Referenztypen

Referenztypen speichern nicht direkt den Inhalt, sondern eine Referenz auf ein Objekt.

Wichtige Beispiele:

- `String`
- Arrays
- Klassenobjekte
- Collections

### Beispiel

```java
String name = "Max";
```

`String` ist **kein primitiver Datentyp**, sondern ein Referenztyp.

---

## 5. Variablen in Java

Eine Variable ist ein benannter Speicherbereich, in dem ein Wert abgelegt wird.

### Eigenschaften von Variablen

- sie haben einen Namen
- sie besitzen einen Datentyp
- sie enthalten zu einem Zeitpunkt genau einen aktuellen Wert
- ihr Wert kann sich ändern, sofern sie nicht als Konstante definiert wurden

---

## 6. Deklaration, Initialisierung und Zuweisung

Diese Begriffe werden oft verwechselt, sind aber prüfungsrelevant.

### 6.1 Deklaration

Bei der Deklaration wird eine Variable angelegt.

```java
int alter;
```

Hier existiert die Variable `alter`, aber sie hat noch keinen gesetzten lokalen Startwert.

---

### 6.2 Initialisierung

Bei der Initialisierung erhält die Variable ihren ersten Wert.

```java
int alter = 18;
```

Hier erfolgen Deklaration und Initialisierung gleichzeitig.

---

### 6.3 Zuweisung

Bei einer Zuweisung bekommt eine bereits existierende Variable einen neuen Wert.

```java
alter = 21;
```

Der alte Wert wird überschrieben.

---

### Merksatz

- **Deklaration** = Variable anlegen
- **Initialisierung** = ersten Wert setzen
- **Zuweisung** = neuen Wert zuweisen

---

## 7. Syntax von Variablen

### Allgemeine Form

```java
Datentyp variablenname = wert;
```

### Beispiele

```java
int alter = 25;
double gehalt = 2500.75;
boolean istAktiv = true;
char note = 'A';
String name = "Sean";
```

### Mehrere Variablen gleicher Art

```java
double gehalt1 = 1000, gehalt2 = 1500;
```

Das ist syntaktisch erlaubt, aber in der Praxis häufig weniger lesbar als eine Zeile pro Variable.

---

## 8. Regeln für Variablennamen

Variablennamen müssen bestimmten Regeln folgen.

### Erlaubt

- Buchstaben
- Ziffern
- Unterstrich `_`
- Dollarzeichen `$`

### Nicht erlaubt

- Name darf nicht mit einer Ziffer beginnen
- keine Leerzeichen
- keine reservierten Schlüsselwörter wie `int`, `class`, `public`

### Gültige Beispiele

```java
int alter;
double gehaltProMonat;
boolean isReady;
```

### Ungültige Beispiele

```java
int 2zahl;
double mein gehalt;
boolean class;
```

---

## 9. Namenskonventionen

In Java gelten übliche Schreibweisen, die zur Lesbarkeit beitragen.

### Variablen und Methoden

`camelCase`

```java
double gehaltProMonat;
boolean isLoggedIn;
String kundenName;
```

### Klassen

`PascalCase`

```java
public class DatentypenBeispiel {
}
```

### Konstanten

Großbuchstaben mit Unterstrichen

```java
final double MEHRWERTSTEUER = 0.19;
```

---

## 10. Primitive Datentypen im Detail

## 10.1 Ganze Zahlen

### `int`

Der Standardtyp für ganze Zahlen.

```java
int anzahl = 42;
```

Wird am häufigsten verwendet, wenn keine extrem großen Werte benötigt werden.

### `long`

Für größere ganze Zahlen.

```java
long einwohnerzahl = 8300000000L;
```

Wichtig: Das `L` am Ende kennzeichnet ein `long`-Literal.

### `short` und `byte`

Werden seltener verwendet, meist wenn Speicher oder Schnittstellen eine Rolle spielen.

```java
byte alterInJahren = 25;
short temperatur = 300;
```

---

## 10.2 Gleitkommazahlen

Gleitkommazahlen werden für Werte mit Nachkommastellen verwendet.

### `double`

Standardtyp für Dezimalzahlen.

```java
double preis = 19.99;
```

### `float`

Benötigt das Suffix `f`.

```java
float temperatur = 21.5f;
```

### Wichtiger Hinweis

Gleitkommazahlen sind nicht immer exakt. Dadurch können Rundungsfehler entstehen.

```java
double wert = 0.1 + 0.2;
System.out.println(wert);
```

Das Ergebnis ist intern möglicherweise nicht exakt `0.3`.

### Fachlicher Hinweis

Für Geldbeträge ist `double` in der Fachpraxis oft problematisch, weil Rundungsfehler auftreten können. In professionellen Anwendungen wird dafür häufig `BigDecimal` verwendet. Für Java-Grundlagen ist aber zunächst wichtig, das Problem grundsätzlich zu kennen.

---

## 10.3 Wahrheitswerte

Der Datentyp `boolean` speichert genau zwei Zustände:

- `true`
- `false`

### Beispiel

```java
boolean istVolljaehrig = true;
boolean hatFehler = false;
```

### Typische Namensmuster

- `is...`
- `has...`
- `can...`

### Beispiele

```java
boolean isActive = true;
boolean hasAccess = false;
boolean canWrite = true;
```

---

## 10.4 Zeichen

Der Datentyp `char` speichert genau **ein einzelnes Zeichen**.

```java
char buchstabe = 'A';
char symbol = '%';
char waehrung = '€';
```

### Wichtig

- `char` verwendet **einfache Anführungszeichen**
- es darf genau **ein Zeichen** enthalten sein

### Fehler

```java
char text = 'Hallo';
```

Das ist ungültig, weil `char` nur ein Zeichen speichern kann.

---

## 10.5 Zeichenketten mit `String`

Ein `String` speichert mehrere Zeichen und wird für Texte verwendet.

```java
String name = "Max";
String ort = "Berlin";
String leer = "";
```

### Wichtig

- `String` ist ein Referenztyp
- `String` beginnt mit großem `S`
- Zeichenketten stehen in **doppelten Anführungszeichen**

### Beispiel

```java
String name = "Max";
System.out.println("Hallo " + name);
```

### Strings verarbeiten

```java
String eingabe = " Max ";
System.out.println(eingabe.trim());
```

`trim()` entfernt Leerzeichen am Anfang und Ende.

---

## 11. Literale in Java

Ein Literal ist ein direkt im Code geschriebener Wert.

### Beispiele

```java
10
3.14
true
'A'
"Hallo"
```

### Typische Besonderheiten

- `3.14` ist standardmäßig `double`
- `3.14f` ist `float`
- `10000000000L` ist `long`

---

## 12. Typumwandlung (Casting)

Nicht jeder Datentyp kann automatisch in jeden anderen umgewandelt werden.

---

### 12.1 Implizite Typumwandlung

Eine automatische Umwandlung erfolgt, wenn kein Informationsverlust zu erwarten ist.

```java
int zahl = 10;
double wert = zahl;
```

Hier wird `int` automatisch in `double` umgewandelt.

---

### 12.2 Explizite Typumwandlung

Wenn Informationen verloren gehen könnten, ist ein Cast erforderlich.

```java
double preis = 19.99;
int ganzzahl = (int) preis;
```

Das Ergebnis ist `19`, weil der Nachkommateil abgeschnitten wird.

---

### Wichtig für Prüfungen

- `int` zu `double` → automatisch möglich
- `double` zu `int` → nur mit Cast
- Cast bedeutet nicht Runden, sondern meist Abschneiden

---

## 13. Operatoren in Java

Operatoren verknüpfen Werte, vergleichen sie oder verändern sie.

---

## 13.1 Arithmetische Operatoren

Diese Operatoren werden für Berechnungen verwendet.

| Operator | Bedeutung | Beispiel |
|---------|-----------|----------|
| `+` | Addition | `a + b` |
| `-` | Subtraktion | `a - b` |
| `*` | Multiplikation | `a * b` |
| `/` | Division | `a / b` |
| `%` | Modulo / Restwert | `a % b` |

### Beispiel

```java
int a = 10;
int b = 3;

System.out.println(a + b);
System.out.println(a - b);
System.out.println(a * b);
System.out.println(a / b);
System.out.println(a % b);
```

### Wichtig: Ganzzahldivision

```java
int a = 7;
int b = 2;
System.out.println(a / b);
```

Ergebnis: `3`

Der Nachkommateil geht verloren, weil beide Operanden `int` sind.

### Für Dezimalergebnis

```java
double ergebnis = 7.0 / 2;
System.out.println(ergebnis);
```

Ergebnis: `3.5`

---

## 13.2 Zuweisungsoperatoren

Der häufigste Zuweisungsoperator ist `=`.

```java
int x = 5;
```

Daneben gibt es verkürzte Schreibweisen:

| Operator | Bedeutung |
|---------|-----------|
| `+=` | addieren und zuweisen |
| `-=` | subtrahieren und zuweisen |
| `*=` | multiplizieren und zuweisen |
| `/=` | dividieren und zuweisen |
| `%=` | Rest berechnen und zuweisen |

### Beispiel

```java
int x = 10;
x += 5;   // x = 15
x -= 2;   // x = 13
```

---

## 13.3 Inkrement und Dekrement

Mit `++` wird um 1 erhöht, mit `--` um 1 verringert.

```java
int i = 0;
i++;
i--;
```

### Beispiel

```java
int i = 5;
System.out.println(i++); // Ausgabe: 5
System.out.println(i);   // Ausgabe: 6
```

### Unterschied zwischen Postfix und Prefix

```java
int a = 5;
int b = a++; // b bekommt zuerst 5, dann wird a erhöht
```

```java
int a = 5;
int b = ++a; // a wird zuerst erhöht, dann bekommt b den Wert 6
```

Das ist für Einsteiger oft verwirrend und klausurrelevant.

---

## 13.4 Vergleichsoperatoren

Vergleichsoperatoren liefern immer einen `boolean`-Wert zurück.

| Operator | Bedeutung |
|---------|-----------|
| `==` | gleich |
| `!=` | ungleich |
| `<` | kleiner |
| `>` | größer |
| `<=` | kleiner oder gleich |
| `>=` | größer oder gleich |

### Beispiel

```java
int a = 5;
int b = 10;

System.out.println(a < b);   // true
System.out.println(a == b);  // false
```

---

## 13.5 Logische Operatoren

Logische Operatoren verknüpfen Wahrheitswerte.

| Operator | Bedeutung |
|---------|-----------|
| `&&` | UND |
| `||` | ODER |
| `!` | NICHT |

### Beispiel

```java
int alter = 20;
boolean hatAusweis = true;

boolean erlaubt = alter >= 18 && hatAusweis;
System.out.println(erlaubt);
```

---

## 13.6 String-Verkettung mit `+`

Der `+`-Operator kann auch Strings verknüpfen.

```java
String vorname = "Sean";
String nachname = "Conroy";

System.out.println(vorname + " " + nachname);
```

### Wichtiger Unterschied

Bei Zahlen rechnet `+`, bei Strings verkettet `+`.

```java
System.out.println(2 + 3);         // 5
System.out.println("2" + "3");     // 23
System.out.println("Ergebnis: " + 2 + 3); // Ergebnis: 23
System.out.println("Ergebnis: " + (2 + 3)); // Ergebnis: 5
```

---

## 14. Besondere Fallstricke

## 14.1 Zeichen plus Zahl

```java
double gehalt = 1234.56;
char zeichen = '€';
System.out.println(gehalt + "" + zeichen);
```

Das funktioniert, weil durch `""` eine String-Verkettung entsteht.

### Ohne leeren String

Bei bestimmten Kombinationen kann sonst eine numerische Verarbeitung erfolgen, weil `char` intern einen Zahlenwert besitzt.

---

## 14.2 Division durch 0

```java
int a = 10;
int b = 0;
int c = a / b;
```

Das führt bei Ganzzahlen zu einer `ArithmeticException`.

### Sichere Variante

```java
if (b != 0) {
    int c = a / b;
}
```

---

## 14.3 Verwechslung von `=` und `==`

```java
int a = 5;
boolean gleich = (a == 5);
```

- `=` bedeutet Zuweisung
- `==` bedeutet Vergleich

Das wird sehr häufig verwechselt.

---

## 14.4 `String` ist nicht `char`

```java
char zeichen = 'A';
String text = "A";
```

Das sieht ähnlich aus, ist aber nicht dasselbe:

- `char` = ein einzelnes Zeichen
- `String` = Zeichenkette

---

## 14.5 Nicht initialisierte lokale Variablen

Lokale Variablen müssen vor der Verwendung initialisiert werden.

### Fehlerhaft

```java
int zahl;
System.out.println(zahl);
```

Das führt zu einem Compilerfehler.

### Korrekt

```java
int zahl = 0;
System.out.println(zahl);
```

---

## 15. Konstanten mit `final`

Wenn sich ein Wert nach der Initialisierung nicht mehr ändern soll, verwendet man `final`.

```java
final double PI = 3.14159;
```

Danach ist keine neue Zuweisung mehr erlaubt.

```java
final int MAX_WERT = 100;
```

### Bedeutung

Konstanten verbessern:

- Lesbarkeit
- Wartbarkeit
- Fehlersicherheit

---

## 16. Gültigkeitsbereich von Variablen (Scope)

Variablen sind nur in dem Bereich sichtbar, in dem sie deklariert wurden.

### Beispiel

```java
public class Test {
    public static void main(String[] args) {
        int zahl = 10;

        if (zahl > 5) {
            int x = 20;
            System.out.println(x);
        }

        // System.out.println(x); // Fehler
    }
}
```

Die Variable `x` existiert nur innerhalb des `if`-Blocks.

### Wichtig

Der Scope ist besonders wichtig bei:

- `if`-Blöcken
- Schleifen
- Methoden
- Klassen

---

## 17. Ausgabe mit `System.out.println`

Viele Beispiele nutzen `System.out.println`, um Werte anzuzeigen.

### Beispiel

```java
int alter = 25;
System.out.println("Alter: " + alter);
```

### Unterschied

```java
System.out.print("Hallo");
System.out.print(" Welt");
```

Ausgabe:

```text
Hallo Welt
```

```java
System.out.println("Hallo");
System.out.println("Welt");
```

Ausgabe:

```text
Hallo
Welt
```

---

## 18. Grundstruktur eines Java-Programms

Der eigentliche Code steht in Klassen und häufig zunächst innerhalb der `main`-Methode.

```java
public class Start {
    public static void main(String[] args) {
        // Code hier
    }
}
```

### Bedeutung

| Bestandteil | Funktion |
|------------|----------|
| `public class Start` | Definition einer Klasse |
| `main` | Einstiegspunkt des Programms |
| `String[] args` | Übergabeparameter beim Programmstart |

---

## 19. IDE- und Projektgrundstruktur

Eine typische Java-Projektstruktur sieht vereinfacht so aus:

```text
Projekt
└── src
    └── package
        └── Start.java
```

### Wichtige Hinweise

- Eine öffentliche Klasse pro Datei
- Dateiname und Klassenname müssen zusammenpassen
- Quellcode liegt in `.java`-Dateien

---

## 20. Praktische Beispiele

## 20.1 Variablen deklarieren und ausgeben

```java
public class DatentypenUndVariablen {
    public static void main(String[] args) {
        int alter = 25;
        double gehalt = 2500.50;
        boolean istAzubi = true;
        char note = 'A';
        String name = "Sean";

        System.out.println("Name: " + name);
        System.out.println("Alter: " + alter);
        System.out.println("Gehalt: " + gehalt);
        System.out.println("Azubi: " + istAzubi);
        System.out.println("Note: " + note);
    }
}
```

---

## 20.2 Rechnen mit Variablen

```java
int wert1 = 1;
int wert2 = 2;
int erg = wert1 + wert2;

System.out.println("Ergebnis: " + erg);
```

---

## 20.3 Typumwandlung

```java
int ganzeZahl = 7;
double dezimalZahl = ganzeZahl;

System.out.println(dezimalZahl);
```

```java
double preis = 9.99;
int ganz = (int) preis;

System.out.println(ganz);
```

---

## 20.4 String und Ausgabe

```java
String vorname = "Max";
String nachname = "Mustermann";

System.out.println("Hallo " + vorname + " " + nachname);
```

---

## 21. Prüfungsrelevanz

Dieses Thema ist in Java-Grundlagen besonders wichtig, weil fast jede weitere Programmiertechnik darauf aufbaut.

### Typische Prüfungsfragen

- Unterschied zwischen primitiven Datentypen und Referenztypen
- Deklaration, Initialisierung und Zuweisung erklären
- passende Datentypen auswählen
- fehlerhafte Variablennamen erkennen
- Unterschied zwischen `char` und `String`
- Typumwandlungen erklären
- Operatoren zuordnen und anwenden
- Ganzzahldivision erkennen
- Unterschied zwischen `=` und `==`
- Bedeutung von `final`
- Scope von Variablen bestimmen

### Besonders wichtig

| Thema | Prüfungsrelevanz |
|------|-------------------|
| primitive Datentypen | Grundwissen |
| `String` als Referenztyp | sehr häufig |
| Deklaration / Initialisierung / Zuweisung | Standardfrage |
| Operatoren | sehr häufig |
| Typumwandlung | klassische Fehlerquelle |
| `char` vs. `String` | typische Einsteigerfrage |
| Ganzzahldivision | oft in Aufgaben |
| `final` | wichtig für Konstanten |
| Scope | wichtig für Codeverständnis |

---

## 22. Häufige Fehler

- falschen Datentyp wählen
- `String` mit `char` verwechseln
- `=` statt `==` schreiben
- lokale Variable nicht initialisieren
- bei `float` das `f` vergessen
- bei `long` das `L` vergessen
- bei Ganzzahldivision ein Dezimalergebnis erwarten
- Klammern bei komplexen Ausdrücken vergessen
- Variablen außerhalb ihres Gültigkeitsbereichs verwenden

---

## 23. Zusammenfassung

Kommentare, Datentypen, Variablen und Operatoren bilden das Fundament der Java-Programmierung.

### Zentrale Punkte

- Kommentare dienen der Dokumentation und Verständlichkeit
- primitive Datentypen speichern einfache Werte direkt
- `String` ist ein Referenztyp
- Variablen müssen korrekt deklariert und sinnvoll benannt werden
- Datentypen bestimmen mögliche Werte und Operationen
- Operatoren führen Berechnungen, Vergleiche und logische Verknüpfungen aus
- Typumwandlungen müssen verstanden werden, um Fehler zu vermeiden
- `final` wird für Konstanten verwendet
- Scope regelt, wo Variablen sichtbar sind

---

## 24. Kernaussagen

- Kommentare verbessern Lesbarkeit und Wartbarkeit von Code.
- Java kennt primitive Datentypen und Referenztypen.
- `int`, `double`, `boolean` und `char` gehören zu den wichtigsten primitiven Datentypen.
- `String` ist kein primitiver Datentyp, sondern ein Referenztyp.
- Variablen werden deklariert, initialisiert und später ggf. neu zugewiesen.
- Der Datentyp legt fest, welche Werte gespeichert werden können.
- Operatoren werden zum Rechnen, Vergleichen und Verknüpfen verwendet.
- `=` ist Zuweisung, `==` ist Vergleich.
- Bei Typumwandlungen kann es zu Informationsverlust kommen.
- `final` kennzeichnet Konstanten.
- Der Gültigkeitsbereich einer Variable bestimmt, wo sie verwendet werden darf.
