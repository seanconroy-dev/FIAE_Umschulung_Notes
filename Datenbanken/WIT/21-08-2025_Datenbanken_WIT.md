```markdown
# Donnerstag, 21-08-2025_Datenbanken_WIT

## XAMPP
XAMPP ist ein lokales Entwicklungs- und Testpaket, das u. a. MySQL (bzw. MariaDB), Apache, PHP und Perl enthält.  
Es wird oft für das Erlernen und Testen von SQL-Datenbanken genutzt.

---

## Untergruppen der SQL-Kommandos

SQL-Befehle werden in fünf Hauptgruppen eingeteilt. Jede Gruppe hat einen bestimmten Zweck.  
Wichtig: **Jeder SQL-Befehl endet mit einem Semikolon (`;`).**

---

### 1. DDL – Data Definition Language
**Definition:** Befehle, um Datenstrukturen und verwandte Elemente zu beschreiben oder zu verändern.  

**Beispiele (generisch):**
```sql
-- Datenbank erstellen
CREATE DATABASE schule;

-- Datenbank auswählen
USE schule;

-- Tabelle erstellen
CREATE TABLE schueler (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    geburtsdatum DATE
);
```

**Beispiel aus dem Unterricht (cdsammlung):**
```sql
-- Datenbank auswählen
USE cdsammlung;

-- Tabelle interpret erstellen
CREATE TABLE interpret
(
    Interpret_ID INT PRIMARY KEY AUTO_INCREMENT,
    Interpret_Name VARCHAR(40),
    Geburtsdatum DATE,
    Gruendungsdatum DATE
);
```

Weitere DDL-Befehle:
```sql
-- Tabelle ändern (Spalte hinzufügen)
ALTER TABLE schueler ADD email VARCHAR(100);

-- Spalte löschen
ALTER TABLE schueler DROP email;

-- Tabelle löschen
DROP TABLE schueler;

-- Index erstellen
CREATE INDEX idx_nachname ON schueler(nachname);

-- Sicht (View) erstellen
CREATE VIEW schueler_view AS
SELECT vorname, nachname FROM schueler;

-- Prozedur erstellen
DELIMITER //
CREATE PROCEDURE AlleSchueler()
BEGIN
    SELECT * FROM schueler;
END //
DELIMITER ;

-- Funktion erstellen
DELIMITER //
CREATE FUNCTION AnzahlSchueler()
RETURNS INT
BEGIN
    DECLARE anzahl INT;
    SELECT COUNT(*) INTO anzahl FROM schueler;
    RETURN anzahl;
END //
DELIMITER ;

-- Trigger erstellen
DELIMITER //
CREATE TRIGGER vor_insert_schueler
BEFORE INSERT ON schueler
FOR EACH ROW
BEGIN
    SET NEW.vorname = UPPER(NEW.vorname);
END //
DELIMITER ;
```

---

### 2. DML – Data Manipulation Language
**Definition:** Befehle, um Daten zu schreiben, zu ändern oder zu löschen.  

**Beispiele:**
```sql
-- Datensatz einfügen
INSERT INTO schueler (vorname, nachname, geburtsdatum)
VALUES ('Anna', 'Müller', '2005-03-21');

-- Datensätze aktualisieren
UPDATE schueler
SET nachname = 'Meier'
WHERE id = 1;

-- Datensatz löschen
DELETE FROM schueler WHERE id = 1;

-- Datensatz ersetzen (falls vorhanden wird überschrieben)
REPLACE INTO schueler (id, vorname, nachname, geburtsdatum)
VALUES (2, 'Peter', 'Schmidt', '2004-07-15');

-- Zwei Tabellen zusammenführen (MERGE / UPSERT-Logik über INSERT ... ON DUPLICATE KEY)
INSERT INTO schueler (id, vorname, nachname, geburtsdatum)
VALUES (3, 'Lena', 'Krause', '2006-11-10')
ON DUPLICATE KEY UPDATE vorname = VALUES(vorname);

-- Prozedur aufrufen
CALL AlleSchueler();

-- Erklärung eines SQL-Statements
EXPLAIN SELECT * FROM schueler WHERE nachname = 'Meier';

-- Tabelle sperren
LOCK TABLE schueler READ;
UNLOCK TABLES;
```

---

### 3. DQL – Data Query Language
**Definition:** Befehle, um Daten abzufragen.  

**Beispiele:**
```sql
-- Alle Datensätze abfragen
SELECT * FROM schueler;

-- Bestimmte Spalten mit Bedingung
SELECT vorname, nachname
FROM schueler
WHERE geburtsdatum > '2005-01-01';

-- Sortieren und limitieren
SELECT vorname, nachname
FROM schueler
ORDER BY nachname ASC
LIMIT 5;
```

> Hinweis: **`DELETE` gehört nicht zur DQL**, sondern zur DML.  

---

### 4. DCL – Data Control Language
**Definition:** Befehle, um Zugriffsrechte auf Daten zu vergeben oder zu entziehen.  

**Beispiele:**
```sql
-- Benutzer erstellen (nur MariaDB/MySQL)
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'geheim';

-- Rechte vergeben
GRANT SELECT, INSERT ON schule.* TO 'testuser'@'localhost';

-- Rechte entziehen
REVOKE INSERT ON schule.* FROM 'testuser'@'localhost';

-- Rechte neu laden
FLUSH PRIVILEGES;
```

---

### 5. TCL – Transaction Control Language
**Definition:** Befehle, um Transaktionen zu steuern (mehrere Befehle zu einer logischen Einheit zusammenzufassen).  

**Beispiele:**
```sql
-- Transaktion starten
START TRANSACTION;

-- Änderungen innerhalb der Transaktion
UPDATE schueler SET nachname = 'Huber' WHERE id = 2;

-- Änderungen dauerhaft speichern
COMMIT;

-- Änderungen zurücknehmen
ROLLBACK;

-- Sicherungspunkt setzen
SAVEPOINT punkt1;

-- Sicherungspunkt zurückrollen
ROLLBACK TO punkt1;

-- Transaktionseigenschaften festlegen
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

---

## Zusammenfassung
- **DDL** – Strukturen erstellen, ändern, löschen (Tabellen, Datenbanken, Views, Prozeduren, Trigger).  
- **DML** – Daten einfügen, ändern, löschen.  
- **DQL** – Daten abfragen (`SELECT`).  
- **DCL** – Berechtigungen verwalten.  
- **TCL** – Transaktionen steuern.  

---

## Übersichtstabelle

| Kategorie | Zweck | Wichtige Befehle | Beispiel |
|-----------|-------|------------------|----------|
| **DDL** | Strukturen definieren | `CREATE`, `ALTER`, `DROP` | `CREATE TABLE schueler (...);` |
| **DML** | Daten manipulieren | `INSERT`, `UPDATE`, `DELETE`, `REPLACE`, `MERGE` | `INSERT INTO schueler VALUES (...);` |
| **DQL** | Daten abfragen | `SELECT` | `SELECT * FROM schueler;` |
| **DCL** | Rechte verwalten | `GRANT`, `REVOKE` | `GRANT SELECT ON schule.* TO user;` |
| **TCL** | Transaktionen steuern | `COMMIT`, `ROLLBACK`, `SAVEPOINT` | `START TRANSACTION; ... COMMIT;` |
```
