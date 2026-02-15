---
title: "Linux – Benutzerverwaltung & Dateirechte (kompakt)"
date: 2025-09-17
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Benutzerverwaltung & Rechte"
level: "Vertiefung"
tags:
  - Linux
  - Benutzerverwaltung
  - Gruppenverwaltung
  - chmod
  - chown
  - ACL
  - sudo
  - Dateirechte
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-09-17_BS_WED

# Benutzerverwaltung in Linux – kompakte Lern- und Prüfungsnotizen

---

## 1. Rechtekette `drwxr-xr-x`

### Aufbau

- Position 1 = Dateityp  
  - `-` normale Datei  
  - `d` Verzeichnis  
  - `l` Symlink  
  - `c` Character Device  
  - `b` Block Device  
  - `p` FIFO  
  - `s` Socket  

- Position 2–10 = Berechtigungen in Dreiergruppen  
  - **User** (Besitzer)  
  - **Group** (Gruppe)  
  - **Other** (alle anderen)  

Reihenfolge pro Gruppe:  
`r` (lesen), `w` (schreiben), `x` (ausführen)

Beispiel `drwxr-xr-x`:

- `d` → Verzeichnis  
- `rwx` → Owner darf alles  
- `r-x` → Group darf lesen & betreten  
- `r-x` → Other darf lesen & betreten  

---

### Besonderheit bei Verzeichnissen

- `x` → Verzeichnis betreten  
- `r` → Inhalte auflisten  
- `w` → Einträge erstellen, löschen, umbenennen  

---

## Numerische und symbolische Schreibweise

Werte:

- `r = 4`
- `w = 2`
- `x = 1`

Beispiele:

```bash
chmod 755 datei
chmod 640 datei
chmod u+x,g-w,o=rx datei
chmod -R 755 verzeichnis
chmod --reference=vorlage datei
```

---

## umask

Basisrechte:

- Dateien → 666  
- Ordner → 777  

Beispiel:

```
umask 022
```

Ergebnis:

- Dateien → 644  
- Ordner → 755  

Gilt nur für neu erstellte Objekte.

---

## Spezialbits

### SUID (4000)

```bash
chmod u+s datei
```

Programm läuft mit Rechten des Datei-Owners.  
Beispiel: `/usr/bin/passwd`

---

### SGID (2000)

```bash
chmod g+s verzeichnis
```

- Auf Datei → Gruppenrechte übernehmen  
- Auf Verzeichnis → neue Dateien erben Gruppen-ID  

---

### Sticky Bit (1000)

```bash
chmod +t verzeichnis
```

Nur Besitzer oder root darf löschen.  
Beispiel: `/tmp`

---

## 2. Benutzerkonten

### Wichtige Dateien

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/login.defs`

---

### Benutzer anlegen

```bash
sudo adduser alice
sudo useradd -m -s /bin/bash alice
sudo passwd alice
sudo usermod -aG sudo,docker alice
```

Wichtig: `-aG` nicht vergessen.

---

### Benutzer ändern

```bash
sudo chsh -s /bin/zsh alice
sudo usermod -d /srv/home/alice -m alice
sudo usermod -L alice
sudo usermod -U alice
```

---

### Benutzer löschen

```bash
sudo userdel alice
sudo userdel -r alice
```

---

## 3. Gruppenverwaltung

```bash
sudo groupadd projektX
sudo groupdel projektX
sudo groupmod -n neu alt
sudo usermod -g projektX alice
sudo usermod -aG projektX,video alice
id alice
```

---

## 4. Privilegien

- `su alice`
- `su - alice`
- `sudo befehl`
- `sudo -u alice befehl`
- `visudo`

Logs:

- Debian → `/var/log/auth.log`
- RHEL → `/var/log/secure`

---

## 5. Dateioperationen

```bash
touch datei.txt
mkdir -p proj/src
rm -r ordner
rm -rf ordner
mv alt neu
cp -a quelle ziel/
chown user:gruppe pfad
chmod 2775 ordner
```

---

## 6. ACLs

```bash
getfacl pfad
setfacl -m u:alice:rw pfad
setfacl -d -m g:projektX:rwx ordner
setfacl -b pfad
```

---

## 7. Praxisrezepte

Dienstkonto ohne Login:

```bash
sudo useradd -M -s /usr/sbin/nologin dienst
```

Teamordner:

```bash
sudo mkdir -p /srv/team/projekt
sudo chgrp -R projektX /srv/team/projekt
sudo chmod -R 2775 /srv/team/projekt
```

---

## 8. Häufige Fehler

- `usermod -G` ohne `-a`
- falscher Pfad bei `rm -rf`
- Verzeichnisrechte falsch interpretiert
- SGID auf Datei ≠ SGID auf Verzeichnis

---

## 9. Mini-Spickzettel

```bash
ls -l
chmod 640 datei
chown user:gruppe pfad
usermod -aG gruppe user
su - user
visudo
```

---

## 10. Prüfungsbezug AP1

- Rechtekette interpretieren
- `umask` berechnen
- Unterschied `su`, `su -`, `sudo`
- Benutzer & Gruppen korrekt verwalten
- SGID & Sticky erklären
- ACLs sinnvoll einsetzen
