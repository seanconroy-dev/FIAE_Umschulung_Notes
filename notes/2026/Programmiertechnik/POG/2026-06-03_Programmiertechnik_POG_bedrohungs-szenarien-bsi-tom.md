---
title: 'Bedrohungs Szenarien BSI TOM'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Programmiertechnik'
instructor: 'POG'
program: 'FIAE Umschulung 2025-2027'
module: 'Informationssicherheit'
topic: 'Bedrohungsszenarien, BSI, TOM'
level: 'AP1/AP2'
tags:
  - bsi
  - tom
  - informationssicherheit
  - datenschutz
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Bedrohungs Szenarien BSI TOM

## Kurzueberblick / Definition

Bedrohungsszenarien beschreiben moegliche Angriffe oder Stoerungen auf IT-Systeme und Daten.

Fuer AP1/AP2 wichtig:

- Bedrohung erkennen
- Schutzziel zuordnen (CIA)
- passende TOM ableiten

## Was ist das BSI?

BSI steht fuer Bundesamt fuer Sicherheit in der Informationstechnik.

Kurz erklaert:

- Das BSI ist die zentrale deutsche Behoerde fuer Cybersicherheit.
- Es veroeffentlicht Empfehlungen, Standards und Mindestanforderungen fuer IT-Sicherheit.
- Es unterstuetzt Behoerden, Unternehmen und Betreiber kritischer Infrastrukturen.

Warum ist das in der Pruefung wichtig?

- BSI-Vorgehen hilft, Bedrohungen systematisch zu analysieren.
- Es verbindet Technik, Organisation und Prozesse (nicht nur Tools).
- Viele Sicherheitskonzepte in Unternehmen orientieren sich am BSI-Grundschutz.

## Schutzziele als Basis (CIA + Erweiterung)

- Vertraulichkeit: Nur Berechtigte duerfen lesen.
- Integritaet: Daten duerfen nicht unbemerkt veraendert werden.
- Verfuegbarkeit: Systeme und Daten muessen nutzbar sein.
- Authentizitaet: Identitaet ist echt und nachweisbar.
- Nichtabstreitbarkeit: Handlungen koennen nicht glaubhaft abgestritten werden.

## Typische Bedrohungsszenarien

| Bedrohung | Kurzbeschreibung | Hauptbetroffenes Schutzziel |
|---|---|---|
| Datenverlust | Daten gehen verloren (Defekt, Loeschen, Fehler) | Verfuegbarkeit, Integritaet |
| Datenmanipulation | Daten werden unberechtigt veraendert | Integritaet |
| Datenleck | Vertrauliche Daten werden offengelegt | Vertraulichkeit |
| Ransomware | Daten werden verschluesselt, Betrieb wird blockiert | Verfuegbarkeit, Integritaet |
| DDoS | Dienste werden durch Last unerreichbar | Verfuegbarkeit |
| Insider-Bedrohung | Missbrauch durch interne Personen | Alle, oft Vertraulichkeit |
| Phishing | Taeuschung zur Zugangsdaten-Abgabe | Vertraulichkeit, Authentizitaet |
| Malware | Schadcode infiziert Systeme | Integritaet, Verfuegbarkeit |
| Zero-Day-Exploit | Ausnutzung unbekannter Schwachstellen | Alle |

## BSI-Kontext (vereinfacht)

Das BSI empfiehlt, Risiken systematisch zu behandeln:

1. Werte/Assets bestimmen (z. B. Kundendaten, ERP-System).
2. Bedrohungen und Schwachstellen identifizieren.
3. Risiko bewerten (Eintrittswahrscheinlichkeit x Schaden).
4. Massnahmen umsetzen und regelmaessig pruefen.

Merksatz: Nicht nur Technik absichern, sondern Prozesse und Menschen mitdenken.

## TOM: Technische und organisatorische Massnahmen

TOM sind Schutzmassnahmen nach DSGVO Art. 32 und allgemein gute Sicherheitspraktiken.

### Technische Massnahmen (T)

- Verschluesselung (at rest / in transit)
- Zugriffskontrolle (MFA, Rollen, Rechte)
- Firewalls, IDS/IPS, Netzwerksegmentierung
- Backup und Restore-Tests
- Endpoint-Schutz, Patch-Management
- Protokollierung und Monitoring (SIEM)

