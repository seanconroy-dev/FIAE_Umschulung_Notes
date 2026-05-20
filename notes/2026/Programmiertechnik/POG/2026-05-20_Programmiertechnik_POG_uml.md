---
title: 'UML'
date: 2026-05-20
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: 'UML Grundlagen'
topic: 'UML Ueberblick und Diagrammarten'
level: 'AP1'
tags:
  - 'uml'
  - 'modellierung'
  - 'ap1'
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---

# UML (Unified Modeling Language)

UML ist eine **visuelle Sprache** zur Modellierung von Software und Systemen.

## AP1-Fokus in 60 Sekunden

UML hilft dir, Systeme fachlich und technisch eindeutig zu beschreiben.

In AP1 geht es oft um:

- Begriffssicherheit (Akteur, Klasse, Beziehung)
- Symbole korrekt lesen (Linien, Pfeile, Sichtbarkeit)
- den passenden Diagrammtyp fuer eine Aufgabe waehlen

---

## Begriffserklaerung

UML ist ein standardisierter Modellierungsstandard der OMG (Object Management Group), um Struktur und Verhalten von Systemen sichtbar zu machen.

---

## Hauptkategorien von UML-Diagrammen

| Kategorie | Frage | Beispiele |
|---|---|---|
| Strukturdiagramme | Wie ist das System aufgebaut? | Klassendiagramm, Komponentendiagramm |
| Verhaltensdiagramme | Wie verhaelt sich das System? | Use-Case-Diagramm, Aktivitaetsdiagramm, Sequenzdiagramm |

---

## Ziele von UML

- Kommunikation zwischen Fachbereich und Entwicklung verbessern
- Komplexitaet reduzieren
- Analyse, Design und Dokumentation unterstuetzen
- Missverstaendnisse vor der Implementierung vermeiden

---

## Wann nutze ich welchen Diagrammtyp?

| Situation | Sinnvoller Diagrammtyp |
|---|---|
| Anforderungen aus Nutzersicht klaeren | Use-Case-Diagramm |
| Klassen und Beziehungen planen | Klassendiagramm |
| Ablauf eines Prozesses darstellen | Aktivitaetsdiagramm |
| Nachrichtenfolge zwischen Objekten zeigen | Sequenzdiagramm |
| Komponenten/Module und Schnittstellen zeigen | Komponentendiagramm |

---

## Wichtig: UML ist kein Code!

- [Use-Case-Diagramm](../ASS/2026-03-26_Programmiertechnik_ASS_use-case-diagramm.md)
- [UML-Klassendiagramm](../ASS/2026-03-26_Programmiertechnik_ASS_uml-diagramm.md)
- [Aktivitaetsdiagramm](../SCH/2026-04-10_Programmiertechnik_SCH_aktivitaetsdiagramm.md)
- [Encapsulation UML OOP Grundlagen](2026-02-11_Programmiertechnik_POG_encapsulation-uml-oop-grundlagen.md)

---

## Typische AP1-Fragen mit Kurzantwort

| Frage | Erwartete Kernaussage |
|---|---|
| Warum UML statt nur Text? | UML macht Strukturen/Ablaeufe schneller und eindeutiger erfassbar. |
| Was ist der Unterschied Struktur vs Verhalten? | Struktur = statischer Aufbau, Verhalten = dynamische Ablaeufe/Interaktionen. |
| Ist UML Programmiersprache? | Nein, UML ist eine Modellierungssprache, kein ausfuehrbarer Code. |
| Was ist in AP1 besonders wichtig? | Diagrammtyp erkennen, Symbole korrekt lesen, fachlich sauber argumentieren. |

---

## Selbstcheck (2 Minuten)

1. Kann ich in einem Satz erklaeren, wofuer ein Use-Case-Diagramm gut ist?
2. Kann ich ein Klassendiagramm von einem Aktivitaetsdiagramm sicher unterscheiden?
3. Weiss ich, welches Diagramm ich fuer Anforderungen, Aufbau und Ablauf waehle?

