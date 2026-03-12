---
title: "PowerShell ISE & Automatisierung in Windows"
date: 2025-07-21
weekday: "Montag"
subject: "Betriebssysteme"
instructor: "SLE"
program: "FIAE Umschulung 2025-2027"
module: "Scripting & Automatisierung"
topic: "PowerShell ISE"
level: "Grundlagen"
tags:
  - PowerShell
  - Automatisierung
  - Windows
  - Cmdlets
  - ExecutionPolicy
  - Scripting
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Montag, 2025-07-21_Betriebssysteme_Schlegel

## PowerShell ISE & Automatisierung in Windows

## PowerShell ISE – Einführung

ISE = *Integrated Scripting Environment*  
PowerShell ISE ist **nicht case-sensitiv** (Groß-/Kleinschreibung spielt keine Rolle).  
Skriptdateien enden auf `.ps1`.

- **Cmdlet** = Befehl in PowerShell  
- Schreibweise: `Verb-Nomen`  
- Erlaubtes Sonderzeichen im Namen: `_` (Unterstrich)  
- `=` ist der **Zuweisungsoperator**  
- `$` leitet eine **Variable** ein  
- `` ` `` (Backtick) vor `$` gibt das Zeichen als **Literal** aus  
- `'Text'` → wird **nicht interpretiert**  
- `"Text"` → Variablen werden **interpretiert**  
- Farben z. B.: `-ForegroundColor Green`  

---

## PowerShell ISE Bereiche

### Konsolenbereich

- Ausführen mit **Enter**
- Beispiel:

```powershell
Get-Date
```

### Skriptbereich

- Ausführen mit **Play-Button** oder **F5**
- Beispiel:

```powershell
Clear-Host
```

---

## Einfache Beispiele

```powershell
$begruessung = "Hello"
Write-Host "$begruessung World"

$eingabe = Read-Host "Bitte geben Sie Ihren Namen ein"
Write-Host "$eingabe Heute ist der $(Get-Date -Format 'dd.MM.yyyy')"
```

---

## Kommentare

- Einzeilig:  
  `# Dies ist ein Kommentar`

- Mehrzeilig:

```powershell
<#
 Mehrzeiliger Kommentar
 Datum: 21.07.2025
 Autor: Conroy
 Thema: Einführung in PowerShell
#>
```

---

## Ausführungsrichtlinien (Execution Policy)

- **Abfrage:**

```powershell
Get-ExecutionPolicy
```

- **Setzen:**

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

**Stufen (Beispiele):**

- `Bypass` – keine Einschränkungen  
- `Restricted` – keine Skriptausführung  
- `RemoteSigned` – lokale Skripte erlaubt, heruntergeladene müssen signiert sein  
- `AllSigned` – alle Skripte müssen signiert sein  

---

## Hinweise zu Skriptsprachen unter Windows

- Skriptsprachen sind **Interpretersprachen** (werden zur Laufzeit interpretiert).  
- Änderungen wirken sich direkt auf das System aus → Vorsicht bei administrativen Skripten.  
- Unterschied zwischen 32-Bit (x86) und 64-Bit Version beachten.  

---

## Weitere Hinweise

- `Clear-Host` oder `cls` → Konsole löschen  
- Viele Cmdlets besitzen Aliase  
- PowerShell ISE als **Administrator** starten:  
  Rechtsklick → „Als Administrator ausführen“  
- Unterschied Rückgabe vs. Ausgabe:  
  - `Write-Host` → reine Ausgabe auf dem Bildschirm  
  - Rückgabewerte können in Variablen gespeichert und weiterverarbeitet werden  

---

## Beispiel zur Maskierung von Variablen

```powershell
Write-Host "$begruessung `$test Mars" -ForegroundColor Red
```

---

## Eingabe

```powershell
$eingabe = Read-Host "Geben Sie Ihren Namen ein:"
```

---

## Tastenkürzel

- **F5** → Skript ausführen  


