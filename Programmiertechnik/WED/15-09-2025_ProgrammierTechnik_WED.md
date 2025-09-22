## Montag, 15-09-2025_ProgrammierTechnik_WED

### Switch-Case in Java

#### Grundidee
- Kontrollstruktur zum Abprüfen **fester Werte** einer Variablen.  
- Ersetzt oft lange **if-else-if-Ketten**.  
- Bietet **mehr Übersichtlichkeit und Lesbarkeit**, wenn mehrere Ausgänge möglich sind.  
- Besonders nützlich für **Menüführung, Zustandsabfragen oder Mapping von Werten**.  
- Seit Java 12/14 → **neue Switch-Expressions** mit vereinfachter Syntax und direkter Rückgabe von Werten.  

---

#### Klassische Syntax (ältere Form)
```java
switch (variable) {
    case Wert1:
        // Anweisungen
        break;
    case Wert2:
        // Anweisungen
        break;
    default:
        // Anweisungen falls kein Wert zutrifft
}
```

---

#### Einfaches Beispiel
```java
int tag = 2;

switch (tag) {
    case 1:
        System.out.println("Sonntag");
        break;
    case 2:
        System.out.println("Montag");
        break;
    case 3:
        System.out.println("Dienstag");
        break;
    default:
        System.out.println("Unbekannter Tag");
}
```

**Ablauf im Beispiel:**
- `tag == 2` → führt aus: `System.out.println("Montag");`
- `break;` → verhindert, dass weitere cases ebenfalls ausgeführt werden (Fall-Through).
- `default:` → wird ausgeführt, wenn kein case passt (ähnlich wie else).

---

#### Fall-Through Problem (ohne `break`)
```java
int tag = 2;

switch (tag) {
    case 1:
        System.out.println("Sonntag");
    case 2:
        System.out.println("Montag");
    case 3:
        System.out.println("Dienstag");
}
```
**Ausgabe:**
```
Montag
Dienstag
```
- Erklärung: Ohne `break;` springt das Programm nach einem Treffer in die nächsten Fälle hinein.  
- Deshalb ist `break;` **fast immer notwendig**, außer wenn Fall-Through gewollt ist.  

---

#### Switch mit Strings
Seit Java 7 möglich:
```java
String farbe = "rot";

switch (farbe) {
    case "rot":
        System.out.println("Stop!");
        break;
    case "grün":
        System.out.println("Go!");
        break;
    default:
        System.out.println("Unbekannte Farbe");
}
```

---

#### Switch mit Enums
Enums sind oft eleganter als Zahlen oder Strings:
```java
enum Wochentag { MONTAG, DIENSTAG, MITTWOCH }

Wochentag heute = Wochentag.MONTAG;

switch (heute) {
    case MONTAG:
        System.out.println("Wochenstart");
        break;
    case DIENSTAG:
        System.out.println("Noch weit bis zum Wochenende");
        break;
    default:
        System.out.println("Anderer Tag");
}
```

---

### Neue Switch-Expression (seit Java 12/14)

#### Grundidee
- Erweitert den klassischen `switch`.  
- Kann jetzt **einen Wert zurückgeben**.  
- Nutzt **Arrow-Syntax (`->`)**, kein `break;` mehr nötig.  
- Mehrere `case`-Labels können kombiniert werden.  

---

#### Beispiel: Rückgabe eines Wertes
```java
int tag = 2;

String wochentag = switch (tag) {
    case 1 -> "Sonntag";
    case 2 -> "Montag";
    case 3 -> "Dienstag";
    default -> "Unbekannt";
};

System.out.println(wochentag);
```
👉 Hier liefert `switch` direkt einen String zurück.  

---

#### Beispiel: Block mit `yield`
Wenn mehrere Anweisungen gebraucht werden:
```java
int tag = 2;

String info = switch (tag) {
    case 1, 7 -> "Wochenende";
    case 2, 3, 4, 5, 6 -> {
        System.out.println("Arbeitstag erkannt");
        yield "Woche";
    }
    default -> "Unbekannt";
};

System.out.println(info);
```

---

### Vergleich Klassisch vs. Neu

| Klassischer Switch | Neue Switch-Expression |
|--------------------|-------------------------|
| Benötigt `break;` nach jedem case | Kein `break;` nötig |
| Nur Kontrollfluss, keine direkte Rückgabe | Kann Werte zurückgeben |
| Lesbarer als lange if-else-Ketten | Noch kompakter, keine Fehler durch fehlendes break |
| Unterstützt primitive Typen, Strings, Enums | Gleiche Typen + modernere Syntax |
| Fall-Through möglich (Fehlerquelle) | Kein Fall-Through |

---

#### Typische Einsatzgebiete
- Menüführung in Konsolenprogrammen (z. B. „1 = Addieren, 2 = Subtrahieren“).  
- Übersetzung von Zahlen in Texte (z. B. Wochentage, Monate).  
- Zustandsmaschinen (z. B. Ampel mit Rot, Gelb, Grün).  
- Neue Syntax: Besonders geeignet, wenn ein **Wert zurückgegeben** werden soll.  

---

#### Einschränkungen
- Funktioniert nur mit:
  - `byte`, `short`, `int`
  - `char`
  - `String`
  - `enum`
- Keine Bereichsvergleiche (`<`, `>`, `<=`, `>=`). Dafür bleibt `if-else` nötig.  

---

