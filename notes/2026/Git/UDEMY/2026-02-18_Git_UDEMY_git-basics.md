---
title: "Git Basics – Working Directory, Repository, Commits & Branches"
date: 2026-02-18
weekday: "Mittwoch"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Grundlagen"
topic: "Working Directory, Staging Area, Commits, Branches, Reset & Restore"
level: "Grundlagen"
tags:
  - Git
  - Versionierung
  - Commit
  - Branch
  - Reset
  - Restore
  - Merge
  - Detached HEAD
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2026-02-18_Git_UDEMY

## 1) Grundidee von Git

Git ist ein **Versionsverwaltungssystem**.  
Es speichert **nicht Dateien mehrfach**, sondern **Änderungen zwischen Versionen**.

Merksatz:  
> Git speichert Snapshots und verfolgt Änderungen – keine Datei-Duplikate.

---

## 2) Zentrale Begriffe

### Working Directory (Arbeitsverzeichnis)
Dein Projektordner mit allen Dateien (z. B. index.html, style.css etc.).

### Repository (.git-Ordner)
Versteckter Ordner, der automatisch durch `git init` erstellt wird.  
Hier passiert die gesamte Versionsverwaltung.

Das Repository enthält u. a.:

- **Staging Area (Index)**
- **Commits (Snapshots)**
- Branch-Informationen

---

## 3) Git-Projekt initialisieren

```bash
git init
```

Erstellt den versteckten `.git`-Ordner → Projekt wird Git-Repository.

Status prüfen:
```bash
git status
```

---

## 4) Dateien tracken & Commit erstellen

### Datei zur Staging Area hinzufügen

Einzelne Datei:
```bash
git add datei.txt
```

Alle Dateien:
```bash
git add .
```

### Commit erstellen

```bash
git commit -m "Beschreibung der Änderung"
```

Commit = Snapshot des aktuellen Zustands.

---

## 5) Commit-Historie anzeigen

```bash
git log
```

Zeigt:
- Commit-ID (Hash)
- Autor
- Datum
- Commit-Message

Jeder Commit hat eine **eindeutige ID**.

---

## 6) Branches

Standardbranch:  
→ `master` (oder `main`, je nach Konfiguration)

Branch anzeigen:
```bash
git branch
```

### Neuen Branch erstellen

```bash
git branch neuer-branch
```

Oder direkt erstellen + wechseln:
```bash
git checkout -b neuer-branch
```

Ab Git 2.23:
```bash
git switch -c neuer-branch
```

### Zwischen Branches wechseln

```bash
git checkout branchname
```

oder moderner:
```bash
git switch branchname
```

---

## 7) Merge (Branches zusammenführen)

Wenn ein Feature-Branch fertig ist:

```bash
git merge branchname
```

Wichtig:
Du musst im Zielbranch stehen (z. B. master).

---

## 8) HEAD & Detached HEAD

### HEAD
Zeigt immer auf den **aktuellen Commit** eines Branches.

### Detached HEAD
Passiert, wenn du direkt einen Commit auscheckst:

```bash
git checkout commit-id
```

Du arbeitest dann **nicht mehr auf einem Branch**.

Lösung:
Neuen Branch erstellen:
```bash
git branch neuer-branch commit-id
```

Dann normal weiterarbeiten.

---

## 9) Änderungen rückgängig machen

### Unstaged Änderungen verwerfen (tracked files)

Klassisch:
```bash
git checkout -- datei.txt
```

Modern:
```bash
git restore datei.txt
```

---

### Untracked Dateien löschen

Testlauf:
```bash
git clean -dn
```

Löschen:
```bash
git clean -df
```

---

### Staged Änderungen zurücknehmen

Klassisch:
```bash
git reset datei.txt
```

Modern:
```bash
git restore --staged datei.txt
```

---

## 10) Commits rückgängig machen

### Soft Reset (Commit löschen, Änderungen behalten)

```bash
git reset --soft HEAD~1
```

### Standard Reset (Commit löschen, Änderungen unstaged)

```bash
git reset HEAD~1
```

### Hard Reset (alles löschen!)

```bash
git reset --hard HEAD~1
```

Achtung:  
Hard Reset entfernt Commit + Staging + Working Directory Änderungen.

---

## 11) Branch löschen

```bash
git branch -D branchname
```

---

## 12) .gitignore

Datei im Root-Verzeichnis:
```
.gitignore
```

Beispiele:

Alle Log-Dateien ignorieren:
```
*.log
```

Ordner ignorieren:
```
webapp/
```

Bestimmte Datei trotzdem erlauben:
```
!important.log
```

---

# Zusammenfassung

Wichtige Kernkonzepte:

- Working Directory
- Repository (.git)
- Staging Area
- Commit (Snapshot)
- Branch
- HEAD
- Merge
- Reset / Restore
- .gitignore

Git basiert auf:
> Änderungen tracken → Committen → Versionen verwalten → Branches für Features nutzen.

Diese Grundlagen sind essenziell für:
- Teamarbeit
- GitHub
- CI/CD
- Professionelle Softwareentwicklung

---

