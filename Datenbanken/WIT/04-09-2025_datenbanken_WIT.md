## Donnerstag, 04-09-2025_datenbanken_WIT

THEMA: Data Manipulation mit SQL (praxisnah mit QueryBrowser)

ZIEL
- Du arbeitest in einem SQL-Client wie QueryBrowser und willst zügig eine kleine Datenbank anlegen, füllen und abfragen.
- Fokus auf DDL vs. DML, saubere Basisbefehle, typische Stolpersteine und kurze Übungsdrills.
- Auf kleinen Screens in HTML gut lesbar: alle Beispiele als eingerückte Codeblöcke (4 Leerzeichen).

KERNBEGRIFFE
- DDL (Data Definition Language): CREATE, ALTER, DROP - definiert Strukturen.
- DML (Data Manipulation Language): INSERT, UPDATE, DELETE, SELECT - arbeitet mit Daten.
- DCL (Data Control Language): GRANT, REVOKE - Rechteverwaltung.
- TCL (Transaction Control): COMMIT, ROLLBACK - Transaktionen steuern.
- Schema = logischer Container für Tabellen. In MySQL entspricht das einer Datenbank (CREATE DATABASE).
- Primärschlüssel (PRIMARY KEY): identifiziert Zeilen eindeutig. Einzigartigkeit + nicht null.
- Fremdschlüssel (FOREIGN KEY): verweist auf Primärschlüssel einer anderen Tabelle.

WORKFLOW IM QUERYBROWSER
1) Verbinden: Server wählen, Benutzer, Passwort.
2) Neues Schema anlegen: CREATE DATABASE, dann auswählen mit USE.
3) Tabellen definieren: Datentypen, Primary Keys, Constraints.
4) Daten einfügen: INSERT.
5) Daten abfragen: SELECT, WHERE, ORDER BY, LIMIT.
6) Beziehungen testen: JOINs.
7) Änderungen absichern: COMMIT (falls Autocommit aus).

MINI-DEMO: KLEINES SHOP-SCHEMA

    -- Schema
    CREATE DATABASE shopdb;
    USE shopdb;

    -- Tabellen
    CREATE TABLE customers (
      customer_id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      email VARCHAR(150) UNIQUE
    );

    CREATE TABLE products (
      product_id INT AUTO_INCREMENT PRIMARY KEY,
      title VARCHAR(120) NOT NULL,
      price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
    );

    CREATE TABLE orders (
      order_id INT AUTO_INCREMENT PRIMARY KEY,
      customer_id INT NOT NULL,
      ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );

    CREATE TABLE order_items (
      order_id INT NOT NULL,
      product_id INT NOT NULL,
      qty INT NOT NULL CHECK (qty > 0),
      PRIMARY KEY (order_id, product_id),
      FOREIGN KEY (order_id) REFERENCES orders(order_id),
      FOREIGN KEY (product_id) REFERENCES products(product_id)
    );

    -- Basisdaten
    INSERT INTO customers (name, email)
    VALUES ('Frieda Müller','frieda@example.com'),
           ('Matthew Schulz','matthew@example.com');

    INSERT INTO products (title, price)
    VALUES ('USB-C Kabel 1m', 8.99),
           ('Mechanische Tastatur', 79.90),
           ('Ergonomische Maus', 29.50);

    -- Bestellung anlegen
    INSERT INTO orders (customer_id) VALUES (1);   -- Frieda
    INSERT INTO order_items (order_id, product_id, qty)
    VALUES (1, 1, 2),  -- 2x USB-C
           (1, 3, 1);  -- 1x Maus

ABFRAGEN, DIE DU WIRKLICH BRAUCHST

    -- Alles aus einer Tabelle
    SELECT * FROM products;

    -- Filtern
    SELECT title, price FROM products
    WHERE price >= 30;

    -- Sortieren und begrenzen
    SELECT * FROM customers
    ORDER BY name ASC
    LIMIT 5;

    -- Einfache Aggregation
    SELECT COUNT(*) AS anzahl_produkte,
           MIN(price) AS billigstes,
           MAX(price) AS teuerstes,
           AVG(price) AS durchschnitt
    FROM products;

    -- Join über mehrere Tabellen (Bestellübersicht)
    SELECT o.order_id,
           c.name AS kunde,
           p.title AS produkt,
           oi.qty,
           (oi.qty * p.price) AS position_summe
    FROM orders o
    JOIN customers c    ON c.customer_id = o.customer_id
    JOIN order_items oi ON oi.order_id   = o.order_id
    JOIN products p     ON p.product_id  = oi.product_id
    ORDER BY o.order_id;

