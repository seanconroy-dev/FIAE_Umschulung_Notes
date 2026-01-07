
## Mittwoch, 24-09-2025_DatenBanken_POG  
### Fremdschlüssel und Beziehungen in relationalen Datenbanken

**Thema:** Beziehungen zwischen Tabellen  
**Kontext:** Relationales Datenbankdesign (Grundlagen)

---

## 1. Fremdschlüssel – Grundidee

Ein **Fremdschlüssel (Foreign Key)** ist ein Attribut (oder eine Attributkombination) in einer Tabelle,  
das auf den **Primärschlüssel** einer anderen Tabelle verweist.

Zweck:
- Abbildung von Beziehungen zwischen Tabellen
- Sicherstellung der **referenziellen Integrität**
- Vermeidung inkonsistenter Daten

---

## 2. 1 : N-Beziehung (Eins-zu-Viele)

### Grundregel
> **Der Primärschlüssel der 1-Seite wird als Fremdschlüssel in der N-Seite gespeichert.**

### Beispiel
- **Kunde (1)** → **Bestellung (N)**

```
Kunde
- kunden_id (PK)

Bestellung
- bestell_id (PK)
- kunden_id (FK)
```

Begründung:
- Ein Kunde kann viele Bestellungen haben
- Eine Bestellung gehört genau zu einem Kunden

---

## 3. N : M-Beziehung (Viele-zu-Viele)

### Problem
Relationale Datenbanken können **N:M-Beziehungen nicht direkt** abbilden.

### Lösung
> **N:M-Beziehungen werden immer durch eine Hilfstabelle (Zwischentabelle) aufgelöst.**

### Grundregeln
- Die Hilfstabelle enthält:
  - den Primärschlüssel der ersten Tabelle als Fremdschlüssel
  - den Primärschlüssel der zweiten Tabelle als Fremdschlüssel
- Beide Fremdschlüssel bilden oft gemeinsam den Primärschlüssel der Hilfstabelle

> **Die „N-Seite“ kommt immer in die Hilfstabelle.**

### Beispiel
- **Schüler (N)** ↔ **Kurs (M)**

```
Schueler
- schueler_id (PK)

Kurs
- kurs_id (PK)

Schueler_Kurs
- schueler_id (FK)
- kurs_id (FK)
(PK: schueler_id + kurs_id)
```

---

## 4. 1 : 1-Beziehung (Eins-zu-Eins)

### Grundregel
> **Es wird nur ein Fremdschlüssel vergeben – nicht beide.**

### Begründung
- Zwei Fremdschlüssel würden Redundanz erzeugen
- Die Beziehung wäre unnötig doppelt modelliert

### Entscheidungskriterium
Der Fremdschlüssel wird dort gesetzt:
- wo die Beziehung **optional** ist
- oder wo sie **logisch besser passt**

### Beispiel
- **Person** ↔ **Ausweis**

```
Person
- person_id (PK)

Ausweis
- ausweis_id (PK)
- person_id (FK)
```

---

## 5. Zusammenfassung (Merksätze)

- **1 : N**  
  → Fremdschlüssel kommt auf die **N-Seite**

- **N : M**  
  → Immer **Hilfstabelle**  
  → Beide Seiten als Fremdschlüssel in der Hilfstabelle

- **1 : 1**  
  → **Nur ein** Fremdschlüssel  
  → Entscheidung nach Fachlogik

---

## 6. Prüfungsrelevanz (FIAE)

Diese Regeln sind zentral für:
- ER-Diagramme
- Normalisierung
- SQL-Tabellendesign
- Prüfungsaufgaben
- Praxisprojekte

Typische Prüfungsfragen:
- „Wie wird eine N:M-Beziehung aufgelöst?“
- „Wo liegt der Fremdschlüssel bei 1:N?“
- „Warum setzt man bei 1:1 nicht zwei Fremdschlüssel?“

---

---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 24.09.2025 mit POG.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergÃ¤nzenden Uebungsbeispielen vom 24.09.2025.<br><br>
Die Version wurde inhaltlich Ã¼berarbeitet, strukturell optimiert und technisch ergÃ¤nzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
