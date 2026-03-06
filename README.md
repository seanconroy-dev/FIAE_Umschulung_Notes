# FIAE Umschulung Notes

Markdown-basierte Mitschriften aus meiner Umschulung zum  
**Fachinformatiker für Anwendungsentwicklung (FIAE)**  
BFW Mühlenbeck · 2025–2027

👉 **Dokumentationsseite (empfohlen):**  
https://seanconroy-dev.github.io/FIAE_Umschulung_Notes/

Die vollständigen Notizen sind dort als durchsuchbare Dokumentation
mit Indexen, Themenübersicht und Tags verfügbar.

---

## Repository Struktur

```
.
├─ notes/        # eigentliche Markdown-Notizen (MkDocs Content Root)
├─ scripts/      # Automatisierungs- und Hilfsskripte
├─ reports/      # generierte Berichte / Migration Reports
├─ docs/         # Projektdokumentation
└─ LICENSE
```

---

## Notizsystem

Die Notizen sind systematisch aufgebaut.

Pfadstruktur:

```
notes/<jahr>/<fach>/<dozent>/<datei>.md
```

Beispiel:

```
notes/2026/Programmiertechnik/UDEMY/
2026-02-17_Programmiertechnik_UDEMY_class-objekt.md
```

---

## Metadaten

Jede Notiz enthält ein standardisiertes YAML-Frontmatter.

Beispiel:

```yaml
title: "java.lang.Object – Root-Klasse"
date: 2026-02-17
subject: "Programmiertechnik"
instructor: "UDEMY"
module: "OOP"
tags:
  - Java
  - OOP
  - AP1
```

Diese Metadaten werden verwendet, um automatisch Indexseiten
für Themen, Dozenten, Module und Tags zu generieren.

---

## Ziel des Projekts

Dieses Repository dient als:

- strukturierte Wissensbasis
- Lernsystem für die FIAE-Umschulung
- Vorbereitung auf **AP1 / AP2**
- öffentliches Lernportfolio

---

## Lizenz

© Sean Conroy  
MIT License
