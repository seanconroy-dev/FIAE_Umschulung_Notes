
## Mittwoch, 10-09-2025_NetzwerkTechnik_TRE

### Spanning Tree Protocol (STP / RSTP)

- **MAC-Adresse**
  - Beispiel: `11-11-11-11-11-11`  
  - Aufbau: **Herstellerkennung | Gerätenummer**  
  - Kurzform: manchmal nur ein Teil zur Darstellung, z. B. `11-11`

- **Root-Bridge**
  - Der Switch mit der **kleinsten Bridge-ID** wird Root-Bridge.  
  - Bridge-ID = Priorität + MAC-Adresse  
  - Wenn alle Prioritäten gleich sind → entscheidet die **kleinste MAC-Adresse**.  
  - Achtung: Die Aussage „je niedriger die MAC-Adresse, desto älter“ ist **nicht korrekt**.  
    - Niedrige MAC = kein Alter, sondern zufällige Hersteller-Zuteilung.  
    - Wichtig für STP: nur zum Bestimmen der Root-Bridge.

- **Automatismus**
  - STP deaktiviert automatisch bestimmte Ports, um **Schleifen (Loops)** zu verhindern.  
  - Dadurch wird aus einem Ring eine **logische Baumstruktur**.  

#### Beispiel Ring → Baum

```
Vorher (Loop):                  Nachher (STP deaktiviert eine Verbindung):

   [S1]──[S2]──[S3]                 [S1]──[S2]──[S3]
     │           |       →             │
    [S4]---------|                    [S4]
```

- STP macht aus dem Ring eine Kette (Baum).
- Der „ausgeschaltete“ Port bleibt als Backup für Redundanz bestehen.

---

### Kostenberechnung (Path Cost)

- Die **Kosten** bestimmen, welcher Pfad bevorzugt wird.  
- Faustformel (STP-Standard):

```
Kosten = 20.000.000 / (Bandbreite in Mbit/s)
```

- **Beispiele (Standardwerte)**:  
  - 10 Mbit/s → 2.000.000  
  - 100 Mbit/s → 200.000  
  - 1 Gbit/s → 20.000  
  - 10 Gbit/s → 2.000  
  - 100 Gbit/s → 200  
  - 1 Tbit/s → 20  

- **Hinweis:** Deine Notizen mit „100 STP, 19 STP …“ waren nicht ganz korrekt.  
  → Ich habe sie mit den offiziellen IEEE-Standardwerten ersetzt.  

---

### Beispielrechnung

- 4 Switches mit Verbindungen:  
  - 3 × 1 Gbit/s  
  - 1 × 100 Mbit/s  
- Es entsteht ein Loop.  
- **Gesamtkosten** (vereinfacht): 260.000  
- Lösung: STP blockiert den 100-Mbit/s-Link.  
- Ergebnis: Aus dem Ring wird eine Kette (Bus) → keine Schleife mehr.

---

### Redundanz

- Netzwerke brauchen **Redundanz**, um bei Ausfall einer Verbindung Alternativpfade zu haben.  
- STP hält blockierte Ports in Reserve:  
  - Fällt ein aktiver Pfad aus → aktiviert STP den blockierten Port.  
- Beispiel: Cloud-Umgebungen benötigen hohe Redundanz für Ausfallsicherheit.

---

### Power over Ethernet (PoE)

- **Definition**: Daten + Strom laufen über dasselbe Ethernet-Kabel.  
- **Einsatzgebiete**: IP-Kameras, Access Points, IP-Telefone.  
- **Beispiel**:  
  - Webcam → Switch (PoE-Switch liefert gleichzeitig Stromversorgung).  
- Vorteil: kein separates Netzteil notwendig.

#### PoE-Skizze

```
 [Switch mit PoE]───(Daten + Strom über LAN-Kabel)───[IP-Kamera]
       │
       │ 230 V Netzstrom (Einspeisung für Switch)
       │
   [Stromnetz]
```

---

### Elektrotechnik-Grundlagen (Wiederholung)

- **Kondensator / Blindwiderstand**  
  - Formel-Beispiel: `Xc = 1 / (2π f C)`  
  - (Die Notiz `x²c = 1/z*...f` war fehlerhaft → hier die richtige Formel)  
- **Leistung**  
  - `P = U * I`  
  - Leistung = Spannung × Strom  
- **Wechselspannung**  
  - Relevanz bei Stromversorgung, Netztechnik, PoE.

---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 10.09.2025 mit TRE.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 10.09.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>

