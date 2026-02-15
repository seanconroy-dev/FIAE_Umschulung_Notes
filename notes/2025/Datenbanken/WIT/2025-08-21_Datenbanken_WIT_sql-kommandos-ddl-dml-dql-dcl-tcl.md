---
title: "SQL-Kommandos – DDL, DML, DQL, DCL, TCL"
date: 2025-08-21
weekday: "Donnerstag"
subject: "Datenbanken"
instructor: "WIT"
program: "FIAE Umschulung 2025-2027"
module: "SQL"
topic: "SQL-Untergruppen & Grundlagen mit XAMPP"
level: "Grundlagen"
tags:
  - SQL
  - Datenbanken
  - DDL
  - DML
  - DQL
  - DCL
  - TCL
  - XAMPP
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-08-21_Datenbanken_WIT

## XAMPP

XAMPP ist ein lokales Entwicklungs- und Testpaket, das u. a. Apache, PHP und MySQL (bzw. MariaDB) enthält.  
Es wird häufig zum Erlernen und Testen von SQL-Datenbanken eingesetzt.

---

## Untergruppen der SQL-Kommandos

SQL-Befehle werden in fünf Hauptgruppen eingeteilt.  
Wichtig: **Jeder SQL-Befehl endet mit einem Semikolon (`;`).**

---

## 1. DDL – Data Definition Language

**Definition:**  
Befehle zum Erstellen, Ändern oder Löschen von Datenstrukturen.

### Beispiele

```sql
CREATE DATABASE schule;
USE schule;

CREATE TABLE schueler (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    geburtsdatum DATE
);
```

### Beispiel aus dem Unterricht (cdsammlung)

```sql
USE cdsammlung;

CREATE TABLE interpret
(
    Interpret_ID INT PRIMARY KEY AUTO_INCREMENT,
    Interpret_Name VARCHAR(40),
    Geburtsdatum DATE,
    Gruendungsdatum DATE
);
```

### Weitere DDL-Befehle

```sql
ALTER TABLE schueler ADD email VARCHAR(100);
ALTER TABLE schueler DROP email;

DROP TABLE schueler;

CREATE INDEX idx_nachname ON schueler(nachname);

CREATE VIEW schueler_view AS
SELECT vorname, nachname FROM schueler;
```

---

## 2. DML – Data Manipulation Language

**Definition:**  
Befehle zur Bearbeitung von Daten.

### Beispiele

```sql
INSERT INTO schueler (vorname, nachname, geburtsdatum)
VALUES ('Anna', 'Mueller', '2005-03-21');

UPDATE schueler
SET nachname = 'Meier'
WHERE id = 1;

DELETE FROM schueler WHERE id = 1;

REPLACE INTO schueler (id, vorname, nachname, geburtsdatum)
VALUES (2, 'Peter', 'Schmidt', '2004-07-15');

INSERT INTO schueler (id, vorname, nachname, geburtsdatum)
VALUES (3, 'Lena', 'Krause', '2006-11-10')
ON DUPLICATE KEY UPDATE vorname = VALUES(vorname);
```

---

## 3. DQL – Data Query Language

**Definition:**  
Befehle zum Abfragen von Daten.

### Beispiele

```sql
SELECT * FROM schueler;

SELECT vorname, nachname
FROM schueler
WHERE geburtsdatum > '2005-01-01';

SELECT vorname, nachname
FROM schueler
ORDER BY nachname ASC
LIMIT 5;
```

> Hinweis: `DELETE` gehört zur **DML**, nicht zur DQL.

---

## 4. DCL – Data Control Language

**Definition:**  
Befehle zur Verwaltung von Zugriffsrechten.

### Beispiele

```sql
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'geheim';

GRANT SELECT, INSERT ON schule.* TO 'testuser'@'localhost';

REVOKE INSERT ON schule.* FROM 'testuser'@'localhost';

FLUSH PRIVILEGES;
```

---

## 5. TCL – Transaction Control Language

**Definition:**  
Befehle zur Steuerung von Transaktionen.

### Beispiele

```sql
START TRANSACTION;

UPDATE schueler
SET nachname = 'Huber'
WHERE id = 2;

COMMIT;

ROLLBACK;

SAVEPOINT punkt1;

ROLLBACK TO punkt1;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

---

## Zusammenfassung

- **DDL** → Strukturen definieren  
- **DML** → Daten manipulieren  
- **DQL** → Daten abfragen  
- **DCL** → Rechte verwalten  
- **TCL** → Transaktionen steuern  

---

## Übersicht

| Kategorie | Zweck | Wichtige Befehle | Beispiel |
|-----------|-------|------------------|----------|
| DDL | Strukturen definieren | CREATE, ALTER, DROP | CREATE TABLE schueler (...); |
| DML | Daten manipulieren | INSERT, UPDATE, DELETE | INSERT INTO schueler VALUES (...); |
| DQL | Daten abfragen | SELECT | SELECT * FROM schueler; |
| DCL | Rechte verwalten | GRANT, REVOKE | GRANT SELECT ON schule.* TO user; |
| TCL | Transaktionen steuern | COMMIT, ROLLBACK | START TRANSACTION; ... COMMIT; |
