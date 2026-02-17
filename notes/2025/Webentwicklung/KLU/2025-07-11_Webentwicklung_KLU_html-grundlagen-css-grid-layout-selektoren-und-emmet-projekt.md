---
title: "HTML-Grundlagen & CSS Grid – Layout, Selektoren und Emmet (Projekt)"
date: 2025-07-11
weekday: "Freitag"
subject: "Webentwicklung"
instructor: "KLU"
program: "FIAE Umschulung 2025-2027"
module: "Frontend-Grundlagen"
topic: "HTML5, CSS Grid, Selektoren, Emmet, Responsive Design"
level: "Grundlagen"
tags:
  - HTML
  - CSS
  - CSS-Grid
  - Responsive Design
  - Selektoren
  - Emmet
  - VS Code
  - Mobile First
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

## 11.07.2025 · Webentwicklung · KLU

# Projekt: HTML-Grundlagen & CSS Grid

Ziel:  
Strukturierte HTML-Seiten erstellen und mit CSS Grid moderne Layouts umsetzen.

---

# Grid-Grundlagen

CSS Grid ist ein Layout-Modul zur Erstellung von zweidimensionalen Layouts (Zeilen und Spalten).

Grundprinzip:

- Ein **Grid-Container** definiert das Raster.
- Darin befinden sich **Grid-Items**.
- Bereiche können mit **grid-area** benannt werden.
- Grid-Container können verschachtelt werden.

---

## Beispiel: Grid-Definition

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
```

Erklärung:

- `display: grid;` aktiviert Grid
- `repeat(3, 1fr)` = 3 gleich große Spalten
- `1fr` = ein Anteil des verfügbaren Raums
- `gap` = Abstand zwischen Elementen

Wichtig:  
Grid funktioniert nur, wenn das übergeordnete Element als Grid definiert wurde.

---

# HTML-Grundgerüst

| Tag / Befehl | Funktion |
|--------------|----------|
| `! + Tab` | HTML5-Standardgerüst (Emmet) |
| `<html lang="de">` | Dokumentensprache |
| `<meta charset="UTF-8">` | Zeichencodierung |
| `<meta name="viewport" content="width=device-width, initial-scale=1.0">` | Responsives Verhalten |
| `<title>` | Titel im Browser-Tab |

Reihenfolge:

1. HTML-Struktur erstellen  
2. CSS für Gestaltung einsetzen  

Struktur kommt vor Design.

---

# CSS-Grundlagen & Formatierung

| Begriff | Bedeutung |
|----------|------------|
| `margin` | Außenabstand |
| `padding` | Innenabstand |
| `margin: 0 auto;` | Horizontale Zentrierung |
| `width: 960px;` | Feste Breite (kein Leerzeichen zwischen Zahl und Einheit) |
| `/* Kommentar */` | CSS-Kommentar |

Einrückung mit `Tab` verbessert Lesbarkeit.

---

# Selektoren

- `#id` → Einmalig im Dokument
- `.klasse` → Mehrfach verwendbar

Regel:

IDs sind eindeutig. Klassen sind wiederverwendbar.

Struktur erfolgt über geschweifte Klammern `{}`.

---

# Wichtige Praxis-Hinweise

- HTML-Elemente beginnen standardmäßig oben links.
- Mobile First: Layout zunächst für mobile Geräte entwickeln.
- Dezimaltrennzeichen in CSS: Punkt `.` statt Komma.
- Dateinamen:
  - Keine Umlaute
  - Keine Leerzeichen
  - Kleinbuchstaben verwenden
- Webserver (z. B. Apache) sind unter Linux case-sensitiv.

---

# Wrapper-Konzept

Ein „Wrapper“ ist ein umschließendes `div`-Element, das:

- Inhalt gruppiert
- Layout begrenzt
- Zentrierung ermöglicht

Beispiel:

```html
<div class="wrapper">
  <!-- Inhalt -->
</div>
```

---

# Emmet – Schnellstrukturierung in VS Code

| Emmet | Ergebnis |
|--------|----------|
| `!` | HTML5-Grundgerüst |
| `ul>li*5` | Liste mit 5 Einträgen |
| `div.container>div.item*3` | Container mit 3 Elementen |
| `section#main>h1.title+p` | Abschnitt mit Überschrift und Absatz |
| `div*12` | 12 div-Elemente |

Emmet beschleunigt Layout-Experimente erheblich.

---

# Prüfungs- und Praxisbezug

Wichtige Konzepte:

- Trennung von Struktur (HTML) und Design (CSS)
- Grid als modernes Layoutsystem
- Responsives Verhalten durch CSS
- Richtige Nutzung von IDs und Klassen
- Mobile-First-Denken

Diese Grundlagen sind essenziell für:

- Frontend-Entwicklung
- Projektarbeiten
- Praktische Prüfungsanteile

