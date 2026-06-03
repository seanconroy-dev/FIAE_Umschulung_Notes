---
title: 'Verschlüsselung'
date: 2026-06-03
weekday: 'Mittwoch'
subject: 'Netzwerktechnik'
instructor: 'TRE'
program: 'FIAE Umschulung 2025-2027'
module: 'Netzwerktechnik'
topic: 'Verschluesselung, Hashing, Signatur'
level: 'AP1/AP2'
tags:
  - verschluesselung
  - kryptografie
  - ap1
  - ap2
author: 'Sean Matthew Conroy'
license: 'CC BY-NC-SA 4.0'
---
# Verschlüsselung

## Kurzüberblick

Verschlüsselung macht Daten für Unbefugte unlesbar. Nur mit dem passenden Schlüssel werden die Daten wieder lesbar.

Wichtig für die Prüfung: Verschlüsselung ist nur ein Teil der IT-Sicherheit.

- Vertraulichkeit: Wer darf lesen?
- Integrität: Wurden Daten verändert?
- Authentizität: Von wem kommen die Daten?
- Nichtabstreitbarkeit: Kann der Absender die Handlung später leugnen?

## Arten im Überblick

| Verfahren | Kernidee | Typische Beispiele |
|---|---|---|
| Symmetrisch | Ein gemeinsamer Schlüssel für Ver- und Entschlüsselung | AES |
| Asymmetrisch | Public Key verschlüsselt, Private Key entschlüsselt | RSA, ECC |
| Hybrid | Asymmetrisch für Schlüsseltausch, symmetrisch für Nutzdaten | TLS/HTTPS |
| Schlüsselaustausch | Sicherer Aufbau eines gemeinsamen Schlüssels | Diffie-Hellman, ECDH |
| Hashing | Einwegfunktion, keine Entschlüsselung möglich | SHA-256 |

## Symmetrische Verschlüsselung

Merkmale:

- sehr schnell
- gleicher Schlüssel auf Sender- und Empfängerseite
- gut für große Datenmengen
- typische Verfahren: AES, ChaCha20

Nachteile:

- Schlüsselverteilung ist schwierig
- bei $n$ Teilnehmern werden viele Schlüssel benötigt: $\frac{n(n-1)}{2}$
- kompromittierter Schlüssel gefährdet alle damit verschlüsselten Daten

## Asymmetrische Verschlüsselung

Merkmale:

- Schlüsselpaar: öffentlicher und privater Schlüssel
- kein geheimer Schlüsseltausch vorab nötig
- ermöglicht digitale Signaturen
- deutlich langsamer als symmetrische Verfahren

Nachteile:

- höherer Rechenaufwand
- größere Schlüssellängen nötig (z. B. RSA 2048+)
- komplexere Verwaltung (Zertifikate, PKI, Trust Chain)

## Hybrid-Verschlüsselung (wichtig fuer AP1/AP2)

Praxisablauf bei TLS/HTTPS:

1. Client erhält den öffentlichen Schlüssel/Zertifikat des Servers.
2. Client und Server tauschen sicher einen Sitzungsschlüssel aus (z. B. via ECDHE).
3. Die eigentlichen Nutzdaten laufen danach symmetrisch (schnell).

Merksatz: Asymmetrisch startet sicher, symmetrisch überträgt schnell.

## Diffie-Hellman und Hashing klar trennen

- Diffie-Hellman verschlüsselt keine Nutzdaten direkt, sondern erzeugt einen gemeinsamen Schlüssel.
- Hashing ist keine Verschlüsselung, weil es nicht umkehrbar ist.

## Prinzip der digitalen Signatur

1. Sender bildet Hash der Nachricht.
2. Sender signiert diesen Hash mit privatem Schlüssel.
3. Empfänger prüft Signatur mit öffentlichem Schlüssel.
4. Empfänger bildet selbst den Hash der Nachricht und vergleicht.

Wenn gleich, dann:

- Integrität gegeben
- Authentizität gegeben

Wichtig: Eine Signatur allein verschlüsselt die Nachricht nicht.

## Exkurs: Typische Einsatzbereiche

- VPN: geschützter Tunnel über unsichere Netze
- Authentisierung: Identitätsnachweis (z. B. Zertifikate)
- E-Mail-Verschlüsselung: PGP oder S/MIME
- Digitale Signaturen: Dokumente und E-Mails rechtssicher absichern
- SSH-Tunneling: sichere Remote-Verbindungen und Port-Weiterleitungen

## Bruteforce und Rechenleistung (vereinfacht)

Für einen Schlüssel mit $n$ Bit gilt:

- Schlüsselraum: $2^n$
- durchschnittlich benötigte Versuche: $2^{n-1}$

Jedes zusätzliche Bit verdoppelt den Aufwand.

Wenn sich die Rechenleistung regelmäßig verdoppelt (Moore), halbiert sich ungefähr die benötigte Angriffszeit pro Verdopplung.

Beispiel aus dem Unterricht (theoretisch):

- 3DES-Bruteforce-Zeit im Jahr 2000: 10.648 Stunden
- bei Verdopplung der Rechenleistung alle 20 Monate bis 2026: etwa 15,6 Verdopplungen
- neue Zeit grob: $\frac{10648}{2^{15.6}} \approx 0{,}21$ Stunden (ca. 13 Minuten)

Hinweis: Das ist eine grobe Modellrechnung fuer das Verstaendnis, keine reale Angriffsprognose.

## AP1/AP2 Lernfokus

- Unterschied symmetrisch vs. asymmetrisch sicher erklären können
- Hybrid-Verfahren in 3 Schritten beschreiben können
- Signatur und Verschlüsselung nicht verwechseln
- Hash-Funktion als Einwegfunktion definieren können
- einfache Bruteforce-Rechnungen mit $2^n$ und $2^{n-1}$ anwenden

## Mini-Check (Selbstkontrolle)

1. Warum nutzt TLS nicht nur asymmetrische Verschlüsselung?
2. Was beweist eine digitale Signatur und was nicht?
3. Wie viele Schlüssel braucht man bei 10 Teilnehmern in einem rein symmetrischen Netz?
4. Was passiert mit Bruteforce-Zeit, wenn die Schlüssellänge um 1 Bit steigt?

## Loesungen Mini-Check

1. Nur asymmetrisch waere zu langsam fuer grosse Datenmengen. TLS nutzt asymmetrisch fuer den sicheren Start und symmetrisch fuer schnelle Uebertragung.
2. Eine Signatur beweist Integritaet und Authentizitaet, aber keine Vertraulichkeit.
3. $\frac{10 \cdot 9}{2} = 45$ Schluessel.
4. Die benoetigte Bruteforce-Zeit verdoppelt sich ungefaehr.

