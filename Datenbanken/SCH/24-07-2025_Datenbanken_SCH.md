## Donnerstag, 24-07-2025_Datenbanken_SCH

### Fortsetzung der Datenbanken-Klasse vom 23.07.2025 (POG)

---

### 1) ERM-Regeln
- **ERM zwingend mit Raute!**  
  - Raute = stellt mit den Linien die Beziehung zwischen Entitäten dar  
  - Kardinalitäten: 1:1 / 1:n / n:m  
- **Keine Fremdschlüssel in n:m-Beziehungen** → immer auflösen!  
- **Adressen sind immer eigene Entitäten**  
  - Beispiel: Hausnummer, Straße, Postleitzahl, Stockwerk …  
- **Keine konkreten Bezeichnungen** (z. B. „Mathe“)  
  - Stattdessen: `lf_bezeichnung`, `stundenzahl`, `lf_id`, `raum`, `fachart`  
- **Sinnvolle Attribute zusätzlich zum PK** hinzufügen  

---

### 2) Primärschlüssel (PK)
- PK = **einzigartig (eineindeutig)**, kennzeichnet Zeile einer Entität  
- Pro Tabelle **genau ein PK**  
- `ID` kann man immer als PK verwenden  
- Falls Bezeichnungen in der Aufgabe schon definiert sind → **genau übernehmen**  
  - Beispiel: Wenn „Kursnummer“ gegeben ist → nicht zu „ID“ umbenennen  

---

### 3) Attribute & Entitäten
- Attribut = Merkmal oder Eigenschaft einer Entität → entspricht Spalte in Tabelle  
- Ein Attribut darf **nur eine Information** darstellen  
- Wenn ein Attribut mehrere Faktoren darstellen kann → **eigene Entität erstellen**  
  - Beispiel: „Anschrift“ → wird eigene Entität mit Straße, Hausnummer etc.  

---

### 4) Klausurhinweise
- Immer nur **eine eindeutige Lösung** angeben  
- ERM muss sauber mit Rauten und Kardinalitäten gezeichnet sein  
- Auf richtige Übernahme der Bezeichnungen aus der Aufgabe achten  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 24.07.2025 mit SCH.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 24.07.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
