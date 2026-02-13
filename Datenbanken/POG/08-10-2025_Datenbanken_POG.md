---
title: "SQL – Grundlagen und Sprachbereiche"
date: 2025-10-08
weekday: "Mittwoch"
subject: "Datenbanken"
instructor: "KNO"
program: "FIAE Umschulung 2025-2027"
module: "SQL"
topic: "SQL Grundlagen"
level: "Grundlagen"
tags:
  - Datenbanken
  - SQL
  - DDL
  - DML
  - DQL
  - Datentypen
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-10-08_Datenbanken_KNO

## Datenbanksprache SQL anwenden

---

## 0. Hintergrundgeschichte

- Entstehung und Zweck von SQL  
- Bedeutung für relationale Datenbanken  

**SQL** = *Structured Query Language*  
→ Weitverbreitete Sprache zur Arbeit mit relationalen Datenbanken.  

Entwickelt Anfang der **1970er Jahre** auf Basis des relationalen Modells von Edgar F. Codd.  
SQL ist eine **Standardsprache (ANSI / ISO)** für relationale Datenbanksysteme.  

Es existieren jedoch verschiedene Dialekte, z. B.:
- MySQL
- PostgreSQL
- Oracle SQL
- Microsoft SQL Server

---

## Sprachbereiche von SQL

- **DDL (Data Definition Language)**  
  → Definition von Strukturen  
  → `CREATE`, `ALTER`, `DROP`

- **DML (Data Manipulation Language)**  
  → Manipulation von Daten  
  → `INSERT`, `UPDATE`, `DELETE`

- **DQL (Data Query Language)**  
  → Abfrage von Daten  
  → `SELECT`

- **DCL (Data Control Language)**  
  → Zugriffsrechte  
  → `GRANT`, `REVOKE`

- **TCL (Transaction Control Language)**  
  → Steuerung von Transaktionen  
  → `COMMIT`, `ROLLBACK`

---

## 1. Syntaktische Grundlagen und Operatoren

Grundstruktur einer Abfrage:

```sql
SELECT Spalten
FROM Tabelle
WHERE Bedingung;
```

### Vergleichsoperatoren
`=`, `<>`, `<`, `>`, `<=`, `>=`

### Logische Operatoren
`AND`, `OR`, `NOT`

### Arithmetische Operatoren
`+`, `-`, `*`, `/`

---

## Datentypen in SQL (Übersicht)

### Numerische Datentypen
- `INT` / `INTEGER` – Ganze Zahl  
- `SMALLINT` – Kleinere ganze Zahl  
- `BIGINT` – Sehr große ganze Zahl  
- `DECIMAL(p,s)` / `NUMERIC(p,s)` – Feste Genauigkeit (z. B. Geldwerte)  
- `FLOAT`, `REAL`, `DOUBLE PRECISION` – Gleitkommazahlen  

### Zeichenketten
- `CHAR(n)` – Feste Länge  
- `VARCHAR(n)` – Variable Länge  
- `TEXT` – Lange Texte  

### Datums- und Zeittypen
- `DATE` – Datum (YYYY-MM-DD)  
- `TIME` – Uhrzeit (HH:MM:SS)  
- `DATETIME` – Datum + Zeit  
- `TIMESTAMP` – Zeitstempel  
- `YEAR` – Jahresangabe  

### Logische Datentypen
- `BOOLEAN` / `BOOL` – TRUE oder FALSE  
  - In manchen Systemen intern als `TINYINT(1)` gespeichert  

### Binäre Datentypen
- `BINARY(n)` – Feste Länge  
- `VARBINARY(n)` – Variable Länge  
- `BLOB` – Große binäre Objekte  

### Weitere systemabhängige Typen
- `ENUM(...)`
- `SET(...)`
- `JSON`
- `UUID`

---

## 2. Tabellen anlegen, ändern und löschen

- `CREATE TABLE`
- `ALTER TABLE`
- `DROP TABLE`

---

## 3. Datensätze verwalten

- `INSERT INTO` – neue Daten hinzufügen  
- `UPDATE` – vorhandene Daten ändern  
- `DELETE FROM` – Daten löschen  

---

## 4. Daten abfragen

```sql
SELECT *
FROM kunden;
```

→ Gibt alle Spalten der Tabelle `kunden` zurück.

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 08.10.2025 mit KNO.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 08.10.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Fach: Datenbanken<br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