UPDATE UND DELETE SICHER NUTZEN

    -- Update zielgenau mit WHERE
    UPDATE products
    SET price = price * 1.05
    WHERE title = 'USB-C Kabel 1m';

    -- Delete immer mit WHERE testen
    DELETE FROM order_items
    WHERE order_id = 1 AND product_id = 1;

TRANSAKTIONEN (WENN AUTOCOMMIT AUS)

    START TRANSACTION;
      UPDATE products
      SET price = price - 5
      WHERE product_id = 2;
      -- Prüfen mit SELECT
    ROLLBACK;  -- oder COMMIT;

TYPISCHE STOLPERSTEINE
- Fehlendes USE schema; führt zu Table not found. Immer Schema aktivieren.
- DELETE oder UPDATE ohne WHERE löscht oder ändert zu viel. Erst WHERE mit SELECT verifizieren.
- Geldwerte als DECIMAL(p, s) statt FLOAT verwenden.
- Fremdschlüssel ohne Index sind langsam. Primärschlüssel sind indiziert, FK-Spalten bei Bedarf zusätzlich indexieren.
- CHECK Constraints sind versionsabhängig. Bei Bedarf per Trigger oder Applikationslogik absichern.

MINI-DRILLS FÜR DEN QUERYBROWSER

    -- 1) Neues Schema und Wechsel
    CREATE DATABASE schooldb;
    USE schooldb;

    -- 2) Tabellen
    CREATE TABLE students (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      class_level VARCHAR(20)
    );

    CREATE TABLE exams (
      id INT AUTO_INCREMENT PRIMARY KEY,
      title VARCHAR(120) NOT NULL,
      max_points INT NOT NULL CHECK (max_points > 0)
    );

    -- 3) Ergebnistabelle mit zusammengesetztem PK
    CREATE TABLE results (
      student_id INT NOT NULL,
      exam_id INT NOT NULL,
      points INT NOT NULL CHECK (points >= 0),
      PRIMARY KEY (student_id, exam_id),
      FOREIGN KEY (student_id) REFERENCES students(id),
      FOREIGN KEY (exam_id) REFERENCES exams(id)
    );

    -- 4) Daten füllen
    INSERT INTO students (name, class_level) VALUES
      ('Frieda', '10A'), ('Matthew', '10B'), ('Alice', '10A');

    INSERT INTO exams (title, max_points) VALUES
      ('Mathe KA1', 60), ('Informatik KA1', 50);

    INSERT INTO results (student_id, exam_id, points) VALUES
      (1,1,48), (1,2,42), (2,1,30), (3,2,35);

    -- 5) Join mit Prozentberechnung
    SELECT s.name,
           e.title,
           r.points,
           ROUND(r.points * 100.0 / e.max_points, 2) AS prozent
    FROM results r
    JOIN students s ON s.id = r.student_id
    JOIN exams e    ON e.id = r.exam_id;

    -- 6) Max Punkte anpassen und erneut prüfen
    UPDATE exams SET max_points = max_points + 10 WHERE id = 2;

    -- 7) Gezielt löschen
    DELETE FROM results WHERE student_id = 2 AND exam_id = 1;

    -- 8) Aggregation
    SELECT e.title,
           AVG(r.points) AS avg_points
    FROM results r
    JOIN exams e ON e.id = r.exam_id
    GROUP BY e.title;

CHEATSHEET - HÄUFIGE BEFEHLE
- Schema: CREATE DATABASE name; DROP DATABASE name; USE name;
- Tabellen: CREATE TABLE, ALTER TABLE, DROP TABLE
- DML: INSERT INTO t (...) VALUES (...); SELECT ... FROM ... WHERE ... ORDER BY ... LIMIT ...
- UPDATE t SET spalte = wert WHERE bedingung
- DELETE FROM t WHERE bedingung
- Joins: INNER JOIN, LEFT JOIN
- Aggregatfunktionen: COUNT, SUM, AVG, MIN, MAX
- Gruppen: GROUP BY spalte HAVING bedingung

ERKLÄRUNGEN IN KURZ
- INNER JOIN zeigt nur Zeilen mit Treffern auf beiden Seiten.
- LEFT JOIN zeigt alle Zeilen links und ergänzt rechts mit NULL, wenn kein Treffer.
- PRIMARY KEY sorgt für Eindeutigkeit, in MySQL oft AUTO_INCREMENT.
- FOREIGN KEY verweist auf PRIMARY KEY und erzwingt referenzielle Integrität.
- NORMALISIERUNG kurz: duplizierte Daten vermeiden, Entitäten trennen, Fremdschlüssel nutzen.

---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 04.09.2025 mit WIT.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 04.09.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift und Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: CC BY-NC-SA 4.0
</p>
</details>
