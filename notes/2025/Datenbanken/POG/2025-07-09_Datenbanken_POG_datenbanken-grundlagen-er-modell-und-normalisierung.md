---
title: "Datenbanken – Grundlagen, ER-Modell und Normalisierung"
date: 2025-07-09
weekday: "Mittwoch"
subject: "Datenbanken"
instructor: "POG"
program: "FIAE Umschulung 2025-2027"
module: "Relationale Datenbanken"
topic: "Grundlagen, ER-Modell, Normalisierung"
level: "Grundlagen"
tags:
  - Datenbanken
  - RDBMS
  - ER-Modell
  - Normalisierung
  - SQL
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-07-09_Datenbanken_POG

## Datenbanken – Grundlagen

**Thema:** Datenbank-Grundlagen, Relationale Modelle, ER-Modell, Normalisierung  
**Art:** Unterricht / Mitschrift  
**Quelle:** Unterricht am BFW Mühlenbeck (POG)  

- https://fi-wiki.de/  
- _Tests mit Stift und Papier_

---

## Definition und Zweck von Datenbanken

- Eine **Datenbank** ist eine strukturierte Sammlung von Daten zu einem bestimmten Thema oder Zweck.
- Sie ermöglicht **zugriffsgesteuerten Zugriff** auf gespeicherte Daten.
- Sie gewährleistet **Datensicherheit** und kontrollierte Manipulation.
- Relationale Datenbanken verhindern **Redundanzen** und sichern die **Datenkonsistenz**.

---

## Relationale vs. NoSQL-Datenbanken

### Relationale Datenbanken (RDBMS)

- Speicherung in **Tabellen mit festen Strukturen**
- Arbeiten mit Primär- und Fremdschlüsseln
- Geeignet für klar strukturierte Daten mit festen Beziehungen
- Beispiele:
  - MySQL
  - MariaDB
  - PostgreSQL
  - Oracle

### NoSQL-Datenbanken

- Flexible, nicht-tabellarische Modelle
- Geeignet für große, unstrukturierte oder stark skalierende Datenmengen

Typen:

- **Dokumentenbasiert** (z. B. MongoDB)
- **Key-Value** (z. B. Redis)
- **Graphdatenbanken** (z. B. Neo4j)

---

## Zentrale Begriffe im relationalen Modell

- **Entität:** Reales Objekt oder Konzept  
  Beispiel: Kunde, Bestellung, Produkt  

- **Attribut:** Eigenschaft einer Entität  
  Beispiel: Name, E-Mail, Geburtsdatum  

- **Relation:** Beziehung zwischen Entitäten  
  Realisiert über Primär- und Fremdschlüssel  

- **Datensatz (Tupel):** Eine Tabellenzeile  

---

## Relationales Modell

- Daten werden in **Tabellen** organisiert
- **Primärschlüssel (PK):**
  - Eindeutige Identifikation eines Datensatzes
- **Fremdschlüssel (FK):**
  - Verweis auf PK einer anderen Tabelle
  - Stellt Beziehung zwischen Tabellen her

---

## Kardinalitäten

### 1:1 (Eins-zu-Eins)
- Eine Entität gehört genau zu einer anderen  
Beispiel: Mitarbeiter – Firmenlaptop  

### 1:N (Eins-zu-Viele)
- Eine Entität kann mehrere andere besitzen  
Beispiel: Kunde – Bestellungen  

### N:M (Viele-zu-Viele)
- Viele Entitäten stehen zu vielen anderen in Beziehung  
Beispiel: Teilnehmer – Kurse  

→ Lösung: **Zwischentabelle** mit beiden Fremdschlüsseln  

---

## ER-Modell (Entity-Relationship-Modell)

Grafische Darstellung der Datenstruktur.

Elemente:

- **Rechtecke:** Entitäten  
- **Ellipsen:** Attribute  
- **Rauten:** Beziehungen  
- **Linien:** Verbindungen  
- **Zahlen:** Kardinalitäten  

### Beispielstruktur

Entität: **kunde**
- k_id (PK)
- nachname
- geb_datum

Entität: **bestellung**
- b_id (PK)
- datum

Beziehung:
Ein Kunde **hat** mehrere Bestellungen (1:n).

![ER-Modell](./images/erModl.png)

---

## Warum Datenbanken wichtig sind

- Strukturierte Speicherung großer Datenmengen
- Sicherstellung der Datenintegrität
- Schneller Zugriff auf Informationen
- Zugriffskontrolle und Rechteverwaltung

---

## Schritte der Datenbank-Modellierung

1. **Anforderungsanalyse**
2. **Konzeptionelle Modellierung (ER-Modell)**
3. **Logische Modellierung (Tabellen)**
4. **Physische Modellierung (DBMS-Implementierung)**

---

## Normalisierung

Optimierung der Tabellenstruktur zur Vermeidung von Redundanzen und Anomalien.

- **1NF:** Nur atomare Werte
- **2NF:** Keine partiellen Abhängigkeiten
- **3NF:** Keine transitiven Abhängigkeiten