#### Typische Prüfungsfrage
- „Wann sollte man switch verwenden und wann if-else?“  
  - **switch (klassisch oder neu)**: Wenn eine Variable mit **festen, diskreten Werten** verglichen wird.  
  - **if-else**: Wenn **Bereichsprüfungen** oder **komplexe Bedingungen** benötigt werden.  
- „Was ist der Unterschied zwischen klassischem switch und neuer Switch-Expression?“  
  - Klassisch → benötigt `break;`, keine Rückgabe möglich.  
  - Neu → kompakter, kein `break;`, Werte können direkt zurückgegeben werden.  

---
### For Loop
what is it?
what is the syntax
what is it used for?
why is it better or worse..
examples backwards and forwards
skipping number ( i -2)....

dauerschleifen.....
uebung ( sum up )
SumUp

Filename: SumUp.java

Schreiben Sie ein Java-Programm, das die Summe aller Zahlen von 1 bis 100 berechnet und anschließend 
das Ergebnis auf der Konsole ausgibt.

Anforderungen:
- Verwenden Sie eine Schleife (for).
- Nutzen Sie eine Variable, um die Zwischensumme zu speichern und schrittweise zu erhöhen.
- Geben Sie das Ergebnis mit dem Wort „Summe“ aus, z. B.:

>> java .\SumUp.java
Summe: 5050

Erweiterung: Zwischenergebnisse
- Geben Sie an:
  o Die bisherige Summe
  o Die zu addierende Zahl
  o Die neue Summe

>> java .\SumUp.java
0 + 1 = 1
1 + 2 = 3
3 + 3 = 6
6 + 4 = 10
10 + 5 = 15
15 + 6 = 21
21 + 7 = 28

---
Even-odd

Filename: EvenOdd.java

Schreiben Sie ein Java-Programm, das die Zahlen von 1 bis 20 durchläuft und bei jeder Zahl prüft, 
ob sie gerade oder ungerade ist.

Anforderungen:
- Verwenden Sie eine Schleife (for).
- Ermitteln Sie mit Hilfe des Modulo-Operators (%), ob eine Zahl gerade ist (i % 2 == 0).
- Geben Sie für jede Zahl eine Zeile im Format aus:

>> java .\EvenOdd.java
1 ist ungerade
2 ist gerade
3 ist ungerade
4 ist gerade
5 ist ungerade
6 ist gerade
7 ist ungerade
8 ist gerade
9 ist ungerade
10 ist gerade
11 ist ungerade
12 ist gerade
...

---
FizzBuzz

Filename: FizzBuzz.java

Schreiben Sie ein Java-Programm, das die Zahlen von 1 bis 30 ausgibt. Dabei gelten folgende Regeln:

- Für Zahlen, die durch 3 teilbar sind, geben Sie „Fizz“ statt der Zahl aus.
- Für Zahlen, die durch 5 teilbar sind, geben Sie „Buzz“ statt der Zahl aus.
- Für Zahlen, die sowohl durch 3 als auch durch 5 teilbar sind, geben Sie „FizzBuzz“ aus.
- Alle anderen Zahlen sollen ganz normal ausgegeben werden.

Hinweis: Verwenden Sie eine Schleife und eine geeignete Verzweigungsstruktur, um die Bedingungen umzusetzen.

Beispiel:

>> java .\FizzBuzz.java
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...

Erweiterung 1: Benutzerdefinierte Obergrenze

Passen Sie Ihr bestehendes FizzBuzz-Programm so an, dass die Obergrenze nicht mehr fest auf 30 gesetzt ist.
Stattdessen soll der Benutzer beim Start des Programms eine Zahl eingeben, bis zu der das Programm laufen soll.

Anforderungen:
- Fordern Sie den Benutzer per Input auf, eine Ganzzahl einzugeben.
- Geben Sie die Zahlen von 1 bis zur eingegebenen Zahl nach den bekannten FizzBuzz-Regeln aus.

Hinweis: Verwenden Sie z. B. Scanner, um die Benutzereingabe einzulesen.

Erweiterung 2: Benutzerdefinierte Teilbarkeitsregeln

Erweitern Sie Ihr FizzBuzz-Programm so, dass die Teilbarkeitsregeln individuell festgelegt werden können.

Anforderungen:
- Lassen Sie den Benutzer zwei ganze Zahlen eingeben:
  o Eine Zahl für die Ausgabe „Fizz“ (z. B. 2).
  o Eine Zahl für die Ausgabe „Buzz“ (z. B. 7).
- Geben Sie anschließend alle Zahlen von 1 bis zu einer ebenfalls eingegebenen Obergrenze nach den neuen Regeln aus:
  o Wenn eine Zahl durch die „Fizz“-Zahl teilbar ist: geben Sie „Fizz“ aus.
  o Wenn eine Zahl durch die „Buzz“-Zahl teilbar ist: geben Sie „Buzz“ aus.
  o Wenn eine Zahl durch beide Zahlen teilbar ist: geben Sie „FizzBuzz“ aus.
  o Andernfalls geben Sie die Zahl selbst aus.

Hinweis: Achten Sie darauf, die Benutzereingaben auf sinnvolle Werte zu überprüfen (z. B. keine Teilung durch 0).

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 15.09.2025 mit WED.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 15.09.2025.<br><br>
Die Version wurde inhaltlich erweitert (klassischer Switch + neue Switch-Expressions), strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>



