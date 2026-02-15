---
title: "Linux – Dateirechte"
date: 2025-09-24
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Dateirechte und chmod"
level: "Grundlagen"
tags:
  - Linux
  - Dateirechte
  - chmod
  - chown
  - Benutzerverwaltung
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-09-24_BS_WED

## Dateirechte (Linux)

Dateien und Ordner haben **Rechte** für drei Kategorien:

- **Besitzer (user)** – der User, dem die Datei gehört  
- **Gruppe (group)** – die Benutzergruppe, der die Datei gehört  
- **Andere (others)** – alle anderen

Es gibt drei Grundrechte:

- **r (read)** – lesen  
- **w (write)** – schreiben  
- **x (execute)** – ausführen  

---

### Beispiel: `drwxr-xr--`

- **d** = Directory (Ordner)  
- **rwx** = Besitzer hat lesen, schreiben, ausführen  
- **r-x** = Gruppe hat lesen, ausführen  
- **r--** = Andere dürfen nur lesen  

---

### Häufige Kombinationen

| Anforderung | Rechte (Symbolisch) | Oktal |
|-------------|----------------------|-------|
| Nur Besitzer lesen & schreiben | `rw-------` | 600 |
| Besitzer volle Rechte, Gruppe r-x | `rwxr-x---` | 750 |
| Besitzer rw, Gruppe & Andere r | `rw-r--r--` | 644 |
| Besitzer & Gruppe rw | `rw-rw----` | 660 |
| Besitzer rw, Gruppe r, Andere keine | `rw-r-----` | 640 |
| Besitzer volle Rechte, Gruppe r-x, Andere r | `rwxr-xr--` | 754 |
| Besitzer rw, Gruppe keine, Andere r | `rw----r--` | 604 |
| Besitzer volle Rechte, Gruppe rw | `rwxrw----` | 760 |
| Besitzer rw, Gruppe r-x | `rw-r-x---` | 650 |
| Besitzer volle Rechte, Andere r | `rwx---r--` | 704 |
| Besitzer rw, Gruppe w | `rw--w----` | 620 |
| Besitzer volle Rechte, Gruppe x | `rwx--x---` | 710 |
| Besitzer rw, Gruppe r-x, Andere x | `rw-r-x--x` | 651 |
| Besitzer volle Rechte, Gruppe rw, Andere x | `rwxrw---x` | 761 |
| Besitzer rw, Gruppe w, Andere x | `rw--w---x` | 621 |

---

## Wichtige Befehle

### Ordnerstruktur für User erstellen
```bash
mkdir /home/username
```

### User löschen (inkl. Home-Verzeichnis)
```bash
sudo userdel -r alfred
```

### Rechte anzeigen
```bash
ls -l
```

### Rechte ändern mit `chmod`

```bash
chmod 777 datei   # alle dürfen alles
chmod 444 datei   # alle dürfen nur lesen
chmod 666 datei   # lesen & schreiben, kein Ausführen
```

### Oktalwerte verstehen

- r = 4  
- w = 2  
- x = 1  

Beispiele:
- 7 = rwx (4+2+1)  
- 6 = rw- (4+2)  
- 5 = r-x (4+1)  
- 4 = r--  

### Besitzer ändern mit `chown`

```bash
sudo chown user:group datei
```

