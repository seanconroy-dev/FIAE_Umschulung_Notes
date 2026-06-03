---
title: 'Integrität'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: 'Informationssicherheit'
topic: 'Schutzziele, Integritaet, CIA'
level: 'AP1/AP2'
tags:
  - integritaet
  - schutzziele
  - cia
  - hashing
  - informationssicherheit
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Integrität

## Kurzüberblick
Integrität ist eines der drei Kernschutzziele der IT-Sicherheit (CIA).
Definition: Informationen dürfen nicht unbemerkt verändert oder manipuliert werden.
Merksatz: Integrität = Wurden Daten verändert?
---

## Die drei Kernschutzziele (CIA) im Überblick
| Schutzziel | Leitfrage | Schutz durch |
|---|---|---|
| Vertraulichkeit | Wer darf lesen? | Verschlüsselung, Zugriffskontrollen |
| **Integrität** | **Wurden Daten verändert?** | **Hashing, Signaturen** |
| Verfügbarkeit | Ist das System nutzbar? | Redundanz, Backups, DDoS-Schutz |

Zusätzlich in der Prüfung relevant:
- Authentizität: Identität des Absenders nachweisbar (Zertifikate, Signaturen)
- Nichtabstreitbarkeit: Handlung kann nicht geleugnet werden (digitale Signatur)
- Integrität ist die Grundlage für Vertrauen in Daten und Systeme. Ohne Integrität können Informationen manipuliert und missbraucht werden.

---

## Maßnahmen für Integrität

### Technische Maßnahmen

- Hashing: Einwegfunktion, die aus Daten einen festen Wert erzeugt (z. B. SHA-256). Jede Änderung an den Daten führt zu einem anderen Hash-Wert.
- Digitale Signaturen: Kombinieren Hashing mit asymmetrischer Kryptografie, um Herkunft und Unverändertheit gleichzeitig zu beweisen.
- Prüfsummen: Einfache Integritätsprüfung (z. B. CRC32), aber nicht kryptografisch sicher — nur für Übertragungsfehler geeignet.
- Versionierung: Änderungen nachvollziehbar speichern (z. B. Git, Dokumentenversionen).
- Datenbank-Constraints: Regeln wie Primärschlüssel und Fremdschlüssel verhindern ungültige Dateneingaben.
- IDS (Intrusion Detection System): Überwacht Systeme auf unautorisierte Änderungen.
- Signierte Software-Updates: Sicherstellen, dass heruntergeladene Updates nicht manipuliert wurden.

### Organisatorische Maßnahmen

- Schulungen zu sicheren Entwicklungspraktiken (Input-Validierung, Code-Reviews)
- Change Management: Kontrollierter Prozess für Änderungen an Systemen und Daten
- Vier-Augen-Prinzip: Änderungen werden von einer zweiten Person geprüft
- Protokollierung: Alle Änderungen werden aufgezeichnet und auswertbar gemacht
- Regelmäßige Integritätsprüfungen: z. B. Prüfsummen von Systemdateien regelmäßig vergleichen

---

## Verwechslungsgefahr: Integrität vs. Authentizität vs. Vertraulichkeit

- Integrität: Daten wurden nicht verändert → Hash prüft es.
- Authentizität: Absender ist wer er vorgibt zu sein → Signatur/Zertifikat beweist es.
- Vertraulichkeit: Niemand Unbefugtes hat gelesen → Verschlüsselung schützt es.

Typischer Prüfungsfehler: Eine Signatur beweist Integrität UND Authentizität gleichzeitig — das sind zwei Schutzziele in einem Schritt.

---

## AP1/AP2 Lernfokus

- Integrität klar von Authentizität und Vertraulichkeit abgrenzen können
- Unterschied zwischen Hashing (Integrität) und Signatur (Integrität + Authentizität) erklären
- CRC32 vs. SHA-256 einordnen: CRC für Übertragungsfehler, SHA für Manipulationsschutz
- Praxisbeispiel nennen: Download-Prüfsumme, signiertes Software-Update

---

## 30-Sekunden-Antwortschema für die Prüfung

1. Schutzziel benennen: Integrität.
2. Definition in einem Satz: Daten dürfen nicht unbemerkt verändert werden.
3. Zwei technische Maßnahmen: z. B. SHA-256-Hash, digitale Signatur.
4. Zwei organisatorische Maßnahmen: z. B. Vier-Augen-Prinzip, Change Management.

---

## Selbstcheck (mit Lösungen)

### Fragen

1. Welches Schutzziel ist betroffen, wenn ein Angreifer Daten in einer Datenbankzeile unbemerkt ändert?
2. Was ist der Unterschied zwischen einer Prüfsumme (CRC32) und einem kryptografischen Hash (SHA-256)?
3. Beweist ein SHA-256-Hash allein die Authentizität?
4. Nenne zwei organisatorische Maßnahmen für Integrität.

### Lösungen

1. Integrität.
2. CRC32 erkennt zufällige Übertragungsfehler, ist aber leicht zu fälschen; SHA-256 ist kryptografisch sicher und erkennt auch gezielte Manipulationen.
3. Nein. Ein Hash beweist nur, dass Daten unverändert sind, nicht wer sie gesendet hat. Dafür braucht man eine Signatur.
4. Zwei aus: Vier-Augen-Prinzip, Change Management, Protokollierung, regelmäßige Integritätsprüfungen.
