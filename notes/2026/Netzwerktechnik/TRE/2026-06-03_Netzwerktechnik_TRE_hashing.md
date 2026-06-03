---
title: 'Hashing'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Netzwerktechnik'
instructor: 'TRE'
program: 'FIAE Umschulung 2025-2027'
module: 'Netzwerktechnik'
topic: 'Hashing, Integritaet, Authentizitaet'
level: 'AP1/AP2'
tags:
  - hashing
  - kryptografie
  - integritaet
  - authentizitaet
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Hashing

## Kurzüberblick

Hashing ist eine Einwegfunktion, die beliebige Daten in einen festen Wert (Hash) umwandelt. Es ist nicht möglich, den ursprünglichen Wert aus dem Hash zu rekonstruieren.
Wichtig für die Prüfung: Hashing ist kein Verschlüsselungsverfahren, sondern dient der Integritätsprüfung und Authentifizierung.

Merksatz: Verschlüsselung schützt Vertraulichkeit, Hashing prüft Integrität.

## Eigenschaften von Hashfunktionen
- Einwegfunktion: Keine Rückrechnung möglich
- Deterministisch: Gleiche Eingabe ergibt immer den gleichen Hash
- Schnell: Für Integritätsprüfungen effizient berechenbar
- Kollisionsresistent: Es sollte schwierig sein, zwei unterschiedliche Eingaben mit dem gleichen Hash zu finden
- Fester Output: Unabhängig von der Eingabelänge hat der Hash immer die gleiche Länge
- Beispiel: SHA-256 erzeugt immer einen 256-Bit-Hash
- Anwendungsfälle: Passwortspeicherung, Datenintegrität, digitale Signaturen, Blockchain

## Typische Hashverfahren
- MD5: Veraltet, unsicher, 128-Bit-Hash
- SHA-1: Veraltet, unsicher, 160-Bit-Hash
- SHA-256: Aktuell sicher, 256-Bit-Hash
- SHA-3: Neuere Generation, 256-Bit-Hash
- bcrypt, scrypt, Argon2: Speziell für Passwort-Hashing, bewusst langsam und ressourcenintensiv
- HMAC: Hash-based Message Authentication Code, kombiniert Hashing mit einem geheimen Schlüssel für Authentifizierung
- Merkmal: HMAC schützt vor Manipulation ohne geheimen Schlüssel und ist für API-Signaturen geeignet

## Anwendungsbeispiele
- Passwortspeicherung: Statt Passwörter im Klartext zu speichern, werden sie gehasht und nur der Hashwert gespeichert.
- Wichtig: Passwörter immer mit Salt und einem Passwort-Hashverfahren (z. B. Argon2, bcrypt) speichern.
- Datenintegrität: Hashes können verwendet werden, um sicherzustellen, dass Daten nicht verändert wurden (z.B. bei Downloads).
- Digitale Signaturen: Hashes werden in Kombination mit asymmetrischer Kryptografie genutzt, um Integrität und Authentizität zu prüfen.
- Blockchain: Hashes sind ein zentraler Bestandteil von Blockchains, um die Integrität der Daten zu gewährleisten und die Blöcke miteinander zu verknüpfen. Jeder Block enthält den Hash des vorherigen Blocks, was Manipulationen erschwert.
- Kollisionsangriffe: Angreifer versuchen, zwei unterschiedliche Eingaben zu finden, die den gleichen Hash erzeugen. Moderne Hashfunktionen sind so konzipiert, dass dies extrem schwierig ist, aber ältere Algorithmen wie MD5 und SHA-1 sind anfällig für solche Angriffe. Daher sollten sie nicht mehr verwendet werden.

## Integritaet, Authentizitaet, Vertraulichkeit sauber trennen

- Integrität: Hash zeigt, ob Daten verändert wurden.
- Authentizität: Kommt durch Signatur oder HMAC (nicht durch Hash allein).
- Vertraulichkeit: Wird durch Verschlüsselung erreicht, nicht durch Hashing.

## AP1/AP2 Lernfokus

- Hashing und Verschlüsselung sicher unterscheiden können
- MD5 und SHA-1 als veraltet einordnen können
- HMAC gegenüber normalem Hash erklären können
- Passwortspeicherung mit Salt + Argon2/bcrypt begründen können

## 30-Sekunden-Antwortschema für die Prüfung

1. Art einordnen: Hashing ist Einwegfunktion, keine Verschlüsselung.
2. Schutzziel nennen: primär Integrität.
3. Verfahren nennen: z. B. SHA-256/SHA-3, für Passwörter Argon2/bcrypt.
4. Praxisbezug geben: Download-Prüfsumme, Signatur, Passwortdatenbank.

## Zusammenfassung
- Hashing ist eine Einwegfunktion, die Daten in einen festen Wert umwandelt.
- Es dient vor allem der Integritätsprüfung; für Authentizität wird zusätzlich HMAC oder Signatur benötigt.
- Moderne Hashverfahren wie SHA-256 sind sicher, während ältere Algorithmen wie MD5 und SHA-1 unsicher sind.
- HMAC bietet zusätzlichen Schutz für Authentifizierungszwecke.

## Selbstcheck (mit Lösungen)

### Fragen

1. Warum ist SHA-256 keine Verschlüsselung?
2. Welche Eigenschaft verhindert, dass zwei verschiedene Eingaben leicht denselben Hash ergeben?
3. Warum reicht ein normaler Hash für Authentizität nicht aus?
4. Welche Verfahren sind für Passwortspeicherung geeignet?

### Lösungen

1. Weil Hashing nicht umkehrbar ist und keinen Entschlüsselungsschlüssel besitzt.
2. Kollisionsresistenz.
3. Weil jeder denselben Hash berechnen kann; ohne geheimen Schlüssel/Signatur ist der Absender nicht nachweisbar.
4. Argon2, bcrypt oder scrypt, jeweils mit Salt.
