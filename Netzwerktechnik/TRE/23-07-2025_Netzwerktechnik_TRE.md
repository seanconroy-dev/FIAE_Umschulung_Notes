```markdown
## Mittwoch, 23-07-2025_Netzwerktechnik_TRE

### Sniffer installieren
- Cmdlet in PowerShell, um die **reale IP-Adresse** abzufragen:  
```pwsh
Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'
```

---

### OSI-Modell – Review
- **Schicht 0**: Übertragungsmedien (Kabel, LWL, WLAN)  

---

### Zugriffsverfahren & Kollisionen
- **Collision Detection (CD)** → Erkennung von Kollisionen im Netzwerk  
- **Jam Signal** → Meldung einer erkannten Kollision an alle Teilnehmer  
- **Backoff-Strategie** → z. B. 1 von 2 Runden Wartezeit, bevor erneut gesendet wird  
- **CSMA (Carrier Sense Multiple Access)**  
  - **CSMA/CD** → Collision Detection  
  - **CSMA/CA** → Collision Avoidance (Kollisionsvermeidung)  

Quelle: [Wikipedia – CSMA/CD](https://de.wikipedia.org/wiki/Carrier_Sense_Multiple_Access/Collision_Detection)

---

### Topologien & Komponenten
- **Bus-Topologie**  
  - Historisch verbreitet, heute kaum noch genutzt  
  - Benötigt **Terminatoren** an den Enden des Busses, um Signalreflexionen zu verhindern  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 23.07.2025 mit TRE.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 23.07.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
```
