---
title: "Data Manipulation mit SQL (praxisnah mit QueryBrowser)"
date: 2025-09-04
weekday: "Donnerstag"
subject: "Datenbanken"
instructor: "WIT"
program: "FIAE Umschulung 2025-2027"
module: "SQL"
topic: "DDL & DML – Praxis mit QueryBrowser"
level: "Grundlagen"
tags:
  - SQL
  - Datenbanken
  - DDL
  - DML
  - QueryBrowser
  - Joins
  - Transaktionen
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-09-04_Datenbanken_WIT

## THEMA: Data Manipulation mit SQL (praxisnah mit QueryBrowser)

## ZIEL

- Arbeiten in einem SQL-Client wie QueryBrowser  
- Kleine Datenbank anlegen, füllen und abfragen  
- Fokus auf DDL vs. DML  
- Saubere Basisbefehle  
- Typische Stolpersteine vermeiden  
- Gut lesbar auf kleinen Screens (Codeblöcke mit 4 Leerzeichen)

---

## KERNBEGRIFFE

- **DDL (Data Definition Language)**: CREATE, ALTER, DROP → definiert Strukturen  
- **DML (Data Manipulation Language)**: INSERT, UPDATE, DELETE, SELECT → arbeitet mit Daten  
- **DCL (Data Control Language)**: GRANT, REVOKE → Rechteverwaltung  
- **TCL (Transaction Control)**: COMMIT, ROLLBACK → Transaktionen steuern  
- **Schema** = logischer Container für Tabellen (in MySQL: CREATE DATABASE)  
- **PRIMARY KEY** → eindeutig + NOT NULL  
- **FOREIGN KEY** → verweist auf Primärschlüssel einer anderen Tabelle  

---

## WORKFLOW IM QUERYBROWSER

1. Verbinden (Server, Benutzer, Passwort)  
2. Schema anlegen → CREATE DATABASE  
3. Schema auswählen → USE  
4. Tabellen definieren (Datentypen, PK, Constraints)  
5. Daten einfügen → INSERT  
6. Daten abfragen → SELECT  
7. Beziehungen testen → JOIN  
8. Änderungen sichern → COMMIT (wenn Autocommit aus)

---

## MINI-DEMO: SHOP-SCHEMA

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

    -- Bestellung
    INSERT INTO orders (customer_id) VALUES (1);

    INSERT INTO order_items (order_id, product_id, qty)
    VALUES (1, 1, 2),
           (1, 3, 1);

---

## ABFRAGEN

    SELECT * FROM products;

    SELECT title, price FROM products
    WHERE price >= 30;

    SELECT * FROM customers
    ORDER BY name ASC
    LIMIT 5;

    SELECT COUNT(*) AS anzahl_produkte,
           MIN(price) AS billigstes,
           MAX(price) AS teuerstes,
           AVG(price) AS durchschnitt
    FROM products;

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

---

## UPDATE & DELETE

    UPDATE products
    SET price = price * 1.05
    WHERE title = 'USB-C Kabel 1m';

    DELETE FROM order_items
    WHERE order_id = 1 AND product_id = 1;

---

## TRANSAKTIONEN

    START TRANSACTION;

      UPDATE products
      SET price = price - 5
      WHERE product_id = 2;

    ROLLBACK;
    -- oder COMMIT;

---

## TYPISCHE STOLPERSTEINE

- Fehlendes `USE schema`
- UPDATE oder DELETE ohne WHERE
- Geldwerte als FLOAT statt DECIMAL
- Fehlende Indizes bei Fremdschlüsseln
- Versionsabhängige CHECK-Constraints

---

## MINI-DRILLS

    CREATE DATABASE schooldb;
    USE schooldb;

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

    CREATE TABLE results (
      student_id INT NOT NULL,
      exam_id INT NOT NULL,
      points INT NOT NULL CHECK (points >= 0),
      PRIMARY KEY (student_id, exam_id),
      FOREIGN KEY (student_id) REFERENCES students(id),
      FOREIGN KEY (exam_id) REFERENCES exams(id)
    );

    INSERT INTO students (name, class_level) VALUES
      ('Frieda', '10A'), ('Matthew', '10B'), ('Alice', '10A');

    INSERT INTO exams (title, max_points) VALUES
      ('Mathe KA1', 60), ('Informatik KA1', 50);

    INSERT INTO results (student_id, exam_id, points) VALUES
      (1,1,48), (1,2,42), (2,1,30), (3,2,35);

    SELECT s.name,
           e.title,
           r.points,
           ROUND(r.points * 100.0 / e.max_points, 2) AS prozent
    FROM results r
    JOIN students s ON s.id = r.student_id
    JOIN exams e    ON e.id = r.exam_id;

    UPDATE exams SET max_points = max_points + 10 WHERE id = 2;

    DELETE FROM results WHERE student_id = 2 AND exam_id = 1;

    SELECT e.title,
           AVG(r.points) AS avg_points
    FROM results r
    JOIN exams e ON e.id = r.exam_id
    GROUP BY e.title;

---

## CHEATSHEET

- CREATE DATABASE / DROP DATABASE / USE  
- CREATE TABLE / ALTER TABLE / DROP TABLE  
- INSERT / SELECT / UPDATE / DELETE  
- JOIN (INNER, LEFT)  
- GROUP BY / HAVING  
- COUNT / SUM / AVG / MIN / MAX  

---

## ERKLÄRUNGEN IN KURZ

- INNER JOIN → nur Treffer beider Seiten  
- LEFT JOIN → alle linken Zeilen + ggf. NULL rechts  
- PRIMARY KEY → eindeutig, oft AUTO_INCREMENT  
- FOREIGN KEY → referenzielle Integrität  
- Normalisierung → Redundanz vermeiden, Entitäten trennen  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 04.09.2025 mit WIT.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 04.09.2025.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift und Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: CC BY-NC-SA 4.0
</p>
</details>
