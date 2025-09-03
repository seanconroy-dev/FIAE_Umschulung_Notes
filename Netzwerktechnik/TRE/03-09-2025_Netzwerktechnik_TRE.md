
## Mittwoch, 03-09-2025_Netzwerktechnik_TRE

### Switches
- **Unmanaged Switch**  
  - Plug & Play – sofort einsatzbereit, keine Konfiguration möglich.  
  - Typisch für Heimnetzwerke und kleine Büros.  

- **Managed Switch**  
  - Ermöglicht Konfiguration (z. B. VLANs, Port-Sicherheit, Monitoring).  
  - Wird in Unternehmensnetzwerken eingesetzt.  
  - Häufiges Feature: **Port Mirroring** → Kopieren des Datenverkehrs eines Ports auf einen anderen, z. B. für Analyse (Sniffer, IDS).  

---

### Höheneinheiten (HE)
- **HE = Höheneinheit** – Maßeinheit für Geräte in 19"-Racks.  
- **1 HE = 44,45 mm** Höhe.  
- Standard zur einheitlichen Montage von Switches, Routern, Servern.  
- Vorteil: vereinfachte Planung, Austauschbarkeit, Skalierbarkeit im Rechenzentrum.  

---

### Funktionsweise eines Switches
- Switch arbeitet auf **OSI-Schicht 2 (Data Link Layer)**.  
- Erkennt Geräte anhand ihrer **MAC-Adressen**.  
- Baut eine **MAC-Adresstabelle** auf: ordnet Ports den MAC-Adressen zu.  
- Leitet Datenpakete gezielt an den Ziel-Port weiter → effizienter als Hubs (die alles an alle senden).  
- Mit **Port Mirroring** können Daten gespiegelt und analysiert werden.  

👉 Praxis: Bei Analyse- oder Sniffing-Aufgaben wird oft die Bandbreite „runtergeschraubt“ (z. B. auf 10/100 Mbit/s), um Pakete stabil mitzuschneiden.  
👉 Kabel-Hinweis:  
- **nur 4 Adern genutzt** → max. 10/100 Mbit/s (alte Verkabelung, rote Kabel).  
- **alle 8 Adern genutzt** → bis zu 1 Gbit/s möglich.  

---

### Link Aggregation (Port-Bündelung)
- Mehrere physische Verbindungen werden zu **einem logischen Kanal** zusammengefasst.  
- Ziel: höhere Bandbreite + Redundanz.  
- Wichtig für Server, Core-Switches, Storage-Systeme.  
- Verhindert Engpässe auf einzelnen Leitungen.  

---

### Begriffe und Varianten
Alle Begriffe beziehen sich auf **Link Aggregation**, unterscheiden sich aber nach Hersteller oder Kontext.  

- **Link Aggregation (LA)**  
  - Allgemeiner Oberbegriff.  
  - IEEE-Standard: **802.1AX** (früher 802.3ad).  

- **LACP (Link Aggregation Control Protocol)**  
  - Teil des IEEE-Standards.  
  - Ermöglicht **dynamische** Bündelung von Links.  
  - Geräte handeln automatisch aus, welche Leitungen genutzt werden.  
  - Vorteil: einfache Konfiguration, automatische Ausfallsicherung.  

- **Bonding**  
  - Linux/Unix-Begriff.  
  - Mehrere Netzwerkschnittstellen werden zu einem Interface zusammengefasst (z. B. `bond0`).  
  - Typische Modi:  
    - **Round-Robin** (balance-rr) → Pakete reihum über alle Links.  
    - **Active-Backup** (active-backup) → ein aktiver Link, Rest als Failover.  
    - **Balance-xor** → Hash über Quell/Ziel-Adressen (SA/DA) verteilt Last.  
    - **802.3ad** → LACP-basierte Aggregation.  
    - **Balance-tlb/alb** → adaptive Lastverteilung ohne Switch-Unterstützung.  

- **EtherChannel**  
  - Cisco-Begriff für Link Aggregation.  
  - Statisch (PAgP aus, LACP aus) oder per **LACP** bzw. älter **PAgP**.  
  - Kompatibel zu IEEE-Standards, wenn LACP genutzt wird.  

- **Port Aggregation**  
  - Generischer Begriff, synonym zu Link Aggregation.  
  - Wird häufig in Herstellerdokumentation verwendet.  

- **Trunking**  
  - **Bedeutung 1: VLAN-Trunking** (802.1Q) → mehrere VLANs auf einer Leitung.  
  - **Bedeutung 2: Port-Trunking** → Synonym für Link Aggregation.  
  - Varianten, die dir begegnen können:  
    - **Adaptives Trunking** → passt sich automatisch aktiven Links an.  
    - **Dynamisches Trunking** → Ports erkennen selbst, ob sie einem Trunk beitreten sollen.  
    - **Load-Hash-Varianten**: **SA** (Source Address), **DA** (Destination Address), **SA-DA** kombiniert, teils inkl. L4-Ports für feineres Balancing.  

- **Teaming**  
  - Vor allem Windows-Server-Welt.  
  - Modi ähnlich wie Bonding: Load Balancing, Failover, LACP-Teams.  

---

### Diagramm: Link Aggregation
```
   +-------------+       ||       +-------------+
   |   Switch 1  |=======||=======|   Switch 2  |
   +-------------+       ||       +-------------+
        |  |             ||             |  |
        |  +---- LA ---- || ---- LA ----+  |
        |                ||                |
   (2x 1 Gbit/s Ports)   ||    (2x 1 Gbit/s Ports)
                         ||
                    ==============
                      2 Gbit/s logischer Kanal
```

---

### Wichtige Hinweise
- **Balance und Failover**  
  - Last wird auf mehrere Links verteilt.  
  - Fällt ein Link aus, übernehmen die verbleibenden Links.  

- **Voraussetzungen**  
  - Beide Endgeräte (Switch ↔ Switch oder Switch ↔ Server) müssen Link Aggregation unterstützen.  
  - Gleiche Geschwindigkeit und Duplex-Einstellungen an allen beteiligten Ports.  
  - Bei LACP: identische LACP-Parameter auf beiden Seiten.  

- **Einsatzgebiete**  
  - Backbone-Verbindungen zwischen Switches.  
  - Server mit hohem Datendurchsatz.  
  - Storage-Systeme (SAN/NAS).  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 03.09.2025 mit TRE.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 03.09.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift und Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>

