chcp 65001 | Out-Null
Set-StrictMode -Version Latest

# ----------------------------
# Canon (LONG names only)
# ----------------------------
$CanonSubjects = @(
    "Betriebssysteme",
    "Datenbanken",
    "Digitaltechnik",
    "IoT-Netzwerktechnik",
    "Netzwerktechnik",
    "Programmiertechnik",
    "Systemtechnik",
    "Telekommunikation",
    "Webentwicklung",
    "WiSo"
)

# Aliases -> ALWAYS map to LONG names
$SubjectAliases = @{
    "bs"="Betriebssysteme"
    "betriebssysteme"="Betriebssysteme"

    "pt"="Programmiertechnik"
    "programmiertechnik"="Programmiertechnik"

    "st"="Systemtechnik"
    "systemtechnik"="Systemtechnik"

    "db"="Datenbanken"
    "db/wit"="Datenbanken"
    "datenbank"="Datenbanken"
    "sql"="Datenbanken"

    "dt"="Digitaltechnik"
    "dt/pas"="Digitaltechnik"

    "nt"="Netzwerktechnik"
    "nt/tre"="Netzwerktechnik"

    "tk"="Telekommunikation"

    "web"="Webentwicklung"

    "wiso"="WiSo"
}

function Normalize-Subject {
    param([string]$Input)
    $raw = ($Input ?? "").Trim()
    if ([string]::IsNullOrWhiteSpace($raw)) { return "" }
    $k = $raw.ToLowerInvariant()
    if ($SubjectAliases.ContainsKey($k)) { return $SubjectAliases[$k] }

    foreach ($c in $CanonSubjects) {
        if ($c.ToLowerInvariant() -eq $k) { return $c }
    }
    return $raw
}

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
    }
}

function Confirm-NewFolder {
    param(
        [string]$FolderPath,
        [string]$Label,
        [string]$DefaultName
    )
    if (Test-Path -LiteralPath $FolderPath) { return $true }

    Write-Host ""
    Write-Host "⚠️ $Label-Ordner existiert nicht: $FolderPath"
    $choice = Read-Host "Neu anlegen? [J]a / [N]ein (dann Default '$DefaultName' nutzen)"
    return ($choice.Trim().ToUpperInvariant() -eq "J")
}

function Slugify {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return "note" }
    $t = $Text.Trim().ToLowerInvariant()
    $t = $t -replace "ä","ae" -replace "ö","oe" -replace "ü","ue" -replace "ß","ss"
    $t = $t -replace "[^a-z0-9]+","-"
    $t = $t -replace "^-+","" -replace "-+$",""
    $t = $t -replace "-{2,}","-"
    if ([string]::IsNullOrWhiteSpace($t)) { return "note" }
    return $t
}

# ----------------------------
# 1) Dynamisches Laufwerk finden (D: oder E:)
# ----------------------------
$possibleDrives = @("D:", "E:")
$baseFolder = $null

foreach ($drive in $possibleDrives) {
    $pathCheck = Join-Path $drive "FIAE_Umschulung_Notes"
    if (Test-Path -LiteralPath $pathCheck) { $baseFolder = $pathCheck; break }
}

if (-not $baseFolder) {
    Write-Host "❌ FIAE_Umschulung_Notes wurde auf keinem bekannten Laufwerk gefunden (D: oder E:)."
    exit 1
}

$baseFolderResolved = (Resolve-Path -LiteralPath $baseFolder).Path
Write-Host "📁 BaseFolder gefunden: $baseFolderResolved"

# ----------------------------
# 1b) NEW folder structure root: "... \notes" (lowercase; Linux-safe)
# ----------------------------
$notesRootName = "notes"  # IMPORTANT: must match repo folder name exactly on Linux
$notesRoot = Join-Path $baseFolder $notesRootName

if (-not (Test-Path -LiteralPath $notesRoot)) {
    Write-Host "❌ Unterordner '$notesRootName' nicht gefunden: $notesRoot"
    exit 1
}

$notesRootResolved = (Resolve-Path -LiteralPath $notesRoot).Path
Write-Host "📁 Notes-Root gefunden: $notesRootResolved"

# ----------------------------
# 2) Inputs (with normalization + folder safety)
# ----------------------------
$defaultSubject = "Programmiertechnik"
$defaultDozent  = "ASS"

# Compute year ONCE (avoid duplicates)
$yearFolder = Get-Date -Format "yyyy"

