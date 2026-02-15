---
title: "Einführung in Android Studio"
date: 2026-01-30
weekday: "Freitag"
subject: "Programmierung"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Android Grundlagen"
topic: "Android Studio, Ressourcen, Projektstruktur"
level: "Grundlagen"
tags:
  - Android
  - Android Studio
  - JSON
  - Ressourcen
  - strings.xml
  - colors.xml
  - Gradle
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Einführung in Android Studio – 2026-01-30 (ASS)

## Android Studio

Android Studio ist die offizielle Entwicklungsumgebung (IDE) für Android-App-Entwicklung.  
Sie basiert auf IntelliJ IDEA und bietet alle Werkzeuge für Planung, Entwicklung, Test und Debugging.

---

## Zentrale Bestandteile

- Code-Editor (Java / Kotlin)
- Layout-Editor (grafisch und XML-basiert)
- Emulator (virtuelle Android-Geräte)
- Build-System (Gradle)
- Debugging- und Analyse-Tools

---

# Daten- und Austauschformate

## JSON (JavaScript Object Notation)

- Leichtgewichtiges, textbasiertes Datenformat
- Häufig genutzt für REST-APIs
- Gut lesbar für Mensch und Maschine
- Besteht aus Schlüssel-Wert-Paaren, Arrays und Objekten

Beispiel:
~~~json
{
  "name": "Sean",
  "kurs": "FIAE",
  "jahr": 2026
}
~~~

---

# Ressourcen in Android

In Android werden Texte und Farben nicht direkt im Layout hardcodiert,  
sondern zentral in Resource-Dateien ausgelagert.

Ziele:
- Bessere Wartbarkeit
- Wiederverwendbarkeit
- Internationalisierung (Mehrsprachigkeit)
- Klare Trennung von Design und Logik

---

## Strings auslagern (`strings.xml`)

- Zentrale Verwaltung aller Texte
- Vorbereitung für Lokalisierung (z. B. Deutsch / Englisch)
- Einheitliche Nutzung im gesamten Projekt

Beispiel:
~~~xml
<resources>
    <string name="app_name">Meine App</string>
    <string name="welcome_text">Willkommen</string>
</resources>
~~~

Verwendung im Layout:
~~~xml
android:text="@string/welcome_text"
~~~

---

## Farben auslagern (`colors.xml`)

- Einheitliches Design
- Einfaches Anpassen des Farbschemas
- Trennung von Layout und Gestaltung

Beispiel:
~~~xml
<resources>
    <color name="primaryColor">#6200EE</color>
    <color name="secondaryColor">#03DAC5</color>
</resources>
~~~

Verwendung im Layout:
~~~xml
android:textColor="@color/primaryColor"
~~~

---

# Ordnerstruktur (vereinfacht)

~~~
app/
 └─ src/
    └─ main/
       ├─ java/                → Kotlin/Java-Code
       ├─ res/
       │  ├─ layout/           → XML-Layouts
       │  ├─ values/
       │  │  ├─ strings.xml    → Texte
       │  │  ├─ colors.xml     → Farben
       │  │  ├─ themes.xml     → App-Design
       │  ├─ drawable/         → Bilder & Vektorgrafiken
       │  └─ mipmap/           → App-Icons
       └─ AndroidManifest.xml  → App-Konfiguration
~~~

---

# Prüfungsrelevante Merksätze

- Keine Texte direkt im Layout definieren
- Farben immer als Resource speichern
- `@string/...` für Texte
- `@color/...` für Farben
