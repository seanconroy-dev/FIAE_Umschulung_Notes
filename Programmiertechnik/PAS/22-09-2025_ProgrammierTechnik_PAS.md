
## Montag, 22-09-2025_ProgrammierTechnik_PAS  
### Kopfgesteuerte und fußgesteuerte Schleifen – Grundlagen und Beispiele

**Thema:** Schleifen (Loops)  
**Kontext:** Programmierlogik, Kontrollstrukturen, Java-nahe Grundlagen

---

## 1. Was sind Schleifen?

**Schleifen** sind Kontrollstrukturen, mit denen ein Programm  
einen Anweisungsblock **mehrfach wiederholt** ausführt.

Zweck von Schleifen:
- Wiederholungen vermeiden
- Code verkürzen
- Logik klar ausdrücken
- Verarbeitung von Datenmengen

---

## 2. Kopfgesteuerte Schleifen

### Definition
Bei einer **kopfgesteuerten Schleife** wird die Bedingung **vor** dem Schleifenrumpf geprüft.

➡️ Wenn die Bedingung **falsch** ist, wird die Schleife **kein einziges Mal** ausgeführt.

Typische Vertreter:
- `while`
- `for`

---

### 2.1 while-Schleife (kopfgesteuert)

**Prinzip**
```
while (Bedingung) {
    Anweisungen
}
```

**Beispiel**
```java
int i = 0;

while (i < 5) {
    System.out.println(i);
    i++;
}
```

**Eigenschaften**
- Anzahl der Durchläufe oft nicht im Voraus bekannt
- Bedingung wird **vor jedem Durchlauf** geprüft

---

### 2.2 for-Schleife (kopfgesteuert)

**Prinzip**
```
for (Start; Bedingung; Änderung) {
    Anweisungen
}
```

**Beispiel**
```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

**Typischer Einsatz**
- Wenn die Anzahl der Wiederholungen bekannt ist
- Zählergesteuerte Abläufe

---

## 3. Fußgesteuerte Schleifen

### Definition
Bei einer **fußgesteuerten Schleife** wird die Bedingung **nach** dem Schleifenrumpf geprüft.

➡️ Die Schleife wird **mindestens einmal** ausgeführt, egal ob die Bedingung erfüllt ist oder nicht.

Typischer Vertreter:
- `do-while`

---

### 3.1 do-while-Schleife (fußgesteuert)

**Prinzip**
```
do {
    Anweisungen
} while (Bedingung);
```

**Beispiel**
```java
int i = 0;

do {
    System.out.println(i);
    i++;
} while (i < 5);
```

**Eigenschaften**
- Mindestens ein Durchlauf garantiert
- Bedingung wird **am Ende** geprüft

---

## 4. Vergleich: Kopf- vs. fußgesteuert

| Merkmal | Kopfgesteuert | Fußgesteuert |
|-------|---------------|--------------|
| Bedingung geprüft | vor dem Durchlauf | nach dem Durchlauf |
| Mindestdurchläufe | 0 | 1 |
| Typische Schleifen | while, for | do-while |
| Einsatz | unbekannte oder bekannte Wiederholungen | Menüabfragen, Eingaben |

---

## 5. Typische Anwendungsfälle

### Kopfgesteuert
- Verarbeitung von Listen
- Zählerschleifen
- Abbruch bei Nichterfüllung einer Bedingung

### Fußgesteuert
- Benutzereingaben
- Menüsysteme
- Wiederholen bis gültige Eingabe erfolgt

---

## 6. Verschachtelte Schleifen (Nested Loops)

### Definition
Eine **verschachtelte Schleife** ist eine Schleife **innerhalb einer anderen Schleife**.

Die innere Schleife wird:
- bei **jedem Durchlauf** der äußeren Schleife vollständig ausgeführt

---

### Beispiel: Verschachtelte for-Schleifen

```java
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        System.out.println("i = " + i + ", j = " + j);
    }
}
```

**Ablauf**
- äußere Schleife: 3 Durchläufe
- innere Schleife: 3 Durchläufe pro äußerem Durchlauf
- Gesamt: 9 Ausgaben

---

## 7. Typische Einsatzfälle für verschachtelte Schleifen

- Tabellen (Zeilen / Spalten)
- Matrizen
- Koordinatensysteme
- Mehrdimensionale Datenstrukturen

---

## 8. Typische Fehler

- Endlosschleifen (Bedingung wird nie falsch)
- Zählvariable wird nicht verändert
- Zu tiefe Verschachtelung (unübersichtlich)
- Falsche Bedingung bei do-while (unerwartete Durchläufe)

---

## Kernaussagen

- Kopfgesteuerte Schleifen prüfen **vorher**
- Fußgesteuerte Schleifen laufen **mindestens einmal**
- `for` eignet sich für bekannte Wiederholungen
- `while` für unbekannte
- Verschachtelte Schleifen multiplizieren die Durchläufe

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 22.09.2025 mit PAS.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergÃ¤nzenden Uebungsbeispielen vom 22.09.2025.<br><br>
Die Version wurde inhaltlich Ã¼berarbeitet, strukturell optimiert und technisch ergÃ¤nzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
