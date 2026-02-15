---
title: "Linux – Absolute und relative Pfade"
date: 2025-09-03
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Dateisystem & Navigation"
level: "Grundlagen"
tags:
  - Linux
  - Pfade
  - Dateisystem
  - Navigation
  - CLI
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-09-03_BS_WED

## Thema: Absolute und relative Pfade in Linux

---

## Grundlagen

- **Absoluter Pfad**: beschreibt den kompletten Weg ab der Wurzel `/`.  
  Beispiel:  
  `/home/admini/documents/reports/report1.txt`

- **Relativer Pfad**: beschreibt den Weg ausgehend vom aktuellen Verzeichnis.  
  Beispiel:  
  Von `documents/reports` nach `music/jazz/song2.mp3` →  
  `../../music/jazz/song2.mp3`

- **Home-Verzeichnis**:  
  Jedes Benutzerkonto hat ein eigenes Startverzeichnis, meist `/home/<benutzername>`.  
  Abkürzung: `~` (Tilde)

---

## Beispiel-Verzeichnisbaum

```
/home
└── admini
    ├── documents
    │   ├── reports
    │   │   └── report1.txt
    │   └── letters
    │       └── letter1.txt
    ├── music
    │   ├── rock
    │   │   └── song1.mp3
    │   └── jazz
    │       └── song2.mp3
    ├── pictures
    │   ├── vacation
    │   │   └── beach.jpg
    │   └── family
    │       └── portrait.jpg
    └── projects
        ├── project1
        │   └── todo.txt
        └── project2
            └── notes.txt
```

---

## Wichtige Linux-Befehle für Navigation

- `pwd` – zeigt den aktuellen Pfad (*print working directory*)
- `ls` – zeigt den Inhalt des aktuellen Verzeichnisses
- `cd <pfad>` – wechselt in ein anderes Verzeichnis
- `cd ..` – eine Ebene zurück
- `cd ~` – direkt ins Home-Verzeichnis
- `cd` ohne Parameter – ebenfalls ins Home-Verzeichnis

---

## Übungsaufgaben (mit Lösungen)

1. **Unterschied zwischen relativem und absolutem Pfad**  
   - Absolut: beginnt mit `/`  
   - Relativ: abhängig vom aktuellen Verzeichnis  

2. **Absoluter Pfad zu `report1.txt`**  
   → `/home/admini/documents/reports/report1.txt`

3. **Relativer Pfad von `documents/reports` nach `music/jazz/song2.mp3`**  
   → `../../music/jazz/song2.mp3`

4. **Befehl von `projects/project1` zu `music/rock` (relativ)**  
   → `cd ../../music/rock`

5. **Von `pictures/family` zu `documents/letters` (relativ)**  
   → `cd ../../documents/letters`

6. **Absoluter Pfad zu `beach.jpg`**  
   → `/home/admini/pictures/vacation/beach.jpg`

7. **Von `projects/project2` zu `documents/reports` (relativ)**  
   → `cd ../../documents/reports`

8. **Von `music/rock` zu `projects/project1` (relativ)**  
   → `cd ../../projects/project1`

9. **Relativer Pfad von `documents` zu `pictures/vacation`**  
   → `../pictures/vacation`

10. **Absoluter Pfad zu `todo.txt`**  
    → `/home/admini/projects/project1/todo.txt`

11. **Schnellster Befehl ins Home-Verzeichnis**  
    → `cd` oder `cd ~`

---

## Merksätze

- `.` steht für das aktuelle Verzeichnis  
- `..` bedeutet eine Ebene nach oben  
- Absolute Pfade sind eindeutig  
- Relative Pfade sind flexibel  
- `~` steht für das Home-Verzeichnis

