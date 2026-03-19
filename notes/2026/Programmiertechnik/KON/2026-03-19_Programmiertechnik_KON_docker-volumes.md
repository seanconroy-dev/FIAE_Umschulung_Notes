---
title: "Docker Volumes"
date: 2026-03-19
weekday: "Donnerstag"
subject: "Programmiertechnik"
instructor: "KON"
program: "FIAE Umschulung 2025-2027"
module: "Containerisierung"
topic: "Persistente Datenspeicherung mit Docker"
level: "Grundlagen"
tags:
  - docker
  - volumes
  - storage
  - devops
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Docker Volumes

## Kurzdefinition
**Docker Volumes** sind von Docker verwaltete Speicherbereiche, die **außerhalb des Containers** liegen und eine **dauerhafte Datenspeicherung (Persistenz)** ermöglichen.

---

## Das zentrale Problem (Prüfungs-Klassiker!)

### ❗ Problem: Flüchtige Container

```mermaid
flowchart LR
    A[Container läuft] --> B[Daten werden gespeichert]
    B --> C[Container wird gelöscht]
    C --> D[Daten sind verloren ❌]
```

- Container sind **ephemeral (flüchtig)**
- Daten im Container gehen beim Löschen verloren

---

## Lösung: Docker Volumes

```mermaid
flowchart LR
    A[Container] --> B[Volume]
    B --> C[Host-System]
    C --> B
```

- Daten liegen **außerhalb des Containers**
- bleiben erhalten, auch wenn:
  - Container gestoppt wird
  - Container gelöscht wird

---

## Eigenschaften von Docker Volumes

- persistente Speicherung (Daten bleiben erhalten)
- von Docker verwaltet
- unabhängig vom Container-Lebenszyklus
- mehrere Container können dasselbe Volume nutzen
- ideal für:
  - Datenbanken
  - Logs
  - Uploads
  - Konfigurationsdateien

---

## Verwendung von Volumes

### Volume erstellen

```bash
docker volume create my_volume
```

---

### Volume verwenden (Container starten)

```bash
docker run -d -v my_volume:/data my_image
```

 Bedeutung:
- `my_volume` = Volume auf Host
- `/data` = Pfad im Container

---

### Volumes verwalten

| Befehl | Beschreibung |
|-------|-------------|
| `docker volume ls` | alle Volumes anzeigen |
| `docker volume inspect <name>` | Details anzeigen |
| `docker volume rm <name>` | Volume löschen |

---

## Alternative: `--mount` (moderner Syntax)

```bash
docker run -d \
  --mount type=volume,source=my_volume,target=/data \
  my_image
```

 Vorteil:
- expliziter und besser lesbar
- bevorzugt in komplexeren Setups

---

## Vergleich: 3 Lösungen für das Datenproblem

| Lösung | Beschreibung | Bewertung |
|-------|-------------|----------|
| `docker cp` | manuelles Kopieren von Daten | ❌ unpraktisch |
| Bind Mount | Host-Verzeichnis direkt einbinden | ⚠️ gut für Dev |
| Docker Volume | Docker verwalteter Speicher | ✅ beste Lösung |

---

### 1. `docker cp` (nicht skalierbar)

```bash
docker cp container:/data ./backup
```

- nur manuell
- fehleranfällig
- nicht automatisiert

 nur für Debugging geeignet

---

### 2. Bind Mount

```bash
docker run -v /host/data:/container/data my_image
```

**Vorteile:**
- direkter Zugriff auf Host-Dateien

**Nachteile:**
- abhängig vom Host-System
- weniger portabel
- Sicherheitsrisiken

 gut für Entwicklung

---

### 3. Docker Volumes (Best Practice)

```bash
docker run -v my_volume:/data my_image
```

**Vorteile:**
- Docker verwaltet Speicher
- portabel
- sicherer
- einfach zu nutzen

 Standardlösung in Produktion

---

## Verwendung im Dockerfile

```Dockerfile
VOLUME ["/data"]
```

⚠️ Wichtig:
- definiert nur einen Mount-Punkt
- erstellt **kein Volume automatisch beim Build**
- Volume wird erst beim Start genutzt

---

## Praxis-Szenario (Prüfung!)

### Situation:

- 1000 User registrieren sich
- Daten werden im Container gespeichert
- Container wird gelöscht

 Ergebnis ohne Volume:
→ **alle Daten weg ❌**

---

### Lösung:

```bash
docker run -v my_volume:/data my_app
```

 Ergebnis:
- Daten bleiben erhalten ✅
- neuer Container kann weiterarbeiten

---

## Backup & Restore eines Named Volumes

### Backup erstellen

```bash
docker run --rm \
  -v my_volume:/data \
  -v "$PWD":/backup \
  alpine sh -c "tar czf /backup/my_volume_backup.tgz -C /data ."
```

### Backup zurueckspielen (Restore)

```bash
docker run --rm \
  -v my_volume:/data \
  -v "$PWD":/backup \
  alpine sh -c "tar xzf /backup/my_volume_backup.tgz -C /data"
```

Nutzen:
- wichtig vor Updates/Migrationen
- schnell fuer lokale Sicherungen

---

## Volumes in Docker Compose

```yaml
services:
  db:
    image: postgres:16
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

Hinweis:
- `db_data` bleibt erhalten, auch wenn der Container neu erstellt wird

---

## Aufraeumen (mit Vorsicht)

```bash
docker volume ls
docker volume prune
```

Hinweis:
- `docker volume prune` loescht ungenutzte Volumes
- vorher immer pruefen, ob wichtige Daten enthalten sind

---

## Prüfungsrelevanz (AP1)

### Typische Fragen + Antworten

**Warum braucht man Volumes?**  
→ um Daten dauerhaft zu speichern

**Was passiert ohne Volume?**  
→ Daten gehen beim Löschen verloren

**Unterschied Bind Mount vs Volume?**  
→ Volume = Docker verwaltet, Bind Mount = Host abhängig

**Wie bindet man ein Volume ein?**  
→ `-v volume:/pfad` oder `--mount`

---

## Häufige Fehler

### ❌ Typische Probleme

- Daten im Container speichern statt im Volume
- falscher Mount-Pfad
- Volume nicht verwendet → Datenverlust
- Bind Mount in Produktion ohne Verständnis

---

###  Best Practices

- immer Volumes für persistente Daten nutzen
- für Produktion → **Docker Volumes bevorzugen**
- für Entwicklung → Bind Mount ok
- klare Trennung: Code vs Daten

---

## Zusammenfassung

- Container = **flüchtig**
- Volumes = **dauerhaft**

 Ohne Volume:
→ Datenverlust

 Mit Volume:
→ persistente Speicherung + Wiederverwendbarkeit

**Merksatz (Prüfung):**  
 *"Ohne Volume sind Container zustandslos (stateless)"*

---