
## Mittwoch, 08-10-2025_Datenbanken_KNO

### Datenbanksprache SQL anwenden

---

0. **Hintergrundgeschichte**  
   - Entstehung und Zweck von SQL  
   - Bedeutung für relationale Datenbanken  

   **SQL** = *Structured Query Language*  
   → Weitverbreitete Sprache zur Arbeit mit **relationalen Datenbanken**.  
   Entwickelt Anfang der **1970er Jahre** auf Basis des relationalen Modells von Edgar F. Codd.  
   SQL ist eine **Standardsprache (ANSI / ISO)** für alle relationalen Datenbanksysteme.  
   Es existieren jedoch **verschiedene Dialekte**, z. B. MySQL, PostgreSQL, Oracle SQL, SQL Server.

   **SQL besteht aus mehreren Sprachbereichen:**
   - **DDL (Data Definition Language):** Definition von Strukturen → z. B. `CREATE`, `ALTER`, `DROP`
   - **DML (Data Manipulation Language):** Manipulation von Daten → z. B. `INSERT`, `UPDATE`, `DELETE`
   - **DQL (Data Query Language):** Abfrage von Daten → z. B. `SELECT`
   - **DCL (Data Control Language):** Zugriffsrechte → z. B. `GRANT`, `REVOKE`
   - **TCL (Transaction Control Language):** Steuerung von Transaktionen → z. B. `COMMIT`, `ROLLBACK`

---

1. **Syntaktische Grundlagen und Operatoren**  
   - Grundstruktur von SQL-Befehlen:  
     `SELECT Spalten FROM Tabelle WHERE Bedingung;`  
   - Vergleichsoperatoren: `=`, `<>`, `<`, `>`, `<=`, `>=`  
   - Logische Operatoren: `AND`, `OR`, `NOT`  
   - Arithmetische Operatoren: `+`, `-`, `*`, `/`  

   **Datentypen in SQL (Übersicht):**

   **Numerische Datentypen:**
   - `INT` / `INTEGER` – Ganze Zahl (Standardbereich bis ca. ±2 Milliarden)  
   - `SMALLINT` – Kleinere ganze Zahl (−32.768 bis 32.767)  
   - `BIGINT` – Sehr große ganze Zahl (bis ca. ±9 Quintillionen)  
   - `DECIMAL(p,s)` / `NUMERIC(p,s)` – Feste Anzahl an Stellen mit Nachkommastellen (z. B. Geldwerte)  
   - `FLOAT` / `REAL` / `DOUBLE PRECISION` – Gleitkommazahlen  

   **Zeichenketten (Strings):**
   - `CHAR(n)` – Feste Länge (z. B. `CHAR(5)` = immer 5 Zeichen)  
   - `VARCHAR(n)` – Variable Länge bis `n` Zeichen  
   - `TEXT` – Sehr lange Texte (Länge systemabhängig)  

   **Datums- und Zeittypen:**
   - `DATE` – Datum (Format: YYYY-MM-DD)  
   - `TIME` – Uhrzeit (Format: HH:MM:SS)  
   - `DATETIME` – Kombination aus Datum und Zeit  
   - `TIMESTAMP` – Zeitstempel, oft automatisch gesetzt  
   - `YEAR` – Jahresangabe (z. B. 2025)

   **Logische Datentypen:**
   - `BOOLEAN` / `BOOL` – Wahrheitswert (`TRUE` oder `FALSE`)  
   - Manche Systeme speichern dies intern als `TINYINT(1)` (z. B. MySQL)

   **Binäre Datentypen (für Dateien, Bilder, etc.):**
   - `BINARY(n)` – Feste Länge binärer Daten  
   - `VARBINARY(n)` – Variable Länge binärer Daten  
   - `BLOB` (*Binary Large Object*) – Große binäre Objekte  

   **Weitere spezielle Typen (je nach System):**
   - `ENUM('Wert1','Wert2',...)` – Fester Wertebereich  
   - `SET('Wert1','Wert2',...)` – Kombination mehrerer Werte aus festem Satz  
   - `JSON` – Strukturierte Datenspeicherung (MySQL, PostgreSQL)  
   - `UUID` – Universally Unique Identifier (z. B. für Primärschlüssel)

---

2. **Anlegen, Ändern und Löschen von Tabellen**  
   - Tabellenstruktur definieren oder anpassen:
     - `CREATE TABLE`  
     - `ALTER TABLE`  
     - `DROP TABLE`

---

3. **Einfügen, Ändern und Löschen von Datensätzen**  
   - Datensätze verwalten:
     - `INSERT INTO` – neue Daten hinzufügen  
     - `UPDATE` – vorhandene Daten ändern  
     - `DELETE FROM` – Daten löschen

---

4. **Abfrage von Daten**  
   - Abfragen mit `SELECT`:  
     `SELECT * FROM kunden;` → alle Spalten  
