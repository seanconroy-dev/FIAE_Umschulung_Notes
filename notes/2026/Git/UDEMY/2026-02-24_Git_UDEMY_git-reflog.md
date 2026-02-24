---
title: "Git Reflog"
date: 2026-02-24
weekday: "Dienstag"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Recovery & History"
topic: "git reflog, reset, branch recovery"
level: "Grundlagen"
tags:
  - git
  - reflog
  - recovery
  - reset
  - branch
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Dienstag, 2026-02-24_Git_UDEMY

## 1) Was ist `git reflog`?

`git reflog` zeigt eine Historie aller Referenz-Änderungen (HEAD-Bewegungen) im Repository.

Während `git log` nur erreichbare Commits zeigt,  
speichert der **Reflog jede Änderung an HEAD** – auch:

- Resets
- Branch-Wechsel
- Gelöschte Commits
- Gelöschte Branches

Wichtig:  
Reflog speichert diese Informationen **standardmäßig ca. 30 Tage**.

---

## 2) Commit nach `git reset --hard` wiederherstellen

### Ausgangssituation

Neuer Commit:

```
file2 added
```

Dann:

```
git reset --hard HEAD~1
```

Ergebnis:
- Commit verschwindet aus `git log`
- Datei ist gelöscht

---

### Lösung mit Reflog

```
git reflog
```

Beispielausgabe:

```
abc1234 HEAD@{1}: commit: file2 added
```

Wichtig ist der **Commit-Hash** (z. B. `abc1234`).

---

### Wiederherstellung

```
git reset --hard abc1234
```

Ergebnis:
- HEAD zeigt wieder auf diesen Commit
- Datei ist zurück
- Commit erscheint wieder im Log

---

## 3) Gelöschten Branch wiederherstellen

### Szenario

1. Feature-Branch erstellen:

```
git checkout -b feature
```

2. Commit erstellen:

```
file3 added
```

3. Zurück zu master wechseln:

```
git checkout master
```

4. Branch löschen:

```
git branch -D feature
```

Branch ist weg.

---

### Reflog nutzen

```
git reflog
```

Suche den Commit-Hash von:

```
commit: file3 added
```

---

### Branch wiederherstellen

1. Commit auschecken:

```
git checkout <hash>
```

→ Detached HEAD

2. Branch neu erstellen:

```
git switch -c feature
```

Jetzt:
- Branch existiert wieder
- Commit ist Head des Feature-Branches

---

## 4) Unterschied: log vs reflog

| Befehl        | Zeigt was? |
|---------------|------------|
| `git log`     | Erreichbare Commits |
| `git reflog`  | Alle HEAD-Bewegungen |

Reflog ist ein **Sicherheitsnetz**.

---

## 5) Wichtige Punkte

- Reflog ist lokal (nicht im Remote)
- Speichert nur temporär (~30 Tage)
- Ideal bei:
  - versehentlichem `reset --hard`
  - Branch-Löschung
  - falschem Rebase

---

## 6) Typische Rettungsschritte

### Verlorenen Commit zurückholen

```bash
git reflog
git reset --hard <hash>
```

### Gelöschten Branch zurückholen

```bash
git reflog
git checkout <hash>
git switch -c branchname
```

---

## 7) Merksatz

`git reflog` =  
> Zeitmaschine für dein lokales Repository

Solange der Commit im Reflog existiert,  
ist er meist noch rettbar.

---

## Prüfungsrelevante Fragen

- Was speichert `git reflog`?
- Unterschied zwischen `git log` und `git reflog`?
- Wie stelle ich einen gelöschten Commit wieder her?
- Wie stelle ich einen gelöschten Branch wieder her?
- Warum funktioniert Reflog nur lokal?

---
