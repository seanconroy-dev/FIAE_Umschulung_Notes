---
title: "Combining Branches"
date: 2026-02-24
weekday: "Dienstag"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Branching & Integration"
topic: "Merge vs Rebase"
level: "Grundlagen"
tags:
  - git
  - branch
  - merge
  - rebase
  - workflow
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Dienstag, 2026-02-24_Git_UDEMY

## 1) Grundidee: Master- und Feature-Branch

Der **Master-Branch** (heute oft `main`) ist der Hauptzweig eines Projekts.

Er enthält:
- den stabilen Stand
- meist den deploybaren Code
- die zentrale Projekt-Historie

Ein **Feature-Branch** wird erstellt, um:
- neue Funktionen zu entwickeln
- isoliert zu arbeiten
- Experimente durchzuführen
- Fehler zu beheben

Er basiert immer auf einem existierenden Branch (meist `master` oder `main`).

---

## 2) Typischer Workflow

### Ausgangssituation

```
master
  A---B---C
```

Feature-Branch erstellen:

```
git checkout -b feature
```

Ergebnis:

```
master   A---B---C
                 \
feature           C
```

Der Feature-Branch enthält alle bisherigen Commits.

---

## 3) Parallele Entwicklung

Nun entwickeln sich beide Branches weiter:

```
master   A---B---C---D---E
                 \
feature           F---G
```

Jetzt gibt es zwei Möglichkeiten:

1. Feature braucht aktuelle Änderungen aus master  
2. Feature ist fertig und soll in master integriert werden  

---

## 4) Branches kombinieren – Zwei Methoden

### Methode 1: Merge

```
git checkout master
git merge feature
```

Ergebnis:

```
A---B---C---D---E
         \       \
          F---G---M
```

- Es entsteht ein **Merge-Commit (M)**
- Historie bleibt vollständig erhalten
- Keine Umschreibung der Vergangenheit

Vorteil:
- Sicher
- Transparent
- Ideal für Teamarbeit

---

### Methode 2: Rebase

```
git checkout feature
git rebase master
```

Ergebnis:

```
A---B---C---D---E---F'---G'
```

- Feature-Commits werden "neu abgespielt"
- Keine Merge-Commits
- Lineare Historie

Vorteil:
- Saubere Commit-Historie
- Kein Merge-Commit

Nachteil:
- Umschreibt History
- Vorsicht bei geteilten Branches

---

## 5) Wann benutzt man was?

### Merge verwenden wenn:

- Teamarbeit
- Branch bereits geteilt
- Historie sichtbar bleiben soll
- Sicherheit wichtiger als saubere Linie

### Rebase verwenden wenn:

- Lokale Feature-Branches
- Noch nicht gepusht
- Saubere lineare Historie gewünscht

---

## 6) Wichtiges Prinzip

Ein Feature-Branch ist:

> Kein paralleles Universum  
> Sondern ein Zeiger auf einen Commit

Branches sind nur Referenzen auf Commit-Ketten.

---

## 7) Häufige Szenarien

### Feature mit aktuellem Master synchronisieren

Option A (Merge):

```
git checkout feature
git merge master
```

Option B (Rebase):

```
git checkout feature
git rebase master
```

---

### Feature in Master integrieren

```
git checkout master
git merge feature
```

Danach optional:

```
git branch -d feature
```

---

## 8) Prüfungsrelevante Fragen

- Unterschied Merge vs Rebase?
- Was ist ein Merge-Commit?
- Wann darf man Rebase nicht verwenden?
- Was passiert mit der Commit-Historie bei Rebase?
- Warum ist Merge in Teams oft sicherer?

---

## 9) Merksatz

Merge:
> Geschichte bleibt unverändert.

Rebase:
> Geschichte wird neu geschrieben.

---
