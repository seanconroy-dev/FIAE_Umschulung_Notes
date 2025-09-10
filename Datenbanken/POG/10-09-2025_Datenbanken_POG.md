## Mittwoch, 10-09-2025_Datenbanken_POG

#### Aufgabe

Zeichnen Sie ein vollständiges ER-Diagramm mit allen Entitäten, Primärschlüsseln, 2 sinnvollen Attributen pro Entität und den Beziehungen mit Kardinalitäten.

- In einem Carsharing-System wird jeder Kunde eindeutig durch einen Führerschein identifiziert. Jeder Kunde hat dabei genau einen Führerschein, und jeder Führerschein ist genau einem Kunden zugeordnet.
- Kunden können im Laufe der Zeit verschiedene Fahrzeuge nutzen, und umgekehrt werden Fahrzeuge von unterschiedlichen Kunden gefahren.
- Die Fahrzeuge können an verschiedenen Ladestationen geladen werden, während jede Station wiederum von zahlreichen Fahrzeugen genutzt wird.
- Für die Nutzung der Dienste erhält jeder Kunde regelmäßig Rechnungen. Jede Rechnung ist einem bestimmten Kunden zugeordnet.
- Jedes Fahrzeug ist außerdem an einen bestimmten Tarif gebunden. Ein Tarif kann dabei für mehrere Fahrzeuge gelten.

#### Meine Lösung

**Entitäten und Attribute**

Kunde  
- K_ID (PK)  
- Adresse  
- FührerscheinNr

Fahrzeug  
- F_ID (PK)  
- ZulassungsNr  
- Typ

Rechnung  
- R_ID (PK)  
- Datum  
- Betrag

Tarif  
- T_ID (PK)  
- TarifName  
- Preis

Ladestation  
- L_ID (PK)  
- Ort/Adresse  
- Leistung

**Beziehungen und Kardinalitäten**

- Kunde — (1:1) — FührerscheinNr (als Attribut integriert)
- Kunde — (1:n) — Rechnung  
  (Jeder Kunde erhält viele Rechnungen, jede Rechnung gehört genau zu einem Kunden.)
- Kunde — (m:n) — Fahrzeug  
  (Ein Kunde kann verschiedene Fahrzeuge nutzen, Fahrzeuge können von mehreren Kunden genutzt werden.)
- Fahrzeug — (m:n) — Ladestation  
  (Ein Fahrzeug kann an mehreren Ladestationen laden, jede Ladestation wird von vielen Fahrzeugen genutzt.)
- Fahrzeug — (n:1) — Tarif  
  (Jedes Fahrzeug hat genau einen Tarif, ein Tarif gilt für mehrere Fahrzeuge.)

---

### Aufgabe 2

Erstellen Sie auf Grundlage dieser Beschreibung ein vollständiges Entity-Relationship-Modell. Achten Sie darauf, die Kardinalitäten korrekt darzustellen und alle Entitäten mit 2 sinnvollen Attributen zu versehen.

- In einem Musik-Streaming-Dienst registrieren sich Kunden, um auf eine große Auswahl an Liedern zuzugreifen. Jeder Kunde besitzt dabei genau ein Abonnement, und jedes Abonnement ist genau einem Kunden zugeordnet.
- Kunden hören über die Zeit viele verschiedene Lieder, und Lieder können von zahlreichen Kunden abgespielt werden.
- Die Lieder werden jeweils von bestimmten Künstlern erstellt. Ein Künstler kann mehrere Lieder veröffentlichen.
- Zusätzlich können Lieder in Playlists gesammelt werden. Eine Playlist enthält viele verschiedene Lieder, und ein Lied kann in vielen Playlists vorkommen.
- Für die Abrechnung erhält jeder Kunde regelmäßig Rechnungen, die eindeutig einem Kunden zugeordnet sind.
- Jedes Abonnement ist zudem einem bestimmten Tarif zugeordnet. Ein Tarif kann dabei für mehrere Abonnements gelten.

#### Meine Lösung

**Entitäten und Attribute**

Kunde  
- K_ID (PK)  
- Name  
- Adresse

Abonnement  
- A_ID (PK)  
- A_Name  
- Startdatum

Rechnung  
- R_ID (PK)  
- Datum  
- Betrag

Tarif  
- T_ID (PK)  
- T_Name  
- T_Preis

Lied  
- L_ID (PK)  
- Titel  
- Dauer

Künstler  
- KUE_ID (PK)  
- Name  
- Genre

Playlist  
- P_ID (PK)  
- P_Name  
- Erstellungsdatum

**Beziehungen und Kardinalitäten**

- Kunde — (1:1) — Abonnement  
  (Jeder Kunde hat genau ein Abonnement, jedes Abonnement gehört zu genau einem Kunden.)
- Kunde — (1:n) — Rechnung  
  (Jeder Kunde erhält mehrere Rechnungen, jede Rechnung gehört zu genau einem Kunden.)
- Abonnement — (n:1) — Tarif  
  (Jedes Abonnement hat genau einen Tarif, ein Tarif kann mehrere Abonnements haben.)
- Kunde — (m:n) — Lied  
  (Kunden hören viele Lieder, Lieder werden von vielen Kunden gehört.)
- Lied — (n:1) — Künstler  
  (Jedes Lied stammt von genau einem Künstler, ein Künstler veröffentlicht viele Lieder.)
- Lied — (m:n) — Playlist  
  (Ein Lied kann in mehreren Playlists vorkommen, eine Playlist enthält viele Lieder.)

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 10.09.2025 mit POG.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 10.09.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
