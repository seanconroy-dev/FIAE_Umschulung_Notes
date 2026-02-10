## Dienstag, 10-02-2026_Records_in_Java_PT_UDEMY

# Records in Java
 
## Definition und Einführung
**Records** sind eine spezielle Art von Klasse in Java, die ab **Java 14** als Preview-Feature eingeführt und in **Java 16** als Standardfeature übernommen wurden. Sie sind speziell für die **Speicherung von Daten** konzipiert und bieten eine **kompakte Syntax**, um Klassen zu definieren, die hauptsächlich aus Feldern bestehen.
 
Records sind **unveränderlich (immutable)** und generieren automatisch wichtige Methoden wie `equals()`, `hashCode()`, `toString()` sowie einen **Konstruktor** und **Accessor-Methoden** für alle deklarierten Felder.
 
---
 
## Syntax und Beispiel
### Grundlegende Syntax
```java
public record RecordName(Typ1 feld1, Typ2 feld2, ...) {}
```
 
### Beispiel: `Person`-Record
```java
public record Person(String name, int age) {}
```
- Der Compiler generiert automatisch:
  - Einen **Konstruktor** mit den Parametern `name` und `age`
  - **Accessor-Methoden** (`name()` und `age()` – **keine Getter-Setters!**)
  - Die Methoden `equals()`, `hashCode()` und `toString()`
 
---
 
## Vorteile von Records
| Vorteil                     | Beschreibung                                                                                     |
|-----------------------------|-------------------------------------------------------------------------------------------------|
| **Weniger Boilerplate-Code** | Records reduzieren den Codeaufwand für einfache Datenklassen deutlich.                        |
| **Unveränderlichkeit**      | Records sind standardmäßig **immutable**, was die Sicherheit und Vorhersagbarkeit erhöht.     |
| **Automatische Methoden**    | Der Compiler generiert `equals()`, `hashCode()`, `toString()` und Accessor-Methoden automatisch. |
| **Kompakte Syntax**         | Die Definition ist kurz und prägnant.                                                          |
 
---
 
## Einschränkungen von Records
| Einschränkung                     | Beschreibung                                                                                     |
|-----------------------------------|-------------------------------------------------------------------------------------------------|
| **Keine Vererbung**               | Records können nicht von anderen Klassen erben, aber Schnittstellen implementieren.             |
| **Keine zusätzlichen Felder**     | Alle Felder müssen im Record-Header deklariert werden.                                         |
| **Keine Modifizierer**            | Felder sind implizit `private` und `final`.                                                     |
| **Keine Setter-Methoden**         | Records sind unveränderlich; es gibt keine Setter-Methoden.                                    |
 
---
 
## Records vs. POJOs
 
| Merkmal               | Record                                  | POJO (Plain Old Java Object)                     |
|-----------------------|-----------------------------------------|-------------------------------------------------|
| **Zweck**             | Speicherung von Daten                   | Flexibel: Daten, Logik, Vererbung, etc.         |
| **Unveränderlichkeit** | Immer immutable                         | Kann mutable oder immutable sein                |
| **Boilerplate-Code**  | Minimal (automatische Methoden)        | Mehr Code (manuelle Getter/Setter/Methoden)     |
| **Vererbung**         | Nicht möglich                          | Möglich                                        |
| **Flexibilität**      | Eingeschränkt (nur Daten)              | Hoch (beliebige Logik und Struktur)             |
 
---
 
## Accessor-Methoden in Records
Records verwenden **keine klassischen Getter-Methoden**, sondern **automatisch generierte Accessor-Methoden**, die den Feldnamen tragen:
```java
public record Person(String name, int age) {}
// Accessor-Methoden:
String name = person.name();  // Nicht: person.getName()
int age = person.age();        // Nicht: person.getAge()
```
 
---
 
## Wann sollte man Records verwenden?
- **Datenklassen:** Wenn die Klasse hauptsächlich aus Feldern besteht und unveränderlich sein soll.
- **DTOs (Data Transfer Objects):** Ideal für die Übertragung von Daten zwischen Schichten.
- **Wertobjekte:** Wenn Objekte durch ihre Werte definiert sind (z. B. `Point`, `Range`).
 
## Wann sollte man POJOs verwenden?
- **Komplexe Logik:** Wenn die Klasse Methoden mit komplexer Logik enthält.
- **Vererbung:** Wenn die Klasse von einer anderen Klasse erben soll.
- **Mutable Objekte:** Wenn die Objekte nach der Erstellung verändert werden müssen.
 
---
 
**Hinweis:**
Die `@Override`-Annotation wird verwendet, um anzuzeigen, dass eine Methode eine Methode der Superklasse überschreibt. Dies hilft, Fehler zur Compile-Zeit zu erkennen, falls die Methode nicht tatsächlich eine Methode der Superklasse überschreibt.
---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 10.02.2026 mit UDEMY.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 10.02.2026.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>