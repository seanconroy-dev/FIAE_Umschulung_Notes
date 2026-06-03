---
title: 'Authentizität'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: 'Informationssicherheit'
topic: 'Schutzziele, Authentizitaet, CIA'
level: 'AP1/AP2'
tags:
  - authentizitaet
  - schutzziele
  - cia
  - pki
  - informationssicherheit
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Authentizität

## Kurzüberblick

Authentizität ist ein erweitertes Schutzziel der IT-Sicherheit.

Definition: Die Identität eines Absenders oder einer Quelle ist echt und nachweisbar.

Merksatz: Authentizität = Von wem kommen die Daten?

---

## CIA + Erweiterung: Einordnung

| Schutzziel | Leitfrage | Schutz durch |
|---|---|---|
| Vertraulichkeit | Wer darf lesen? | Verschlüsselung, Zugriffskontrollen |
| Integrität | Wurden Daten verändert? | Hashing, Signaturen |
| Verfügbarkeit | Ist das System nutzbar? | Redundanz, Backups |
| **Authentizität** | **Von wem kommen die Daten?** | **Zertifikate, digitale Signaturen** |
| Nichtabstreitbarkeit | Kann die Handlung geleugnet werden? | Digitale Signatur, Protokollierung |

---

## Maßnahmen für Authentizität

### Technische Maßnahmen

- Digitale Zertifikate (X.509): bestätigen die Identität von Websites, Diensten oder Personen
- Digitale Signaturen: beweisen Herkunft und Unverändertheit gleichzeitig
- Public Key Infrastruktur (PKI): verwaltet Schlüssel, Zertifikate und Vertrauensketten
- MFA: Kombination aus Wissen (Passwort), Besitz (Token) und Inhärenz (Biometrie)
- Authentifizierungsprotokolle: OAuth 2.0, SAML, OpenID Connect

### Organisatorische Maßnahmen

- Schulungen zu Phishing und Social Engineering
- Zertifikatsverwaltung: Ablaufdaten überwachen, kompromittierte Zertifikate widerrufen
- Berechtigungskonzept: nur berechtigte Identitäten erhalten Zugang
- Incident Response Plan: klares Vorgehen bei Identitätsdiebstahl
- Protokollierung und Monitoring: verdächtige Anmeldeversuche erkennen

---

## Verwechslungsgefahr: Authentizität vs. Integrität

- Integrität prüft, ob Daten verändert wurden (Hash gleich oder nicht).
- Authentizität prüft, wer die Daten gesendet hat (Signatur mit privatem Schlüssel).

Ein normaler Hash allein beweist keine Authentizität — dafür braucht man eine Signatur oder HMAC.

---

## AP1/AP2 Lernfokus

- Authentizität klar von Integrität und Vertraulichkeit abgrenzen
- PKI-Kette in 3 Schritten erklären können (CA signiert Zertifikat, Client prüft Kette)
- MFA-Faktoren nennen und unterscheiden (Wissen, Besitz, Inhärenz)
- Digitale Signatur als Beweis für Authentizität und Integrität gleichzeitig einordnen

---

## 30-Sekunden-Antwortschema für die Prüfung

1. Schutzziel benennen: Authentizität.
2. Definition in einem Satz: Identität des Absenders ist echt und nachweisbar.
3. Zwei technische Maßnahmen: z. B. digitale Signatur, X.509-Zertifikat.
4. Zwei organisatorische Maßnahmen: z. B. Zertifikatsverwaltung, Phishing-Schulung.

---

## Selbstcheck (mit Lösungen)

### Fragen

1. Was ist der Unterschied zwischen Authentizität und Integrität?
2. Reicht ein SHA-256-Hash allein, um Authentizität zu beweisen?
3. Nenne die drei MFA-Faktoren.
4. Welches Schutzziel ist betroffen, wenn jemand gefälschte E-Mails im Namen des Chefs verschickt?

### Lösungen

1. Integrität = Daten unverändert; Authentizität = Absender ist wer er vorgibt zu sein.
2. Nein. Jeder kann denselben Hash berechnen; ohne privaten Schlüssel kein Identitätsnachweis.
3. Wissen (Passwort/PIN), Besitz (Token/Smartphone), Inhärenz (Fingerabdruck/Gesicht).
4. Authentizität (und ggf. Nichtabstreitbarkeit).



