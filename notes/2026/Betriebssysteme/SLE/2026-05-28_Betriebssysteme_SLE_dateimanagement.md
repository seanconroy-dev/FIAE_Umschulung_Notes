---
title: 'Dateimanagement'
date: 2026-05-28
weekday: 'Donnerstag'
subject: 'Betriebssysteme'
instructor: 'SLE'
program: 'FIAE Umschulung 2025-2027'
module: ''
topic: ''
level: ''
tags:
  -
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Datei - Management unter Betriebssystemen

## Lernziel (AP1/AP2 FIAE)

Du solltest nach dieser Einheit sicher beantworten koennen:

- Wie sind Datentraeger und Dateisysteme aufgebaut?
- Warum ist unter Windows meist NTFS Standard?
- Was ist der Unterschied zwischen Freigabeberechtigung und NTFS-Berechtigung?
- Wie funktioniert Dateiverwaltung im Alltag (Explorer, CMD, PowerShell)?
- Welche typischen Pruefungsfallen gibt es bei Partitionierung, Dateisystemwahl und Rechten?

---

## 1. Grundlagen Dateimanagement

Damit ein Betriebssystem Dateien verwalten kann, braucht es:

- Dateiname und Erweiterung (z. B. `angebot.docx`)
- Inhalt (Datenbytes)
- Metadaten:
  - Erstellungsdatum
  - Aenderungsdatum
  - Dateigroesse
  - Besitzer
  - Attribute (z. B. schreibgeschuetzt, versteckt)
- Speicherort (Pfad/Verzeichnisstruktur)
- Zugriffsrechte
- Zuordnung im Dateisystem (wo liegt die Datei physisch/logisch)
- Backup-/Restore-Konzept

Merksatz:
> Eine Datei ist nicht nur Inhalt, sondern immer auch Name + Kontext + Rechte + Speicherzuordnung.

---

## 2. Datentraeger, Partitionen und Volumes

### 2.1 Begriffe

- **Datentraeger**: Physisches Medium (SSD/HDD)
- **Partition**: Bereich auf dem Datentraeger
- **Volume**: Im OS nutzbare Einheit mit Dateisystem
- **Laufwerksbuchstabe (Windows)**: z. B. `C:`, `D:`

### 2.2 Partitionsschema

| Schema | Kerndaten | Relevanz fuer Windows |
|---|---|---|
| **MBR** (Master Boot Record) | max. 4 primaere Partitionen, Datentraeger bis ca. 2 TB | Alt-Systeme/Legacy BIOS |
| **GPT** (GUID Partition Table) | sehr viele Partitionen (Windows i. d. R. bis 128), sehr grosse Datentraeger | Standard bei UEFI-Systemen |

Hinweis:
- **LVM** ist typisch Linux und kein Windows-Standard.
- **RAID** ist kein Partitionsschema, sondern Redundanz-/Performance-Konzept fuer mehrere Datentraeger.

### 2.3 Typische Partitionstypen

- Primaere Partition
- Erweiterte Partition (MBR-Kontext)
- Logische Partition (innerhalb erweiterter Partition)
- EFI-Systempartition (UEFI-Boot)
- Wiederherstellungspartition (Recovery)

---

## 3. Dateisysteme im Vergleich

| Dateisystem | Typische Nutzung | Vorteile | Nachteile |
|---|---|---|---|
| **FAT32** | USB-Sticks, hohe Kompatibilitaet | sehr kompatibel | max. 4 GB pro Datei, keine NTFS-Rechte |
| **exFAT** | USB/SD zwischen Windows/macOS | grosse Dateien, kompatibler als NTFS | keine NTFS-ACLs, weniger robust als journaling FS |
| **NTFS** | Windows-Standard auf Systemlaufwerken | Rechte (ACL), Journaling, Komprimierung, Quotas, EFS | auf Fremdsystemen teils eingeschraenkt |
| **ext4** | Linux | stabil, performant, journaling | unter Windows nicht nativ nutzbar |
| **APFS** | aktuelles macOS | snapshots, modern | unter Windows nicht nativ |

### Warum in Windows meist NTFS?

- Detaillierte Berechtigungen (ACL)
- Ausfallsicherheit durch Journaling
- Unterstuetzung grosser Dateien/Volumes
- Unternehmensfunktionen (Quotas, Verschluesselung, Auditing)

---

## 4. Standardablauf: Von Rohdatentraeger zur nutzbaren Datei

1. **Partitionieren** (Datentraeger strukturieren)
2. **Formatieren** (Dateisystem anlegen, z. B. NTFS)
  - Dateisystem wird festgelegt (z. B. NTFS, exFAT)
  - Dateitabelle wird neu erstellt : Master File Table (MFT) bei NTFS 
  - Clustergroesse wird festgelegt (z. B. 4 KB, beeinflusst Speicherplatznutzung)
3. **Einbinden/Mounten**
4. **Dateioperationen** (lesen, schreiben, aendern, loeschen)
5. **Sichern/Archivieren**

---

## 5. Windows-Fokus: Dateiverwaltung in der Praxis

### 5.1 Explorer-Funktionen (GUI)

- Kopieren/Verschieben (`Strg+C`, `Strg+X`, `Strg+V`)
- Umbenennen (`F2`)
- Eigenschaften einsehen (Groesse, Attribute, Sicherheit)
- Freigabe/Netzlaufwerk
- Papierkorb und Wiederherstellung

### 5.2 Wichtige CMD-Befehle

