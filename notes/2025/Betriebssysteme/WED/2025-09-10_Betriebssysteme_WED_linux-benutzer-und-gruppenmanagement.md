---
title: "Linux – Benutzer- und Gruppenmanagement"
date: 2025-09-10
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Linux Grundlagen"
topic: "Benutzer & Gruppen"
level: "Grundlagen"
tags:
  - Linux
  - Benutzerverwaltung
  - Gruppenverwaltung
  - sudo
  - useradd
  - usermod
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-09-10_BS_WED

## Thema: Benutzer- und Gruppenmanagement in Linux

---

## Grundidee

- **Benutzerverwaltung**: Jeder Benutzer besitzt eine **UID** (User ID).  
  Ein Benutzer kann Mitglied in einer oder mehreren Gruppen sein.

- **Gruppenverwaltung**: Gruppen dienen der gemeinsamen Rechtevergabe.  
  Anstatt Rechte jedem Nutzer einzeln zuzuweisen, werden Benutzer Gruppen zugeordnet.

- **Wichtige Systemdateien**:
  - `/etc/passwd` – Benutzerinformationen
  - `/etc/group` – Gruppeninformationen

- **Struktur von `/etc/passwd`** (durch `:` getrennt):

  ```
  username:x:uid:gid:info:home:shell
  ```

---

## Benutzer anlegen

### Mit Home-Verzeichnis

```bash
sudo useradd -m -s /bin/bash alice
sudo passwd alice
```

- `-m` → erstellt `/home/alice`
- `-s /bin/bash` → setzt Bash als Standard-Shell
- `passwd` → Passwort festlegen

---

### Ohne Home-Verzeichnis

```bash
sudo useradd bogdan
```

Kein `-m` → es wird kein Home-Verzeichnis erstellt.

---

### Benutzer wechseln

```bash
su alice
```

---

## Gruppen

### Gruppen des aktuellen Benutzers anzeigen

```bash
groups
```

### Gruppen eines bestimmten Benutzers anzeigen

```bash
groups alice
id alice
```

- **Primäre Gruppe**: Standardgruppe eines Benutzers (meist identisch mit dem Benutzernamen)
- **Sekundäre Gruppen**: zusätzliche Gruppen für Projekte oder Ressourcenzugriff

---

## Gruppen erstellen & verwalten

### Neue Gruppe anlegen

```bash
sudo groupadd matheprojekt
```

### Benutzer zu einer Gruppe hinzufügen

```bash
sudo usermod -aG matheprojekt alice
```

- `-a` (append) → fügt Mitgliedschaft hinzu
- `-G` (groups) → definiert Sekundärgruppen  
⚠️ Ohne `-a` werden bestehende Sekundärgruppen überschrieben.

---

## Superuser & sudo

### Temporär Root-Rechte erhalten

```bash
sudo su
```

### Benutzer zur sudo-Gruppe hinzufügen

```bash
sudo usermod -aG sudo alice
```

Ergebnis: Der Benutzer darf Befehle mit `sudo` ausführen.

---

## Benutzer löschen

### Benutzer inkl. Home-Verzeichnis entfernen

```bash
sudo userdel -r username
```

`-r` → entfernt Home-Verzeichnis und Mailspool

---

### Home-Verzeichnis manuell löschen

```bash
sudo rm -rf /home/username
sudo userdel username
```

---

## Weitere Optionen

### Home-Verzeichnis ändern

```bash
sudo usermod -d /neuer/pfad username
```

### Gruppenmitgliedschaften prüfen

```bash
groups alice
id alice
```

---

## Beispielaufgaben (Unterricht)

1. Gruppe `matheprojekt` anlegen  
2. Benutzer `alfred` (mit Home) erstellen  
3. Benutzer `bogdan` (ohne Home) erstellen  
4. Benutzer `charles` (mit Home) erstellen  
5. Passwörter setzen  
6. `alfred` und `charles` zur Gruppe `matheprojekt` hinzufügen  
7. Mit `groups` und `id` prüfen  

---

## Merksätze

- Immer `-aG` verwenden, wenn ein Benutzer zu einer Gruppe hinzugefügt wird  
- Root-Rechte sparsam einsetzen – Admin-Aufgaben über `sudo`  
- Gruppen vereinfachen die Rechteverwaltung  
- Änderungen stets mit `groups` oder `id` überprüfen
