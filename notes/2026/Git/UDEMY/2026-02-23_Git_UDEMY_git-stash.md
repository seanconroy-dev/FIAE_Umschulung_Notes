---
title: "Git Stash"
date: 2026-02-23
weekday: "Montag"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Working Directory Management"
topic: "git stash, apply, pop, drop, clear"
level: "Grundlagen"
tags:
  - git
  - stash
  - workflow
  - branches
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Montag, 2026-02-23_Git_UDEMY

## 1) Was ist `git stash`?

`git stash` speichert **nicht-committete Änderungen** temporär.

Das bedeutet:

- Änderungen bleiben erhalten
- Es wird **kein Commit** erstellt
- Arbeitsverzeichnis wird auf den letzten Commit zurückgesetzt

Man kann es sich wie einen **Zwischenspeicher** vorstellen.

---

## 2) Typisches Szenario

Du arbeitest an einer neuen Funktion:

```
working on a nice feature
```

Plötzlich musst du:

- Zur letzten sauberen Version zurück
- Einen Hotfix machen
- Branch wechseln

Du willst:
- Änderungen NICHT committen
- Änderungen NICHT verlieren

Lösung:

```
git stash
```

Ergebnis:
- Änderungen verschwinden aus dem Working Directory
- Du bist wieder beim letzten Commit

---

## 3) Änderungen wiederherstellen

```
git stash apply
```

→ Holt den **letzten** Stash zurück  
→ Bleibt im Stash gespeichert

---

## 4) Mehrere Stashes

Jeder `git stash` erzeugt einen neuen Eintrag.

Liste anzeigen:

```
git stash list
```

Beispiel:

```
stash@{0}
stash@{1}
stash@{2}
```

Wichtig:

- `stash@{0}` = neuester Stash
- Indizes verschieben sich nach Löschung

---

## 5) Bestimmten Stash anwenden

```
git stash apply stash@{1}
```

Oder:

```
git stash apply 1
```

---

## 6) Stash mit Nachricht speichern

Empfohlen für Übersichtlichkeit:

```
git stash push -m "third feature added"
```

Jetzt zeigt `git stash list`:

```
stash@{0}: On master: third feature added
```

---

## 7) Unterschied: apply vs pop

### apply

```
git stash apply
```

- Holt Änderungen zurück
- Bleibt im Stash gespeichert

### pop

```
git stash pop
```

- Holt Änderungen zurück
- Entfernt sie aus dem Stash

Merksatz:

> apply = kopieren  
> pop = verschieben  

---

## 8) Einzelnen Stash löschen

```
git stash drop stash@{0}
```

---

## 9) Alle Stashes löschen

```
git stash clear
```

---

## 10) Wichtige Punkte

- Stash speichert **unstaged & staged Änderungen**
- Kein Commit wird erzeugt
- Ideal für schnellen Kontextwechsel
- Wird intern als spezieller Commit gespeichert

---

## 11) Typischer Workflow

```bash
# Änderungen zwischenspeichern
git stash

# Hotfix machen
git checkout other-branch
# fix committen

# Zurück
git checkout master
git stash pop
```

---

## 12) Prüfungsrelevante Fragen

- Unterschied apply vs pop?
- Was speichert git stash?
- Wie liste ich Stashes auf?
- Wie lösche ich einzelne Stashes?
- Wie speichere ich mit Nachricht?

---

## Merksatz

git stash =
> „Parkplatz für unfertige Arbeit“

Schnell, sauber, ohne Commit.

---
