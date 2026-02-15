---
title: "Linux – SSH, IP-Bridges und Paketverwaltung"
date: 2025-10-29
weekday: "Mittwoch"
subject: "BS"
instructor: "WED"
program: "FIAE Umschulung 2025-2027"
module: "Netzwerk & Systemverwaltung"
topic: "SSH und APT"
level: "Grundlagen"
tags:
  - Linux
  - SSH
  - APT
  - Paketverwaltung
  - Netzwerk
  - Ubuntu
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-10-29_BS_WED  
**Thema:** Linux – SSH, IP-Bridges und Paketverwaltung  

In dieser Unterrichtseinheit wurde die Kommunikation zwischen virtuellen Maschinen und Hostsystemen per **SSH (Secure Shell)** eingerichtet und grundlegende Konzepte der **Linux-Paketverwaltung mit APT** behandelt. Ziel war es, Remote-Verbindungen sicher aufzubauen und die Installation sowie Verwaltung von Softwarepaketen praktisch nachzuvollziehen.  

Kommunikation zwischen Computern über **Windows CMD** und **virtuelle Maschinen**. Fehlender Bestandteil zu Beginn: **SSH-Server** auf der virtuellen Maschine.  

---

## Zeitsynchronisation als Fehlerquelle

Im Unterricht war die **Zeitsynchronisation (Time Sync)** auf der virtuellen Maschine deaktiviert. Dadurch funktionierten folgende Befehle zunächst nicht korrekt:

```bash
sudo apt update
sudo apt upgrade
sudo apt install openssh-server
```

Nach manueller Aktivierung der Zeitsynchronisation funktionierten alle Prozesse ordnungsgemäß:

```bash
sudo timedatectl set-ntp true
timedatectl status
```

Eine korrekte Systemzeit ist sicherheitsrelevant (z. B. für Zertifikatsprüfung und Signaturvalidierung von Paketquellen).

---

## SSH – Secure Shell

SSH ist ein sicheres Netzwerkprotokoll für verschlüsselte Kommunikation zwischen Client und Server.

Typische Einsatzgebiete:
- Remote-Zugriff auf Server
- Dateiübertragung
- Systemadministration
- Automatisierung

Installation des SSH-Servers unter Ubuntu/Debian:

```bash
sudo apt install openssh-server
```

---

## Paketverwaltung unter Linux (APT)

Unter Debian- und Ubuntu-Systemen wird Software über **APT (Advanced Package Tool)** verwaltet.

### Grundbegriffe

- **deb-Pakete** → Standardpaketformat für Debian-basierte Systeme  
- **Repository** → Online-Softwarequelle  
- **Quellenliste** → definiert in `/etc/apt/sources.list`  
- **URI** → Adresse des Repository-Servers  

Beispiel einer Repository-Zeile:

```
deb http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
```

---

## Aufbau einer Repository-Zeile

- `deb` → Binärpakete (kompilierte Programme)  
- `http://archive.ubuntu.com/ubuntu/` → Serveradresse  
- `jammy` → Codename der Ubuntu-Version (*Jammy Jellyfish*)  
- `main restricted universe multiverse` → Softwarebereiche  

---

## Bereiche (Komponenten) erklärt

- **main** → Offiziell unterstützte, freie Software  
- **restricted** → Proprietäre, lizenzierte Software (z. B. Treiber)  
- **universe** → Community-gepflegte freie Software  
- **multiverse** → Software mit rechtlichen oder lizenzrechtlichen Einschränkungen  

Beispiel Codename:
- **noble** → Ubuntu 24.04 LTS (*Noble Numbat*)

---

## Wichtige APT-Befehle

```bash
sudo apt update              # Paketlisten aktualisieren
sudo apt upgrade             # installierte Pakete aktualisieren
sudo apt install <paket>     # Paket installieren
sudo apt remove <paket>      # Paket entfernen
sudo apt autoremove          # nicht mehr benötigte Pakete löschen
sudo apt search <begriff>    # Paket suchen
sudo apt show <paket>        # Paketdetails anzeigen
```

---

## Zusammenfassung

- SSH ermöglicht sicheren, verschlüsselten Remote-Zugriff.  
- Zur Nutzung muss der SSH-Server installiert und gestartet sein.  
- APT verwaltet Software zentral über strukturierte Repositories.  
- Repositories sind in Bereiche nach Lizenz- und Supportstatus unterteilt.  
- Korrekte Zeitsynchronisation ist Voraussetzung für sichere Paketvalidierung.  
- Kenntnisse zu SSH und APT sind prüfungsrelevant (AP1/AP2) und Grundlage für spätere Themen wie Serveradministration und Netzwerkautomatisierung.
