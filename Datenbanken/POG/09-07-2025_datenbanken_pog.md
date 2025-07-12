### 09.07.2025 · Datenbanken · POG

**Thema**: Datenbank-Grundlagen, Relationale Modelle, ER-Modell, Normalisierung  
**Art**: Unterricht / Mitschrift  
**Quelle**: Unterricht am BFW Mühlenbeck, Dozent: POG

- [FI-Wiki.de](https://fi-wiki.de/)

- **_Tests mit stift und papier!_**

# Datenbanken Grundlagen

# Definition und Zweck von Datenbanken

- Eine **Datenbank** ist eine Sammlung von Daten, die sich auf ein bestimmtes Thema oder einen bestimmten Zweck beziehen
- Sie **ermöglicht Zugriff** auf gespeicherte Daten, ohne dass man wissen muss, wie die Daten organisiert sind
- Sie **gewährleistet Datensicherheit**, sodass nur berechtigte Benutzer Daten manipulieren können
- **Relationale Datenbanken** verhindern Redundanzen (mehrfaches Speichern gleicher Informationen) und sichern damit die Datenkonsistenz (Eindeutigkeit der Daten)

## Relationale vs. NoSQL-Datenbanken

### Relationale Datenbanken (RDBMS):

- Speichern Daten in **Tabellen mit vordefinierten Strukturen**
- Beispiele: MySQL, MariaDB, PostgreSQL, Oracle
- Eignen sich gut für strukturierte Daten mit klaren Beziehungen

### NoSQL-Datenbanken:

- Bieten **flexiblere Modelle** zur Datenspeicherung
- Verschiedene Typen:
  - **Dokumentenbasiert**: MongoDB (speichert Daten als JSON-ähnliche Dokumente)
  - **Schlüssel-Wert-Paare**: Redis (einfache Zuordnung von Werten zu Schlüsseln)
  - **Graphen**: Neo4j (spezialisiert auf vernetzte Daten)
- Gut für unstrukturierte Daten, hohe Skalierbarkeit und flexible Schemas

## Wichtige Begriffe in relationalen Datenbanken

- **Entität**: Ein reales Objekt oder Konzept, das in der Datenbank gespeichert wird
  - _Beispiel_: Kunde, Bestellung, Produkt
- **Attribut**: Eigenschaften einer Entität
  - _Beispiel_: Name, E-Mail-Adresse, Geburtsdatum
- **Relation**: Verbindung zwischen Entitäten, die durch Schlüssel definiert wird
  - Wird durch Primary Keys und Foreign Keys realisiert
- **Datensatz (Tupel)**: Eine Zusammenstellung von Daten über ein Objekt
  - Wird in einer Tabelle als **Zeile** dargestellt
  - _Beispiel_: Ein bestimmter Kunde mit allen seinen Daten

## Relationales Modell

- Daten werden in **Tabellen** organisiert (Zeilen und Spalten)
- **Primärschlüssel (Primary Key, PK)**:
  - Eindeutige Kennung für eine Zeile in einer Tabelle
  - _Beispiel_: Kundennummer, Personalnummer
- **Fremdschlüssel (Foreign Key, FK)**:
  - Verweis auf einen Primärschlüssel einer anderen Tabelle
  - Ermöglicht die Verknüpfung von Tabellen
  - _Beispiel_: Eine Bestellung enthält die Kundennummer als Fremdschlüssel

## Kardinalitäten in relationalen Datenbanken

### 1:1 (Eins-zu-Eins)

- Eine Entität ist **genau einer** anderen Entität zugeordnet
- _Beispiel_: Ein Mitarbeiter hat genau einen Firmen-Laptop

### 1:N (Eins-zu-Viele)

- Eine Entität kann mit **mehreren anderen** Entitäten verknüpft sein
- _Beispiel_: Ein Kunde kann mehrere Bestellungen haben, aber jede Bestellung gehört nur zu einem Kunden

### N:M (Viele-zu-Viele)

- Eine Entität kann mit **vielen anderen** verknüpft sein, und umgekehrt
- _Beispiel_: Ein Teilnehmer kann mehrere Kurse belegen, und ein Kurs kann mehrere Teilnehmer haben
- **Lösung**: Verwendung einer Zwischentabelle (z.B. teilnehmerKurs)
  - Diese Zwischentabelle enthält typischerweise die Primärschlüssel beider Entitäten als Fremdschlüssel

## ER-Modell (Entity-Relationship-Modell)

- **Grafische Darstellung** von Datenbankstrukturen
- Besteht aus:
  - **Entitäten**: Als Rechtecke dargestellt
  - **Attributen**: Als Ellipsen/Ovale dargestellt
  - **Beziehungen**: Als Rauten dargestellt

### Elemente im ER-Diagramm

- **Rechtecke**: Repräsentieren Entitäten (z.B. "kunde", "bestellung")
- **Ovale/Ellipsen**: Repräsentieren Attribute (z.B. "k_id", "nachname", "geb_datum")
- **Rauten**: Repräsentieren Beziehungen zwischen Entitäten (z.B. "hat")
- **Linien**: Verbinden Entitäten mit ihren Attributen und mit Beziehungen
- **Zahlen/Symbole an Linien**: Geben die Kardinalität an (1, n, m)

### Beispiel ER-Diagramm (aus dem Bild)

- Entität "kunde" mit Attributen:
  - k_id (Kunden-ID)
  - nachname
  - geb_datum (Geburtsdatum)
- Entität "bestellung" mit Attributen:
  - b_id (Bestellungs-ID)
  - datum
- Beziehung: Ein Kunde "hat" Bestellungen (1:n Beziehung)

  - "1" auf der Kundenseite: Ein Kunde...
  - "n" auf der Bestellungsseite: ...kann mehrere Bestellungen haben

  ![ER-Modell Diagramm](images/erModellDiagramm.png)

## Zusätzliche Erklärungen

### Warum sind Datenbanken wichtig?

- **Strukturierte Datenspeicherung**: Organisieren großer Datenmengen
- **Datenintegrität**: Verhindern von Dateninkonsistenzen
- **Effizienter Zugriff**: Schnelles Abrufen und Aktualisieren von Informationen
- **Datensicherheit**: Kontrolle, wer auf welche Daten zugreifen darf

### Schritte zur Datenbank-Modellierung

1. **Anforderungsanalyse**: Was soll gespeichert werden?
2. **Konzeptionelle Modellierung**: Erstellen eines ER-Modells
3. **Logische Modellierung**: Umwandlung in Tabellen
4. **Physische Modellierung**: Implementierung in einem DBMS (Datenbankmanagementsystem)

### Normalisierung

- Prozess zur Optimierung der Datenbankstruktur
- Verhindert Anomalien und Redundanzen
- Wichtige Normalformen:
  - **1NF**: Atomare Werte (keine Listen in Zellen)
  - **2NF**: Keine partiellen Abhängigkeiten
  - **3NF**: Keine transitiven Abhängigkeiten

---

_Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck. Diese Notizen sind öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und für Dritte zur Orientierung._