Wenn du mindestens 2 von 3 mit Ja beantwortest, ist die Grundlage stabil.

---

## Reflexion

| Frage | Notiz |
|---|---|
| Was war heute mein groesster Aha-Moment? | |
| Welche Begriffe verwechsle ich noch? | |
| Welchen Diagrammtyp uebe ich als naechstes? | |

---

## IHK AP1 Mini-Test (10 Punkte)

Bearbeitungszeit: ca. 10-12 Minuten

## Aufgabe 1 - Diagrammtyp waehlen (Einfachauswahl, 2 Punkte)

Ein Unternehmen will zuerst klaeren, welche Rollen mit dem neuen Ticketsystem interagieren und welche fachlichen Ziele diese Rollen haben.

Welcher Diagrammtyp ist dafuer am besten geeignet?

- (A) Klassendiagramm
- (B) Use-Case-Diagramm
- (C) Komponentendiagramm
- (D) Sequenzdiagramm

<details>
<summary>Loesung anzeigen</summary>

**Loesung: (B)**

Begruendung: Es geht um Rollen (Akteure) und fachliche Ziele/Funktionen des Systems.

</details>

---

## Aufgabe 2 - Struktur vs. Verhalten (Mehrfachauswahl, 3 Punkte)

Welche Aussagen sind korrekt?

- (A) Ein Klassendiagramm gehoert zu den Strukturdiagrammen.
- (B) Ein Sequenzdiagramm zeigt primar statische Attribute von Klassen.
- (C) Ein Aktivitaetsdiagramm gehoert zu den Verhaltensdiagrammen.
- (D) Ein Use-Case-Diagramm hilft bei der Anforderungsanalyse.

<details>
<summary>Loesung anzeigen</summary>

**Loesung: (A), (C), (D)**

Punkteschema:

- 3 Punkte: alle korrekt, keine falsche Auswahl
- 2 Punkte: eine Abweichung
- 1 Punkt: zwei Abweichungen
- 0 Punkte: drei oder mehr Abweichungen

</details>

---

## Aufgabe 3 - Zuordnung (2 Punkte)

Ordne zu:

| Anforderung | Diagrammtyp |
|---|---|
| Nachrichtenreihenfolge zwischen Objekten darstellen | ? |
| Komponenten und Schnittstellen eines Systems darstellen | ? |

<details>
<summary>Loesung anzeigen</summary>

- Nachrichtenreihenfolge zwischen Objekten -> **Sequenzdiagramm**
- Komponenten und Schnittstellen -> **Komponentendiagramm**

</details>

---

## Aufgabe 4 - Kurzbegruendung (3 Punkte)

Erklaere in 3-4 Saetzen:

Warum ist UML in einem Teamprojekt oft besser als reine Textbeschreibung?

<details>
<summary>Beispielloesung anzeigen</summary>

UML stellt Struktur und Verhalten standardisiert dar, sodass alle Beteiligten dieselben Symbole und Begriffe nutzen. Dadurch sinkt das Risiko von Missverstaendnissen zwischen Fachbereich und Entwicklung. Diagramme machen komplexe Zusammenhaenge schneller erfassbar als langer Fliesstext. Zudem unterstuetzt UML die Planung und Dokumentation ueber mehrere Projektphasen hinweg.

Bewertungshinweis:

- 3 Punkte: mindestens drei fachlich korrekte Argumente
- 2 Punkte: zwei korrekte Argumente
- 1 Punkt: ein korrektes Argument
- 0 Punkte: keine fachlich korrekte Begruendung

</details>

---

## Auswertung

| Punkte | Einschaetzung |
|---|---|
| 9-10 | Sehr sicher fuer AP1 |
| 7-8 | Gute Grundlage, kleinere Luecken |
| 5-6 | Wiederholung sinnvoll |
| 0-4 | Thema gezielt neu aufarbeiten |


