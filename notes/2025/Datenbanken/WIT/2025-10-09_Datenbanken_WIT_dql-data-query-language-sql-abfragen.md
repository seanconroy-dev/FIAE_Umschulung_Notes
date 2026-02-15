---
title: "DQL – Data Query Language (SQL-Abfragen)"
date: 2025-10-09
weekday: "Donnerstag"
subject: "DB"
instructor: "WIT"
program: "FIAE Umschulung 2025-2027"
module: "Relationale Datenbanken"
topic: "DQL – SELECT-Abfragen"
level: "Grundlagen"
tags:
  - SQL
  - DQL
  - Datenbanken
  - SELECT
  - GROUP BY
  - HAVING
  - Aggregatfunktionen
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-10-09_DB_WIT  
### DQL – Data Query Language (SQL-Abfragen)

**Thema:** Datenabfrage in relationalen Datenbanksystemen  
**Kontext:** Lesen, Filtern und Auswerten von Daten (ohne Veränderung)

---

## 1. Einordnung: SQL und DQL

SQL (Structured Query Language) besteht aus mehreren Teilsprachen:

- **DDL** – Data Definition Language (CREATE, ALTER, DROP)
- **DML** – Data Manipulation Language (INSERT, UPDATE, DELETE)
- **DQL** – Data Query Language (**SELECT**)
- **DCL** – Data Control Language (GRANT, REVOKE)
- **TCL** – Transaction Control Language (COMMIT, ROLLBACK)

Diese Mitschrift behandelt ausschließlich **DQL**.

---

## 2. Was ist DQL?

**DQL (Data Query Language)** dient zum **Abfragen von Daten** aus einer Datenbank.

Eigenschaften:
- liest Daten **ohne sie zu verändern**
- ist logisch **seiteneffektfrei**
- bildet die Grundlage für:
  - Auswertungen
  - Reports
  - Anwendungslogik
  - Benutzeroberflächen

Zentrales Schlüsselwort:

```sql
SELECT
```

---

## 3. Grundstruktur einer SELECT-Abfrage

```sql
SELECT spalten
FROM tabelle
WHERE bedingung;
```

Bedeutung:
- **SELECT** → Welche Daten?
- **FROM** → Aus welcher Tabelle?
- **WHERE** → Unter welchen Bedingungen?

Beispiel:

```sql
SELECT name, email
FROM kunden
WHERE aktiv = 1;
```

---

## 4. Wichtige Bestandteile von DQL

### WHERE – Filtern von Datensätzen

Vergleichsoperatoren:
- `=`, `!=`, `<`, `>`, `<=`, `>=`

Logische Operatoren:
- `AND`
- `OR`
- `NOT`

Beispiel:

```sql
SELECT *
FROM bestellungen
WHERE preis > 100 AND status = 'offen';
```

---

### ORDER BY – Sortieren von Ergebnissen

```sql
ORDER BY spalte ASC | DESC
```

Beispiel:

```sql
SELECT *
FROM produkte
ORDER BY preis DESC;
```

---

### LIMIT – Begrenzen der Ergebnismenge

```sql
LIMIT anzahl
```

Beispiel:

```sql
SELECT *
FROM logeintraege
ORDER BY zeitstempel DESC
LIMIT 10;
```

---

## 5. Aggregatfunktionen (Auswertungen)

DQL erlaubt statistische Auswertungen:

- `COUNT()` – Anzahl
- `SUM()` – Summe
- `AVG()` – Durchschnitt
- `MIN()` – Minimum
- `MAX()` – Maximum

Beispiel:

```sql
SELECT COUNT(*)
FROM kunden
WHERE aktiv = 1;
```

---

## 6. GROUP BY – Gruppierte Abfragen

Aggregatfunktionen werden **pro Gruppe** angewendet.

Beispiel:

```sql
SELECT status, COUNT(*)
FROM bestellungen
GROUP BY status;
```

---

## 7. HAVING – Filtern nach Aggregation

Unterschied:

- **WHERE** filtert *vor* der Gruppierung  
- **HAVING** filtert *nach* der Gruppierung  

Beispiel:

```sql
SELECT status, COUNT(*)
FROM bestellungen
GROUP BY status
HAVING COUNT(*) > 10;
```

---

## 8. DQL und Performance

Best Practices:

- Nur benötigte Spalten abfragen (`SELECT name` statt `SELECT *`)
- WHERE-Klauseln gezielt einsetzen
- Indizierte Spalten bevorzugen
- Große Ergebnismengen vermeiden

DQL-Abfragen beeinflussen direkt:
- Antwortzeiten
- Serverlast
- Benutzererfahrung

---

## 9. Typische Fehler

- `SELECT *` ohne Notwendigkeit
- Fehlende WHERE-Bedingungen
- Verwechslung von WHERE und HAVING
- Ungenaue Filter → unnötig große Ergebnismengen

---

## 10. Bedeutung für FIAE

DQL ist zentral für:

- Backend-Entwicklung
- Datenanalyse
- Webanwendungen
- Prüfungen (AP1/AP2)
- Technische Interviews

Ohne DQL:
- keine Datenanzeige  
- keine Suche  
- keine Auswertung