### Organisatorische Massnahmen (O)

- Berechtigungskonzepte und Vier-Augen-Prinzip
- Schulungen (z. B. Phishing Awareness)
- Notfallplaene und Incident-Response-Prozesse
- Richtlinien (Passwort, Clean Desk, Mobile Work)
- Verfahrensdokumentation und Regelpruefungen
- Auftragsverarbeitungsvertraege und Datenschutzprozesse

## Zuordnung: Bedrohung -> passende TOM

| Bedrohung | Technische Massnahmen | Organisatorische Massnahmen |
|---|---|---|
| Datenverlust | 3-2-1-Backups, Redundanz, Snapshots | Backup-Policy, Restore-Uebungen |
| Datenmanipulation | Hashing, Signaturen, Rechtekonzept | Freigabeprozesse, Vier-Augen-Prinzip |
| Datenleck | Verschluesselung, DLP, MFA | Need-to-know-Prinzip, Schulungen |
| Ransomware | EDR, Segmentierung, Offline-Backups | Incident-Plan, Mitarbeiterschulung |
| DDoS | Rate-Limiting, WAF, CDN/Scrubbing | Notfallkommunikation, Dienstleistervertrag |
| Insider-Bedrohung | Protokollierung, Least Privilege | Job-Rotation, Awareness, Trennungsprinzip |
| Phishing | Mail-Filter, SPF/DKIM/DMARC, MFA | Sensibilisierung, Meldeprozess |
| Malware | AV/EDR, Patch-Management, Whitelisting | Software-Freigabeprozess |
| Zero-Day | Hardening, Segmentierung, Monitoring | Schnellprozess fuer Patches/Workarounds |

## Mini-Fallbeispiele (pruefungsnah)

### Fall 1: Ransomware im Fileserver

Situation: Nutzer kann keine Dateien mehr oeffnen, Loesegeldhinweis erscheint.

Erwartete Pruefungsantwort (kurz):

- betroffenes Schutzziel: Verfuegbarkeit (und Integritaet)
- Sofortmassnahmen: System isolieren, Incident-Prozess starten, Backups pruefen
- TOM zur Vorsorge: Offline-Backups, Segmentierung, EDR, Awareness-Schulungen

### Fall 2: Phishing-Mail im Einkauf

Situation: Mitarbeiter klickt Link, gibt Zugangsdaten ein.

Erwartete Pruefungsantwort (kurz):

- betroffenes Schutzziel: Vertraulichkeit/Authentizitaet
- Sofortmassnahmen: Passwort reset, MFA aktivieren, Log-Analyse
- TOM zur Vorsorge: Mail-Schutz, Schulung, Meldeprozess

## AP1/AP2 Lernfokus

- Bedrohung immer einem Schutzziel zuordnen koennen
- mindestens 2 technische und 2 organisatorische Massnahmen nennen koennen
- Unterschied zwischen Technikproblem und Prozessproblem erklaeren koennen
- TOM nicht nur aufzahlen, sondern begruendet auswaehlen

## Klausurtypische Stolperfallen

- Nur technische Massnahmen nennen und Organisation vergessen
- Vertraulichkeit und Integritaet verwechseln
- Ransomware nur als "Verschluesselung" sehen, statt Ausfallrisiko zu betonen
- Keine Priorisierung von Sofortmassnahmen im Vorfall

## Selbstcheck (mit Loesungen)

### Fragen

1. Welche Schutzziele sind bei DDoS primaer betroffen?
2. Nenne je 2 technische und 2 organisatorische TOM gegen Phishing.
3. Warum reichen Backups allein gegen Ransomware nicht aus?
4. Ein Mitarbeiter veraendert absichtlich Kundendaten. Welche Bedrohung liegt vor und welche TOM passen?

### Loesungen

1. Verfuegbarkeit (primaer), ggf. Integritaet indirekt.
2. Technisch: Mail-Filter, MFA. Organisatorisch: Awareness-Schulung, klarer Meldeprozess.
3. Weil auch Erkennung, Eindammung und Wiederanlauf organisiert sein muessen; ausserdem koennen Backups kompromittiert sein.
4. Insider-Bedrohung/Datenmanipulation; TOM: Least Privilege, Protokollierung, Vier-Augen-Prinzip, klare Sanktions- und Freigabeprozesse.