while ($true) {
    $SubjectRaw = Read-Host "Fach (z.B. PT, ST, BS, Datenbanken)"
    $SubjectCandidate = Normalize-Subject $SubjectRaw
    if ([string]::IsNullOrWhiteSpace($SubjectCandidate)) { continue }

    # NEW structure: notes\<Year>\<Subject>
    $subjectPath = Join-Path (Join-Path $notesRoot $yearFolder) $SubjectCandidate

    if (-not (Test-Path -LiteralPath $subjectPath)) {
        $ok = Confirm-NewFolder -FolderPath $subjectPath -Label "Fach" -DefaultName $defaultSubject
        if ($ok) {
            Ensure-Dir $subjectPath
            $Subject = $SubjectCandidate
            break
        } else {
            $Subject = $defaultSubject
            Ensure-Dir (Join-Path (Join-Path $notesRoot $yearFolder) $Subject)
            break
        }
    } else {
        $Subject = $SubjectCandidate
        break
    }
}

while ($true) {
    $DozentRaw = Read-Host "Kuerzel (z.B. POG) (Enter = $defaultDozent)"
    if ([string]::IsNullOrWhiteSpace($DozentRaw)) { $DozentRaw = $defaultDozent }
    $DozentCandidate = $DozentRaw.Trim().ToUpperInvariant()

    # NEW structure: notes\<Year>\<Subject>\<Dozent>
    $folderPathCandidate = Join-Path (Join-Path (Join-Path $notesRoot $yearFolder) $Subject) $DozentCandidate

    if (-not (Test-Path -LiteralPath $folderPathCandidate)) {
        $ok = Confirm-NewFolder -FolderPath $folderPathCandidate -Label "Dozent" -DefaultName $defaultDozent
        if ($ok) {
            Ensure-Dir $folderPathCandidate
            $Dozent = $DozentCandidate
            break
        } else {
            $Dozent = $defaultDozent
            Ensure-Dir (Join-Path (Join-Path (Join-Path $notesRoot $yearFolder) $Subject) $Dozent)
            break
        }
    } else {
        $Dozent = $DozentCandidate
        break
    }
}

# Title + optional fields for frontmatter
$Title  = Read-Host "Titel (z.B. Windows – Bootprozess, BIOS/UEFI und MBR/GPT)"
while ([string]::IsNullOrWhiteSpace($Title)) { $Title = Read-Host "Titel (darf nicht leer sein)" }

$Module = Read-Host "Modul (optional, z.B. Betriebssysteme)"
$Topic  = Read-Host "Topic (optional, z.B. Bootprozess)"
$Level  = Read-Host "Level (optional, z.B. Grundlagen)"

$tagLine = Read-Host "Tags (comma-separated) [optional]"
$Tags = @()
if (-not [string]::IsNullOrWhiteSpace($tagLine)) {
    $Tags = $tagLine.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
}

# ----------------------------
# 3) Dates + path + filename
# ----------------------------
$dateIso = Get-Date -Format "yyyy-MM-dd"
$weekday = Get-Date -Format "dddd"
$slug    = Slugify $Title

# NEW folder structure:
# FIAE_Umschulung_Notes\notes\<Year>\<Subject>\<Dozent>
$folderPath = Join-Path (Join-Path (Join-Path $notesRoot $yearFolder) $Subject) $Dozent
Ensure-Dir $folderPath

$filename = "${dateIso}_${Subject}_${Dozent}_${slug}.md"
$filePath = Join-Path -Path $folderPath -ChildPath $filename

$filePathResolved = [System.IO.Path]::GetFullPath($filePath)
Write-Host "📝 Speichere nach: $filePathResolved"

if (Test-Path -LiteralPath $filePath) {
    Write-Host "❌ Datei existiert bereits: $filePathResolved"
    exit 1
}

# ----------------------------
# 4) Frontmatter + header (NO footer)
# ----------------------------
$tagsYaml = if ($Tags.Count -gt 0) {
    ($Tags | ForEach-Object { "  - " + $_ }) -join "`n"
} else {
    "  -"
}

$frontmatter = @"
---
title: "$Title"
date: $dateIso
weekday: "$weekday"
subject: "$Subject"
instructor: "$Dozent"
program: "FIAE Umschulung 2025-2027"
module: "$Module"
topic: "$Topic"
level: "$Level"
tags:
$tagsYaml
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---
"@

$header = @"
# $weekday, ${dateIso}_${Subject}_${Dozent}

<!-- Hier beginnt der Mitschriftsinhalt -->
"@

$mainContent = @"


"@

$content = $frontmatter + "`n" + $header + $mainContent

# ----------------------------
# 5) Write (UTF-8 BOM) & open
# ----------------------------
$utf8WithBOM = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllText($filePath, $content, $utf8WithBOM)

Write-Host "✅ Note erstellt: $filePathResolved"
code $filePathResolved

