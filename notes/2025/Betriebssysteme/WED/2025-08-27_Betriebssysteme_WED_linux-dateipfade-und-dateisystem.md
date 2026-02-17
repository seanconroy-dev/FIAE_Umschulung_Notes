---
title: "Linux – Dateipfade und Dateisystem"
date: 2025-08-27
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Dateipfade und FHS"
level: "Grundlagen"
tags:
  - Linux
  - Dateisystem
  - Pfade
  - FHS
  - CLI
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-08-27_BS_WED

### Linux – Dateipfade und Dateisystem

---

## 1) Absolute und relative Pfade

### Absolute Pfade
- Beginnen immer mit `/` (Root-Verzeichnis).
- Unabhängig vom aktuellen Arbeitsverzeichnis.
- Beispiel:

    /home/sean/Dokumente/projekt/datei.txt

- Vorteile: eindeutig, skript-freundlich  
- Nachteile: länger zu tippen  

### Relative Pfade
- Beziehen sich auf das aktuelle Arbeitsverzeichnis.
- Beginnen nicht mit `/`.
- Nützliche Platzhalter:
  - `.`  aktuelles Verzeichnis  
  - `..` übergeordnetes Verzeichnis  
  - `~`  Home-Verzeichnis des aktuellen Users (z. B. `/home/sean`)  

- Beispiele:

    ./projekt/datei.txt  
    ../bilder/foto.jpg  
    ~/Downloads/archiv.zip  

---

## 2) Vergleich

| Merkmal       | Absoluter Pfad                     | Relativer Pfad                         |
|---------------|------------------------------------|----------------------------------------|
| Beginn        | `/`                                | ohne `/`, relativ zu `pwd`             |
| Abhängigkeit  | unabhängig von `pwd`               | abhängig von `pwd`                     |
| Typischer Use | Skripte, Cronjobs, Services        | interaktiv, kurze Wege im Projektbaum  |
| Risiko        | gering                             | fehleranfällig bei wechselndem `pwd`   |

---

## 3) File System Hierarchy Standard (FHS)

```
/
├─ bin    -> essentielle Benutzerbefehle (ls, cp, mv)
├─ boot   -> Bootloader, Kernel
├─ dev    -> Geräte-Dateien (z. B. /dev/sda)
├─ etc    -> Systemweite Konfigurationen
├─ home   -> Home-Verzeichnisse der User (/home/<name>)
├─ lib    -> Systembibliotheken
├─ media  -> Automount-Punkte (USB, CD)
├─ mnt    -> Manuelle Mount-Punkte
├─ opt    -> Optionale Zusatzsoftware
├─ proc   -> Kernel-/Prozessinfos (virtuelles FS)
├─ root   -> Home des root-Users
├─ run    -> Laufzeitdaten (volatile)
├─ sbin   -> Systembefehle für Admins
├─ srv    -> Daten von Diensten (Web, FTP)
├─ sys    -> Sysfs (Geräte-/Kernelinfos)
├─ tmp    -> Temporäre Dateien
├─ usr    -> Benutzerprogramme, Dokumentation
└─ var    -> Variable Daten (Logs, Caches, Spools)
```

---

## 4) Praktische Übungen (Command Line)

1. Ordner erstellen
    
    ```bash
    mkdir -p projekt/berichte
    ```

2. Datei anlegen
    
    ```bash
    touch projekt/berichte/info.txt
    ```

3. Geschwister-Ordner
    
    ```bash
    mkdir projekt/bilder
    ```

4. Mehrere Ordner in einem Befehl anlegen
    
    ```bash
    mkdir -p Projekt/{ChildFolder,SiblingFolder}
    ```

5. Datei verschieben
    
    ```bash
    mv projekt/berichte/info.txt projekt/bilder/
    ```

6. Datei umbenennen
    
    ```bash
    mv projekt/bilder/info.txt projekt/bilder/foto.txt
    ```

7. Datei löschen
    
    ```bash
    rm projekt/bilder/foto.txt
    ```

8. Ordner löschen
    
    ```bash
    rm -r projekt/bilder
    ```

