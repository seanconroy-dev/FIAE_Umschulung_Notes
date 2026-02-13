---
title: "Subqueries (Unterabfragen) in SQL"
date: 2026-01-26
weekday: "Montag"
subject: "Datenbanken"
instructor: "KNO"
program: "FIAE Umschulung 2025-2027"
module: "SQL & Abfragen"
topic: "Subqueries"
level: "Aufbau"
tags:
  - Datenbanken
  - SQL
  - DQL
  - Subqueries
  - CTE
  - Performance
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Montag, 2026-01-26_Datenbanken_KNO

## Subqueries (Unterabfragen)

- Eine Subquery ist eine SQL-Abfrage, die innerhalb einer anderen Abfrage verwendet wird.
- Sie dient dazu, komplexe Fragestellungen in mehrere logisch aufeinanderfolgende Schritte zu zerlegen.
- Subqueries können – abhängig vom Kontext – unterschiedliche Ergebnistypen liefern:
  - **Skalar** (ein einzelner Wert)
  - **Liste** (eine Spalte mit mehreren Werten)
  - **Tabelle** (mehrere Spalten und Zeilen)

---

## Verwendung von Subqueries in SQL-Klauseln

- `SELECT` erwartet:
  - Skalar (z. B. Aggregat oder Berechnung)
  - Liste
  - Tabelle
- `WHERE` erwartet:
  - Skalar
  - Liste (z. B. mit `IN`)
  - Tabelle (z. B. mit `EXISTS`)
- `FROM` erwartet:
  - Tabelle
- `HAVING` erwartet:
  - Skalar
  - Liste
- `JOIN` erwartet:
  - Tabelle
- `INSERT` erwartet:
  - Tabelle
- `UPDATE` erwartet:
  - Skalar
- `DELETE` erwartet:
  - Skalar
- `CREATE TABLE` erwartet:
  - Tabelle
- `WITH ... AS (SELECT ...)` (Common Table Expression, CTE) erwartet:
  - Tabelle

---

### Beispiel: Common Table Expression (CTE)

```sql
WITH dept_count AS (
    SELECT department_id, COUNT(*) AS emp_count
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_count
WHERE emp_count > 10;
```

---

## Beispiele für Subqueries

### Skalare Subquery (Einzelwert)

```sql
SELECT name
FROM employees
WHERE department_id = (
    SELECT id
    FROM departments
    WHERE name = 'Sales'
);
```

---

### Subquery mit Liste (`IN`)

```sql
SELECT name
FROM employees
WHERE department_id IN (
    SELECT id
    FROM departments
    WHERE location = 'New York'
);
```

---

### Subquery mit Aggregatfunktion

```sql
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

---

### Korrelierte Subquery (Bezug auf äußere Abfrage)

```sql
SELECT name,
       (SELECT COUNT(*)
        FROM orders
        WHERE orders.employee_id = employees.id) AS order_count
FROM employees;
```

---

## Weitere Eigenschaften von Subqueries

- Subqueries können selbst weitere Subqueries enthalten (Verschachtelung).
- Sie können als Ausdruck, Filter oder Datenquelle eingesetzt werden.
- Korrelierte Subqueries werden für jede Zeile der äußeren Abfrage erneut ausgewertet.

---

## Performance und Best Practices

- Subqueries können die Performance negativ beeinflussen, wenn sie ungünstig eingesetzt werden.
- Wichtige Optimierungsmaßnahmen:
  - Vermeidung unnötiger Subqueries
  - Verwendung von `JOIN`s, wenn sie funktional gleichwertig und effizienter sind
  - Einsatz von Indizes auf beteiligten Spalten
  - Nutzung von CTEs (`WITH`) zur besseren Lesbarkeit und Wartbarkeit
  - Analyse der Ausführungspläne (Query Execution Plans)
  - Vergleich von Abfragen mit und ohne Subqueries
  - Gezielter Einsatz von `EXISTS` oder `IN`, abhängig vom Anwendungsfall

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 26.01.2026 mit KNO.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 26.01.2026.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Fach: Datenbanken<br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
