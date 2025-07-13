### 11.07.2025_Webentwicklung/KLU

Projekt: HTML-Grundlagen & CSS-Grid

# Grid-Grundlagen

- **Grid (Rasterlinie)**: CSS-Modul zur flexiblen Layout-Gestaltung moderner Webseiten
- Ein Layout wird in **Zeilen und Spalten** aufgeteilt
- **Gridarea**: Ein zugewiesener Bereich (z. B. `header`, `main`, `sidebar`)
- Grid-Container können **verschachtelt** werden – wichtig für komplexe Layouts
- **Responsives Verhalten** durch Grid möglich
- Reihenfolge: Erst **HTML-Struktur**, danach mit **CSS** gestalten

**Beispiel für Grid-Definition (CSS):**

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
```

# HTML-Grundgerüst

| Befehl / Tag                | Funktion                                |
| --------------------------- | --------------------------------------- |
| `! + Tab`                   | Standard-HTML5-Vorlage einfügen (Emmet) |
| `<html lang="de">`          | Sprache auf Deutsch festlegen           |
| `<meta charset="UTF-8">`    | Zeichensatz für Umlaute etc.            |
| `<meta name="viewport"...>` | Responsives Verhalten für Mobilgeräte   |
| `<title>…</title>`          | Titel im Browser-Tab                    |

**Hinweise:**

- Dezimalzeichen: Amerikanisch = Punkt `.` statt Komma `,`
- Apache Server ist **case-sensitiv** – keine Leerzeichen oder Umlaute im Dateinamen!
- Dateinamen: Nur Kleinbuchstaben & Unterstriche (`_`) verwenden

# CSS-Handling & Formatierung

| Begriff / Tastenkürzel | Bedeutung                                         |
| ---------------------- | ------------------------------------------------- |
| `Alt + Z`              | Zeilenumbruch aktivieren (VS Code)                |
| `Tab`                  | Einrückung von CSS- und HTML-Blockelementen       |
| `div*12 + Tab`         | Erstellt 12 `div`s (mit Emmet)                    |
| `wrapper`              | Containerelement zur Strukturierung               |
| `margin` / `padding`   | Außen-/Innenabstand von Elementen                 |
| `auto`                 | Automatische Zentrierung (z. B. `margin: 0 auto`) |
| `id`                   | Nur einmal pro HTML-Dokument erlaubt              |
| `/* Kommentar */`      | CSS-Kommentar                                     |
| `width: 960px`         | Kein Leerzeichen zwischen Zahl & Einheit          |

# Selektoren & Struktur

- CSS-Zuweisung über Selektoren:
  - `#elementID {}` – für IDs
  - `.klasse {}` – für Klassen
- Strukturierung erfolgt über **geschweifte Klammern `{}`**
- **Grid funktioniert nur**, wenn das übergeordnete Element ein Grid ist
- IDs sind eindeutig, Klassen mehrfach nutzbar

# Allgemeine Hinweise zur Webentwicklung

- Ausgangsposition von HTML-Elementen: **oben links**
- Mobile First! – Die Mehrheit der Nutzer (80 %) surft mobil
- Bilder sollten **nachträglich** eingefügt werden, nicht am Anfang

# Bonus: Emmet-Cheatsheet (VS Code)

| Emmet-Ausdruck             | Resultat (nach `Tab`)        |
| -------------------------- | ---------------------------- |
| `!`                        | HTML5-Grundgerüst            |
| `ul>li*5`                  | Liste mit 5 Einträgen        |
| `div.container>div.item*3` | Verschachteltes Grid-Layout  |
| `section#main>h1.title+p`  | Abschnitt mit Titel und Text |

---

---

Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck. Diese Notizen sind öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und für Dritte zur Orientierung.

**Unterricht bei:** KLU (BFW Mühlenbeck, FIAE Umschulung)  
**Quelle:** Eigene Mitschrift vom 11.07.2025  
**Autor:** Sean Conroy  
**Lizenz:** CC BY-NC-SA 4.0
