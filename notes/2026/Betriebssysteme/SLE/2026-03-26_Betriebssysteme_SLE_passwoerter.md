---
title: 'Passwörter'
date: 2026-03-26
weekday: 'Donnerstag'
subject: 'Betriebssysteme'
instructor: 'SLE'
program: 'FIAE Umschulung 2025-2027'
module: 'IT-Sicherheit'
topic: 'Passwörter und Authentifizierung'
level: 'Grundlagen'
tags:
  - passwörter
  - authentifizierung
  - sicherheit
  - bsi
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---

# Passwörter

## Überblick / Definition
Ein **Passwort** ist ein geheimes Authentifizierungsmerkmal, mit dem sich ein Benutzer gegenüber einem System ausweist. Es dient dazu, **Identität zu prüfen und unbefugten Zugriff zu verhindern**.

Moderne Authentifizierung kombiniert häufig mehrere Faktoren:
- Wissen (Passwort)
- Besitz (z. B. Smartphone für OTP)
- Biometrie (z. B. Fingerabdruck)

---

## Anforderungen an sichere Passwörter (BSI)

Das **Bundesamt für Sicherheit in der Informationstechnik (BSI)** empfiehlt:

| Anforderung | Erklärung |
|------------|----------|
| Mindestlänge | Mindestens **12 Zeichen** |
| Komplexität | Kombination aus Groß-/Kleinbuchstaben, Zahlen, Sonderzeichen |
| Keine persönlichen Daten | Keine Namen, Geburtsdaten etc. |
| Einzigartigkeit | Kein Passwort mehrfach verwenden |
| Passwortmanager | Nutzung zur sicheren Verwaltung |
| 2FA | Zwei-Faktor-Authentifizierung aktivieren |
| Datenleck-Prüfung | Regelmäßige Checks (z. B. „Have I Been Pwned“) |

### Wichtiger Hinweis (aktuelle Praxis)
- **Regelmäßige Passwortänderung ist nicht mehr generell empfohlen**, sondern nur bei Verdacht auf Kompromittierung
- Fokus liegt heute auf **starken, einzigartigen Passwörtern + 2FA**

---

## Arten von Passwörtern

| Typ | Beschreibung | Beispiel | Bewertung |
|-----|-------------|----------|-----------|
| Einfaches Passwort | Nur Buchstaben/Zahlen | `Passwort123` | ❌ unsicher |
| Komplexes Passwort | Mischung aller Zeichentypen | `P@ssw0rd!2026` | ⚠️ besser |
| Passphrase | Mehrere Wörter kombiniert | `SonneBlumeRegenbogen2026` | ✅ sehr gut |
| Einmalpasswort (OTP) | Nur einmal gültig | SMS / App-Code | ✅ sehr sicher |
| Biometrie | Körpermerkmal | Fingerabdruck | ⚠️ ergänzend |

---

## Core-Konzept: Passwortsicherheit

Die Sicherheit eines Passworts hängt primär von zwei Faktoren ab:

### 1. Entropie (Unvorhersehbarkeit)
- Je länger und zufälliger, desto sicherer
- Beispiel:
  - `123456` → sehr geringe Entropie
  - `7&fK!9zQpL2@` → hohe Entropie

### 2. Länge > Komplexität
- Ein langes Passwort ist oft sicherer als ein kurzes komplexes
- Beispiel:
  - `P@ss1!` (kurz, komplex) ❌
  - `blauerHundTanztImRegen2026` (lang) ✅

---

## Praktisches Beispiel

### Unsicher:
```
Sommer2024
```
→ leicht zu erraten (Wörterbuch + Jahreszahl)

### Sicher:
```
Kaffee!ZugWolke#Lampe2026
```

→ lang, zufällig, hohe Entropie

---

## Passwortmanager

### Funktion
Passwortmanager ermöglichen:
- sichere Speicherung (verschlüsselt)
- Generierung starker Passwörter
- automatische Eingabe
- Verwaltung vieler Accounts

### Beispiele

| Kategorie | Tools |
|----------|------|
| Open Source | KeePassXC, Bitwarden |
| Cloud-basiert | 1Password, Dashlane |
| Enterprise | Passbolt, Pleasant Password Server |

### KeePassXC (Beispiel)
- Open Source
- lokale, verschlüsselte Datenbank
- Passwortgenerator integriert
- TOTP-Unterstützung
- keine Cloud (optional über eigene Lösungen)

---

## Zentrale Passwortverwaltung (Unternehmen)

Ein **zentraler Passwortserver** ermöglicht:
- Verwaltung von Zugangsdaten im Team
- Zugriffskontrolle (z. B. Rollen)
- Integration in Verzeichnisdienste (LDAP / Active Directory)
- API für Automatisierung

**Beispiele:**
- Passbolt
- Pleasant Password Server

---

## Umsetzung im Betriebssystem

### Windows (10/11)

Passwortrichtlinien konfigurierbar über:
- Lokale Sicherheitsrichtlinien (`secpol.msc`)
- Gruppenrichtlinien (GPO)

Mögliche Einstellungen:
- Mindestlänge
- Komplexität
- Ablaufzeit
- Kontosperrung

Beispiel (CLI):
```bash
net user username neuesPasswort
```

---

### Linux

Konfiguration über:
- `/etc/login.defs`
- PAM (`/etc/pam.d/`)

Passwort ändern:
```bash
passwd
```

---

## Prüfungsrelevanz (AP1)

### Typische Fragen:

**1. Anforderungen an sichere Passwörter:**
- Länge (≥ 12 Zeichen)
- hohe Entropie
- keine Wiederverwendung
- keine persönlichen Daten
- Nutzung von 2FA

**2. Arten von Passwörtern:**
- einfaches Passwort
- komplexes Passwort
- Passphrase
- OTP
- biometrische Verfahren

---

## Häufige Fehler & Missverständnisse

| Fehler | Erklärung |
|-------|----------|
| Kurze komplexe Passwörter | Länge ist wichtiger als Sonderzeichen |
| Passwort-Wiederverwendung | großes Risiko bei Datenlecks |
| Speicherung im Klartext | absolut unsicher |
| Regelmäßiger Zwangswechsel | oft kontraproduktiv |
| Kein 2FA | unnötiges Risiko |

---

## Merksatz

> **„Lang, einzigartig, zufällig – und am besten vom Passwortmanager erzeugt.“**

---