| Befehl | Funktion |
|---|---|
| `dir` | Verzeichnisinhalt anzeigen |
| `cd` | Verzeichnis wechseln |
| `md` / `mkdir` | Ordner erstellen |
| `copy` | Datei kopieren |
| `move` | Datei/Ordner verschieben |
| `del` | Datei loeschen |
| `rmdir /s` | Ordner rekursiv loeschen |

### 5.3 Wichtige PowerShell-Cmdlets

| Cmdlet | Funktion |
|---|---|
| `Get-ChildItem` | Inhalte auflisten |
| `New-Item` | Datei/Ordner erstellen |
| `Copy-Item` | kopieren |
| `Move-Item` | verschieben |
| `Remove-Item` | loeschen |
| `Get-Acl` / `Set-Acl` | Berechtigungen lesen/setzen |

---

## 6. Berechtigungen in Windows (pruefungsrelevant)

### 6.1 NTFS-Berechtigungen

Typische Stufen:

- Vollzugriff
- Aendern
- Lesen und Ausfuehren
- Lesen
- Schreiben

### 6.2 Vererbungsprinzip

- Unterordner/Dateien erben standardmaessig Rechte vom uebergeordneten Ordner.
- Vererbung kann gebrochen werden (Achtung in Pruefungsaufgaben).

### 6.3 Freigabeberechtigung vs. NTFS-Berechtigung

Merksatz fuer Netzwerkzugriff:
> Effektiv gilt die restriktivere Berechtigung aus Freigabe und NTFS.

Beispiel:

- Freigabe: `Aendern`
- NTFS: `Lesen`
- Ergebnis ueber Netzwerk: **Lesen**

---

## 7. Typische AP1/AP2-Pruefungsthemen zum Dateimanagement

- Geeignetes Dateisystem fuer Anwendungsfall auswaehlen (z. B. USB fuer Videos > 4 GB)
- MBR vs. GPT begruenden
- Rechtekonflikte aufloesen (Gruppen, Vererbung, Freigabe/NTFS)
- Backup-Strategien einordnen (voll, inkrementell, differentiell)
- Risiken bei Fehlbedienung benennen (falsche Berechtigungen, versehentliches Loeschen, kein Backup)

---

## 8. Kompakte Lernzusammenfassung

- Datei = Inhalt + Metadaten + Rechte + Speicherzuordnung
- GPT ist heute in Windows mit UEFI Standard
- NTFS ist Windows-Standard wegen ACL + Journaling + Features
- FAT32 hat 4-GB-Dateigroessenlimit
- Netzwerkzugriff: restriktivere Berechtigung gewinnt (Freigabe vs. NTFS)
- Vor Datenarbeiten immer: Backup + Berechtigung + Zielpfad pruefen

---

## 9. Uebungsfragen (AP1/AP2-Stil)

### Teil A: Single Choice

1. Welches Dateisystem unterstuetzt standardmaessig detaillierte Windows-ACLs?
  - A) FAT32
  - B) NTFS
  - C) exFAT
  - D) ext4

2. Welche Aussage zu MBR ist korrekt?
  - A) MBR ist fuer UEFI zwingend erforderlich.
  - B) MBR unterstuetzt unbegrenzt primaere Partitionen.
  - C) MBR hat deutliche Grenzen bei Datentraegergroesse und Partitionen.
  - D) MBR ist ein Dateisystem.

3. Ein Benutzer greift ueber Netzwerk auf eine Freigabe zu. Freigabe = Vollzugriff, NTFS = Lesen. Effektiv hat er:
  - A) Vollzugriff
  - B) Aendern
  - C) Lesen
  - D) Keinen Zugriff

### Teil B: Multiple Choice

4. Welche Aussagen zu NTFS sind richtig?
  - A) Unterstuetzt Journaling.
  - B) Unterstuetzt keine Dateirechte.
  - C) Kann Quotas verwalten.
  - D) Maximal 4 GB pro Datei.

5. Welche Schritte sind fuer einen neuen Datentraeger sinnvoll (technisch richtige Reihenfolge)?
  - A) Formatieren
  - B) Partitionieren
  - C) Datei schreiben
  - D) Einbinden/Mounten

### Teil C: Kurzfall (Rechnen/Begruenden)

6. Ein Team sichert taeglich 200 GB geaenderte Daten. Sonntags wird ein Vollbackup erstellt.

  Aufgaben:
  - a) Nenne je einen Vorteil von inkrementell und differentiell.
  - b) Welche Strategie minimiert i. d. R. den Speicherverbrauch unter der Woche?
  - c) Welche Strategie vereinfacht typischerweise die Wiederherstellung im Stoerfall?

---

## 10. Loesungsteil zur Selbstkontrolle

### Teil A

1. **B**
2. **C**
3. **C**

### Teil B

4. **A, C**
5. **B, A, D, C**

### Teil C (Muster)

6a)
- Inkrementell: wenig Daten pro Sicherungslauf, spart Zeit/Speicher.
- Differentiell: schnellere Wiederherstellung als rein inkrementell.

6b)
- Meist **inkrementell**.

6c)
- Meist **differentiell** (Vollbackup + letztes differentielles Backup).

---

## 11. Was du fuer den naechsten Unterricht mitnehmen kannst

- Uebe 10 Minuten CMD/PowerShell-Dateibefehle praktisch.
- Wiederhole Rechtefaelle mit Freigabe + NTFS.
- Praege dir typische Auswahlregeln fuer FAT32/exFAT/NTFS ein.

