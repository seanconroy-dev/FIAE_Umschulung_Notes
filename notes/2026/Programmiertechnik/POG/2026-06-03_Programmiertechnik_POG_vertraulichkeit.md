---
title: 'Vertraulichkeit'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: 'Informationssicherheit'
topic: 'Schutzziele, Vertraulichkeit, CIA'
level: 'AP1/AP2'
tags:
  - vertraulichkeit
  - schutzziele
  - cia
  - informationssicherheit
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Vertraulichkeit

## Kurzüberblick

Vertraulichkeit ist eines der drei Kernschutzziele der IT-Sicherheit (CIA).

Definition: Informationen dürfen nur von berechtigten Personen gelesen oder verarbeitet werden.

Merksatz: Vertraulichkeit = Wer darf lesen?

---

## Die drei Kernschutzziele (CIA) im Überblick

| Schutzziel | Leitfrage | Schutz durch |
|---|---|---|
| Vertraulichkeit | Wer darf lesen? | Verschlüsselung, Zugriffskontrollen |
| Integrität | Wurden Daten verändert? | Hashing, Signaturen |
| Verfügbarkeit | Ist das System nutzbar? | Redundanz, Backups, DDoS-Schutz |

Zusätzlich in der Prüfung relevant:

- Authentizität: Identität des Absenders nachweisbar (Zertifikate, Signaturen)
- Nichtabstreitbarkeit: Handlung kann nicht geleugnet werden (digitale Signatur)

---

## Maßnahmen für Vertraulichkeit

### Technische Maßnahmen

- Verschlüsselung: symmetrisch (AES) für Daten, asymmetrisch (RSA) für Schlüsselaustausch
- Zugriffskontrolle: RBAC (rollenbasiert), ACL (Zugriffslisten), Least Privilege
- Multi-Faktor-Authentifizierung (MFA)
- Netzwerksicherheit: Firewalls, VPN, HTTPS/TLS
- Datenklassifizierung: Daten nach Schutzbedarf stufen (öffentlich, intern, vertraulich, geheim)

### Organisatorische Maßnahmen

- Need-to-know-Prinzip: Nur wer die Information braucht, bekommt Zugriff
- Berechtigungskonzept dokumentieren und regelmäßig prüfen
- Clean-Desk-Policy
- Mitarbeiterschulungen (Datenschutz, Social Engineering)
- Vertragliche Regelungen (NDA, Auftragsverarbeitung)

---

## Verwechslungsgefahr: Vertraulichkeit vs. Integrität vs. Authentizität

- Vertraulichkeit: jemand liest Daten, der es nicht darf → Verschlüsselung schützt
- Integrität: Daten wurden verändert, ohne dass es auffiel → Hash zeigt die Änderung
- Authentizität: man weiß nicht, ob der Absender echt ist → Signatur/Zertifikat beweist es

Typischer Prüfungsfehler: Hashing mit Verschlüsselung verwechseln.
Hashing schützt Integrität, nicht Vertraulichkeit.

---

## AP1/AP2 Lernfokus

- CIA-Schutzziele auswendig erklären können
- Zu jedem Schutzziel mindestens 2 technische und 2 organisatorische Maßnahmen nennen
- Vertraulichkeit klar von Integrität und Authentizität abgrenzen

---

## 30-Sekunden-Antwortschema für die Prüfung

1. Schutzziel benennen: Vertraulichkeit.
2. Definition in einem Satz: nur Berechtigte dürfen lesen.
3. Zwei technische Maßnahmen: z. B. AES-Verschlüsselung, MFA.
4. Zwei organisatorische Maßnahmen: z. B. Need-to-know, Berechtigungskonzept.

---

## Selbstcheck (mit Lösungen)

### Fragen

1. Welches Schutzziel ist betroffen, wenn ein Angreifer unverschlüsselte Kundendaten abfängt?
2. Schützt Hashing die Vertraulichkeit?
3. Was ist das Need-to-know-Prinzip?
4. Nenne zwei technische Maßnahmen für Vertraulichkeit.

### Lösungen

1. Vertraulichkeit.
2. Nein. Hashing schützt Integrität, nicht Vertraulichkeit.
3. Jeder erhält nur Zugriff auf die Informationen, die er für seine Aufgabe benötigt.
4. Zwei aus: AES-Verschlüsselung, RSA/TLS, MFA, Firewall, VPN.


