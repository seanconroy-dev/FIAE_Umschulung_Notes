## Dienstag, 09-09-2025_Programiertechnik_WED

THEMA: Altersabfrage mit if-else

ZIEL
- Ein Programm ordnet eine Person anhand ihres Alters einer Kategorie zu:
  - Kind: bis 14 Jahre
  - Teen: ab 14 bis 18 Jahre
  - Erwachsener: ab 18 Jahre
  - Rentner: ab 66 Jahre
- Ausgabe als Klartext, z. B. "Du bist Teenager."

REGELN UND GRENZEN
- Kind: alter <= 14
- Teen: 14 < alter < 18   (laut Aufgabenformulierung: ab 14 bis 18, in der Praxis muss 14 exakt entschieden werden)
- Erwachsener: alter >= 18 und alter < 66
- Rentner: alter >= 66
- Wichtig: Entscheide inklusiv oder exklusiv pro Grenze und bleib konsistent. Für die gegebene Aufgabe gilt:
  - 14 gehört zu Teen oder Kind, je nach Auslegung. Ein sauberer, eindeutiger Ansatz ist:
    - Kind: alter <= 13
    - Teen: 14 <= alter <= 17
    - Erwachsener: 18 <= alter <= 65
    - Rentner: alter >= 66
  - Diese Variante beseitigt Überschneidungen und Kantenkonflikte.

ENTSCHEIDUNGSLOGIK IN WORTEN
- Prüfe von klein nach groß, damit früh enge Bereiche greifen:
  - Wenn alter <= 13 dann Kind
  - Sonst wenn alter <= 17 dann Teen
  - Sonst wenn alter <= 65 dann Erwachsener
  - Sonst Rentner

WARUM if-else STATT MEHRERER if
- if-else-Ketten stoppen nach dem ersten Treffer. Das verhindert doppelte Ausgaben.
- Mehrere unabhängige ifs prüfen jede Bedingung. Das kann zu mehreren Treffern führen. Beispiel: alter = 70 erfüllt ">= 18" und ">= 66".
- Wenn sich Bereiche ausschließen sollen, nutze eine Kette.

EINGABEVALIDIERUNG
- Negative Werte oder unrealistische Eingaben abfangen.
- Beispiel in Worten:
  - Wenn alter < 0 oder alter > 130 dann "Ungültige Eingabe".
- Optional: Eingabewiederholung bis gültig.

PSEUDOCODE (TEXTBESCHREIBUNG)
- Lese eine Ganzzahl alter ein.
- Wenn alter < 0 oder alter > 130 dann gib Fehlermeldung aus und beende.
- Wenn alter <= 13 dann "Kind" ausgeben.
- Sonst wenn alter <= 17 dann "Teen" ausgeben.
- Sonst wenn alter <= 65 dann "Erwachsener" ausgeben.
- Sonst "Rentner" ausgeben.

TESTMATRIX
- 0  -> Kind
- 10 -> Kind
- 13 -> Kind
- 14 -> Teen
- 17 -> Teen
- 18 -> Erwachsener
- 30 -> Erwachsener
- 65 -> Erwachsener
- 66 -> Rentner
- 99 -> Rentner
- -1 -> Ungültig
- 131 -> Ungültig

TYPISCHE FEHLER
- Überlappende Bedingungen, z. B. "alter >= 18" vor "alter >= 66" ohne else-if, führt zu doppelten Treffern.
- Unklare Grenzwerte, z. B. nicht festgelegt, ob 14 Kind oder Teen ist.
- Falsche Reihenfolge der Prüfungen. Immer vom engsten zum weitesten Bereich.
- Keine Validierung der Eingabe, führt zu Unsinnswerten.
- Strings statt Zahlen einlesen oder Dezimalwerte ohne Bedürfnis. Für dieses Problem reicht int.

FACHBEGRIFFE
- Kontrollstruktur: steuert den Ablauf, z. B. if-else, switch.
- Bedingung: Ausdruck, der wahr oder falsch ist.
- Bereichsprüfung: teste, ob eine Zahl in einem Intervall liegt, z. B. 14 bis 17.
- Exklusiv vs. Inklusiv: "<" schließt die Grenze aus, "<=" schließt sie ein.

ENTSCHEIDUNGSBAUM ALS ASCII
- Start
  - alter < 0 oder alter > 130 -> Ungültig
  - sonst alter <= 13 -> Kind
  - sonst alter <= 17 -> Teen
  - sonst alter <= 65 -> Erwachsener
  - sonst -> Rentner

ÜBUNGSVARIANTEN ZUR VERTIEFUNG
- Variante 1 Eingabevalidierung: Solange eingeben lassen, bis ein gültiges Alter kommt.
- Variante 2 Auslagerung in Methode: Schreibe eine Methode, die die Kategorie als Text zurückgibt. Vorteil: testbar, wiederverwendbar.
- Variante 3 Internationalisierung: Kategorienamen als Parameter oder in einer Map halten, später für Deutsch und Englisch.
- Variante 4 Grenzwerte konfigurierbar: Grenzen als Konstanten definieren und zentral ändern.
- Variante 5 Vergleich mit mehreren if: Bewusst mehrere ifs verwenden und die doppelte Ausgabe beobachten, um den Unterschied zu fühlen.
- Variante 6 Erweiterung: Füge Zwischenkategorien hinzu, z. B. Vorschulkind, Senior 80 plus. Achte auf lückenlose und überschneidungsfreie Bereiche.

DENKREGELN FÜR BEREICHE
- Schreibe Intervalle lückenlos und ohne Überlappung.
- Bestimme erst Grenzen, dann entscheide pro Grenze ob inklusiv oder exklusiv.
- Ordne die Prüfungen so, dass enge Bereiche zuerst kommen und breite Bereiche später, oder nutze klare Obergrenzenkaskaden wie oben.

KURZE CHECKLISTE FÜR SPÄTER
- Grenzen sauber festgelegt
- Reihenfolge eng zu breit
- if-else statt mehrere if
- Eingabe validieren
- Testmatrix mit Kantenwerten ausführen
- Optional: Logik in Methode auslagern

BEISPIELAUSGABE IN WORTEN
- Eingabe: 17
- Ausgabe: Du bist Teenager.

---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025â€“2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 09.09.2025 mit WED.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergÃ¤nzenden Uebungsbeispielen vom 09.09.2025.<br><br>
Die Version wurde inhaltlich Ã¼berarbeitet, strukturell optimiert und technisch ergÃ¤nzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>