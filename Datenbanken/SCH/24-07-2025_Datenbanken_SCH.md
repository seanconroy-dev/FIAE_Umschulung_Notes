---
title: "ERM-Regeln und Klausurhinweise"
date: 2025-07-24
weekday: "Donnerstag"
subject: "Datenbanken"
instructor: "SCH"
program: "FIAE Umschulung 2025-2027"
module: "ER-Modell"
topic: "ERM-Regeln & Primärschlüssel"
level: "Grundlagen"
tags:
  - Datenbanken
  - ER-Modell
  - Primärschlüssel
  - Kardinalitäten
  - Klausurvorbereitung
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-07-24_Datenbanken_SCH

### Fortsetzung der Datenbanken-Klasse vom 23.07.2025 (POG)

---

## 1) ERM-Regeln

- **ERM zwingend mit Raute!**  
  - Raute = stellt mit den Linien die Beziehung zwischen Entitäten dar  
  - Kardinalitäten: 1:1 / 1:n / n:m  

- **Keine Fremdschlüssel in n:m-Beziehungen**  
  → n:m immer über eine Zwischentabelle auflösen  

- **Adressen sind immer eigene Entitäten**  
  - Beispielattribute: Straße, Hausnummer, Postleitzahl, Ort, Stockwerk  

- **Keine konkreten Bezeichnungen** (z. B. „Mathe“)  
  - Stattdessen generische Attributnamen verwenden:  
    `lf_bezeichnung`, `stundenzahl`, `lf_id`, `raum`, `fachart`  

- **Sinnvolle Attribute zusätzlich zum PK** hinzufügen  

---

## 2) Primärschlüssel (PK)

- PK = **eindeutige Identifikation** einer Zeile  
- Pro Tabelle **genau ein Primärschlüssel**  
- `ID` kann grundsätzlich als PK verwendet werden  
- Falls Bezeichnungen in der Aufgabe vorgegeben sind → **genau übernehmen**  
  - Beispiel: „Kursnummer“ darf nicht in „ID“ umbenannt werden  

---

## 3) Attribute & Entitäten

- Attribut = Merkmal einer Entität → entspricht einer Tabellenspalte  
- Ein Attribut darf **nur eine Information** enthalten  
- Wenn ein Attribut mehrere Informationen beinhaltet → eigene Entität bilden  
  - Beispiel: „Anschrift“ → separate Entität mit Straße, Hausnummer etc.  

---

## 4) Klausurhinweise

- Nur **eine konsistente Lösung** darstellen  
- ERM sauber mit:
  - Rauten
  - Linien
  - Kardinalitäten  
- Bezeichnungen exakt aus der Aufgabenstellung übernehmen  
- Primärschlüssel klar kennzeichnen  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 24.07.2025 mit SCH.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 24.07.2025.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
