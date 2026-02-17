---
title: "CSS Grid & Emmet – Strukturaufbau und Layout-Grundlagen"
date: 2025-07-18
weekday: "Freitag"
subject: "Webentwicklung"
instructor: "KLK"
program: "FIAE Umschulung 2025-2027"
module: "Frontend-Layoutsysteme"
topic: "CSS Grid, Emmet, ID-Selektor, Layoutstruktur"
level: "Grundlagen"
tags:
  - HTML
  - CSS
  - CSS-Grid
  - Emmet
  - ID-Selektor
  - Responsive Design
  - Layout
  - AP1
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# 18.07.2025 · WEB · KLK

## Thema: CSS Grid & Emmet-Erzeugung

Hinweis:  
In CSS bedeutet `#` → Auswahl per **ID-Selektor**  
Beispiel:

```css
#wrapper {
  background: #00ff00;
}
```

IDs dürfen nur **einmal pro Dokument** vorkommen.

---

# Warum CSS Grid?

CSS Grid ist ein **zweidimensionales Layoutsystem**.

Vorteile:

- Arbeiten mit **Zeilen und Spalten**
- Geeignet für komplexe Seitenlayouts
- Elemente können:
  - positioniert
  - gestreckt
  - über mehrere Zellen gelegt werden
- Unterstützt responsives Design durch:
  - `fr`
  - `minmax()`
  - `auto-fit`
  - `auto-fill`

Abgrenzung:

- Flexbox = eindimensional  
- Grid = zweidimensional

---

# HTML-Struktur mit Emmet erzeugen

Emmet beschleunigt das Schreiben von HTML.

## Emmet-Kürzel

```emmet
div#wrapper>header+main+aside+footer
```

Ergebnis nach `Tab`:

```html
<div id="wrapper">
  <header></header>
  <main></main>
  <aside></aside>
  <footer></footer>
</div>
```

Bedeutung:

- `div#wrapper` → div mit ID
- `>` → Verschachtelung
- `+` → Geschwisterelemente

Typische Seitenstruktur:

- header → Kopfbereich
- main → Hauptinhalt
- aside → Seitenbereich
- footer → Fußbereich

---

# CSS Grid – Grundstruktur

```css
#wrapper {
  display: grid;
  grid-template-columns: 1fr 2fr;
  grid-template-rows: auto auto;
  gap: 10px;
}
```

Erklärung:

- `display: grid;` → aktiviert Grid
- `1fr 2fr` → zweite Spalte doppelt so breit
- `auto` → Zeilenhöhe passt sich Inhalt an
- `gap` → Abstand zwischen Zellen

---

# Wichtige Grid-Eigenschaften

| Kürzel | Eigenschaft | Bedeutung |
|--------|-------------|------------|
| `gtc` | grid-template-columns | Spalten definieren |
| `gtr` | grid-template-rows | Zeilen definieren |
| `gcs` | grid-column-start | Startspalte |
| `grs` | grid-row-start | Startzeile |
| `gre` | grid-row-end | Endzeile |

Element über mehrere Spalten:

```css
main {
  grid-column: 1 / 3;
}
```

Oder:

```css
grid-column: span 2;
```

---

# Merkhilfen

| Kürzel | Bedeutung |
|---------|------------|
| `bg` | background |
| `mg` | margin |
| `wi` | width |
| `he` | height |
| `#00ff00` | Hex-Farbwert |

---

# Grundregeln

- HTML-Struktur zuerst
- CSS danach
- HTML-Kommentar: `<!-- Kommentar -->`
- CSS-Kommentar: `/* Kommentar */`

---

# Prüfungsrelevante Punkte (AP1)

- Unterschied Grid vs. Flexbox
- Bedeutung von `fr`
- Positionierung über mehrere Spalten
- ID-Selektor korrekt erklären
- Kommentar-Syntax kennen

CSS Grid ist ein zentrales Werkzeug moderner Weblayouts und Grundlage für saubere, responsive Seitenstrukturen.

