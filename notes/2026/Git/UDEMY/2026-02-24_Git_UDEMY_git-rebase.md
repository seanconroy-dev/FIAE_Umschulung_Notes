---
title: "git rebase"
date: 2026-02-24
weekday: "Dienstag"
subject: "Git"
instructor: "UDEMY"
program: "FIAE Umschulung 2025-2027"
module: "Branching & Integration"
topic: "Rebase vs Merge, History-Rewrite, Workflow"
level: "Vertiefung"
tags:
  - git
  - rebase
  - merge
  - fast-forward
  - history
  - commit-hash
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
# Dienstag, 2026-02-24_Git_UDEMY

## 1) Was ist `git rebase`?

`git rebase` **setzt den Startpunkt (Base) deiner Branch-Historie neu**.

Statt zwei Entwicklungszweige per Merge zusammenzuführen (und evtl. einen Merge-Commit zu erzeugen),
nimmt Rebase deine Branch-Commits und **“klebt” sie auf einen anderen Commit oben drauf**.

Wichtigster Effekt:
- Historie wirkt oft **linear**
- Aber: Rebase **schreibt Historie um** (neue Commit-Hashes)

---

## 2) Typisches Szenario: Master entwickelt sich weiter

Ausgangslage:

```
master:   A---B---C
               \
feature:        F1---F2
```

- Feature wurde bei `B` abgespalten
- Master hat danach `C` bekommen
- Feature hat `F1`, `F2`

---

## 3) Was macht Rebase hier?

Wenn du im `feature` bist und das machst:

```
git switch feature
git rebase master
```

Dann passiert konzeptionell:

1. Git merkt sich die Feature-Commits (F1, F2)
2. Git setzt den Feature-Branch auf den aktuellen Stand von master (C)
3. Git “spielt” F1 und F2 **neu** oben drauf ab

Ergebnis:

```
master:   A---B---C
                 \
feature:           F1'---F2'
```

**F1' und F2' sind neue Commits** (neue IDs/Hashes), obwohl der Inhalt “gleich” sein kann.

---

## 4) Warum wird daraus oft ein Fast-Forward Merge?

Wenn `feature` jetzt bereits “oben drauf” sitzt, kannst du in master meist fast-forward mergen:

```
git switch master
git merge feature
```

Ergebnis (linear):

```
A---B---C---F1'---F2'
```

✔ Kein Merge-Commit  
✔ Historie sieht “gerade” aus  
✘ Feature-Commits haben neue Hashes

---

## 5) Merksätze (prüfungsrelevant)

### Merge
- kombiniert Historien
- kann Merge-Commit erzeugen
- schreibt Historie **nicht** um

### Rebase
- setzt Base um / “legt Commits um”
- erzeugt **neue Commit-Hashes**
- schreibt Historie **um**

---

## 6) Warum ist “History Rewrite” heikel?

Ein Commit wird eindeutig durch seinen Hash/ID identifiziert.

Wenn du rebased, entstehen neue Commits mit neuen Hashes.
In einem **geteilten Repo** (Team, GitHub) kann das Probleme machen:

- Andere haben ggf. noch die alten Commits lokal
- Pull/Merge wird chaotisch, weil Git alte vs. neue Historie auseinanderhalten muss
- Im schlimmsten Fall: doppelte Commits, Konflikte, Verwirrung

Faustregel:

> Rebase nur auf Commits, die noch niemand außer dir benutzt.

(Praktisch: “nicht auf public/shared branches rebased”, z. B. `main/master` in Teamprojekten.)

---

## 7) Wann ist Rebase sinnvoll?

### A) Feature braucht den neuesten Stand von master
Du arbeitest weiter am Feature, willst aber die aktuellen Änderungen aus master drin haben:

```
git switch feature
git rebase master
```

Danach kannst du in feature weiterarbeiten, **als ob** du direkt auf dem neuen master gestartet wärst.

### B) Feature ist fertig, du willst lineare Historie ohne Merge-Commit
Workflow:

```
git switch feature
git rebase master
git switch master
git merge feature
```

→ häufig Fast-Forward Merge möglich.

---

## 8) Quick-Check: Was ist der Kernunterschied zu `git merge`?

- `merge` **führt** zwei Branches zusammen (Historien bleiben sichtbar)
- `rebase` **ordnet** die Commits um (Historie wird “neu geschrieben”)

---

## 9) Mini-Übungsfragen

- Was macht Rebase mit Commit-IDs?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - Es erstellt neue Commits mit neuen Hashes (History Rewrite).
  </details>

- Warum kann Rebase in Teamprojekten gefährlich sein?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - Weil andere noch die alte Historie haben und neue Hashes zu Konflikten/Inkonsistenzen führen können.
  </details>

- Warum führt Rebase oft zu Fast-Forward Merge?
  <details style="margin-left: 20px;color: #186e3b;"><summary>Antwort anzeigen</summary>
  - Weil die Feature-Commits nach dem Rebase bereits direkt “auf” dem aktuellen master liegen.
  </details>

---
