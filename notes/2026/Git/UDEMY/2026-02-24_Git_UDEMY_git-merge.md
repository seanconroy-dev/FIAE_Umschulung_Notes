---
title: "git merge"
date: 2026-02-24
weekday: "Dienstag"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Branching & Integration"
topic: "Fast-Forward, Recursive Merge, Squash"
level: "Vertiefung"
tags:
  - git
  - merge
  - fast-forward
  - recursive
  - squash
  - branch
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Dienstag, 2026-02-24_Git_UDEMY

## 1) Grundidee von `git merge`

Mit `git merge` werden zwei Branches kombiniert.

Wichtig:
- Ein Merge passiert immer **aus Sicht des aktuellen Branches**
- Der Ziel-Branch muss ausgecheckt sein

Beispiel:

```
git switch master
git merge feature
```

→ feature wird in master integriert

---

## 2) Merge-Typen in Git

Es gibt mehrere Merge-Strategien, aber prüfungsrelevant sind:

1. **Fast-Forward Merge**
2. **Non-Fast-Forward (Recursive) Merge**

---

# 3) Fast-Forward Merge (Standardfall)

## Voraussetzung

Der Master-Branch hat **keine neuen Commits**, seit der Feature-Branch erstellt wurde.

### Ausgangssituation

```
master:   A---B
               \
feature:        C---D
```

Master wurde seit Branch-Erstellung nicht verändert.

---

## Ablauf

```
git switch master
git merge feature
```

Git erkennt:
→ Keine parallele Entwicklung  
→ HEAD kann einfach „nach vorne geschoben“ werden

---

## Ergebnis

```
A---B---C---D
```

✔ Kein Merge-Commit  
✔ Nur Pointer wird verschoben  
✔ Saubere lineare Historie  

Git zeigt:

```
Fast-forward
```

---

## Merksatz

Fast-Forward =  
> Kein neuer Commit – nur Zeigerbewegung

---

# 4) Squash Merge

Manchmal möchte man:

- Nicht alle Feature-Commits übernehmen
- Sondern nur einen zusammengefassten Commit

---

## Befehl

```
git merge --squash feature
git commit -m "Feature integriert"
```

---

## Ergebnis

Statt:

```
A---B---C---D
```

Erhält man:

```
A---B---X
```

X enthält:
- Alle Änderungen aus C und D
- Aber als EIN Commit

Wichtig:
- Kein automatischer Commit
- Man muss selbst committen

---

## Vorteil

- Aufgeräumte Historie
- Feature erscheint als ein logischer Block

---

# 5) Recursive Merge (Non Fast-Forward)

## Voraussetzung

Beide Branches haben neue Commits seit der Trennung.

### Ausgangssituation

```
master:   A---B---E
               \
feature:        C---D
```

Hier existiert parallele Entwicklung.

---

## Ablauf

```
git switch master
git merge feature
```

Git kann nicht einfach vorwärts springen.

---

## Ergebnis

```
A---B---E
       \     \
        C---D---M
```

M = Merge-Commit

---

## Eigenschaften

✔ Merge-Commit wird automatisch erstellt  
✔ Historie zeigt Verzweigung  
✔ Beide Entwicklungsstränge bleiben sichtbar  

Git-Ausgabe:

```
Merge made by the 'recursive' strategy.
```

---

## Merksatz

Recursive Merge =  
> Zwei Entwicklungszweige werden sichtbar zusammengeführt

---

# 6) --no-ff Option

Selbst wenn Fast-Forward möglich wäre, kann man erzwingen:

```
git merge --no-ff feature
```

Ergebnis:
- Merge-Commit wird erzeugt
- Feature bleibt als eigener Block sichtbar

Wird oft in Teams genutzt.

---

# 7) Vergleich

| Merkmal | Fast-Forward | Recursive |
|----------|--------------|-----------|
| Neuer Commit | Nein | Ja |
| Historie linear | Ja | Nein |
| Zeigt Branch-Struktur | Nein | Ja |
| Standardfall bei Parallelentwicklung | Nein | Ja |

---

# 8) Wann nutzt man was?

Fast-Forward:
- Kleine Features
- Lokale Arbeit
- Saubere Historie gewünscht

Recursive:
- Teamarbeit
- Branch soll sichtbar bleiben
- Parallele Entwicklung

Squash:
- Viele kleine Commits
- Feature soll als ein Block erscheinen
- Code-Review sauber halten

---

# 9) Prüfungsrelevante Punkte

- Unterschied Fast-Forward vs Recursive
- Was ist ein Merge-Commit?
- Wann entsteht automatisch ein Merge-Commit?
- Was bewirkt `--squash`?
- Was bewirkt `--no-ff`?

---

## 10) Kernprinzip

Ein Merge bedeutet nicht:
> Dateien zusammenkopieren

Sondern:
> Commit-Historien zusammenführen

Branches sind nur Zeiger auf Commits.

---
