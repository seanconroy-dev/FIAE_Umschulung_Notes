# new-fiae-note.ps1
# Cross-platform PowerShell script to create a markdown note with YAML frontmatter
# Works on Windows (PowerShell 7+), Linux, macOS.
#
# FIX NOTE (important):
# Your “Unbekanntes Fach” for *all inputs* means: Normalize-Subject is returning "" every time.
# The safest way to make this deterministic is:
# 1) Normalize keys the SAME way for:
#    - user input
#    - alias keys
#    - canonical subject keys
# 2) Build lookup maps once (alias map + canon map) using the normalized keys.
#
# This script does exactly that, and clearly marks the FIXED subject-mapping parts.

Set-StrictMode -Version Latest

# Console UTF-8 output (no chcp on non-Windows)
if ($PSVersionTable.PSVersion.Major -ge 6) {
    try { [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false) } catch { }
}

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

# ============================================================
# SUBJECT NORMALIZATION + LOOKUP (FIXED)
# ============================================================

# --- FIXED: One normalization function used everywhere ---
function Normalize-SubjectKey {
    param([string]$s)

    if ([string]::IsNullOrWhiteSpace($s)) { return "" }

    # 1) Trim
    $k = $s.Trim()

    # 2) Unicode normalize (helps when input method produces composed/odd forms)
    try { $k = $k.Normalize([Text.NormalizationForm]::FormKC) } catch { }

    # 3) Remove invisible junk:
    #    \p{Cc} = control chars (\r \n \t)
    #    \p{Cf} = format chars (zero-width space, etc.)
    #    \s     = whitespace
    $k = ($k -replace '[\p{Cc}\p{Cf}\s]+', '')

    # 4) Lowercase invariant
    $k = $k.ToLowerInvariant()

    return $k
}

# --- FIXED: Build CanonMap once using normalized keys ---
$CanonMap = [hashtable]::new([System.StringComparer]::Ordinal)
foreach ($c in $CanonSubjects) {
    $CanonMap[(Normalize-SubjectKey $c)] = $c
}

# --- FIXED: Build AliasMap once using normalized keys (not “raw” keys) ---
$AliasMap = [hashtable]::new([System.StringComparer]::Ordinal)

function Add-SubjectAlias {
    param(
        [Parameter(Mandatory)][string]$aliasKey,
        [Parameter(Mandatory)][string]$canonValue
    )

    $ak = Normalize-SubjectKey $aliasKey
    $cv = $canonValue

    if ([string]::IsNullOrWhiteSpace($ak)) { return }

    # Ensure the alias points to an actual canonical entry if possible
    $cvk = Normalize-SubjectKey $cv
    if ($CanonMap.ContainsKey($cvk)) {
        $AliasMap[$ak] = $CanonMap[$cvk]
    } else {
        # fall back to provided string
        $AliasMap[$ak] = $cv
    }
}

# --- FIXED: Define aliases (safe for Linux input quirks) ---
Add-SubjectAlias "bs"                "Betriebssysteme"
Add-SubjectAlias "betriebssysteme"   "Betriebssysteme"

Add-SubjectAlias "pt"                "Programmiertechnik"
Add-SubjectAlias "programmiertechnik" "Programmiertechnik"

Add-SubjectAlias "st"                "Systemtechnik"
Add-SubjectAlias "systemtechnik"     "Systemtechnik"

Add-SubjectAlias "db"                "Datenbanken"
Add-SubjectAlias "db/wit"            "Datenbanken"
Add-SubjectAlias "datenbank"         "Datenbanken"
Add-SubjectAlias "sql"               "Datenbanken"

Add-SubjectAlias "dt"                "Digitaltechnik"
Add-SubjectAlias "dt/pas"            "Digitaltechnik"

Add-SubjectAlias "nt"                "Netzwerktechnik"
Add-SubjectAlias "nt/tre"            "Netzwerktechnik"

Add-SubjectAlias "tk"                "Telekommunikation"
Add-SubjectAlias "web"               "Webentwicklung"
Add-SubjectAlias "wiso"              "WiSo"

# --- FIXED: Single entry point used by the rest of the script ---
function Normalize-Subject {
    param([string]$Text)

    $k = Normalize-SubjectKey $Text
    if ([string]::IsNullOrWhiteSpace($k)) { return "" }

    if ($AliasMap.ContainsKey($k)) { return $AliasMap[$k] }
    if ($CanonMap.ContainsKey($k)) { return $CanonMap[$k] }

    return ""
}

# OPTIONAL DEBUG (uncomment if needed)
# function Dump-Codepoints { param([string]$s) if ($null -eq $s) { return "<null>" }; return ($s.ToCharArray() | ForEach-Object { [int][char]$_ }) -join "," }

# ----------------------------
# Helpers
# ----------------------------
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

function YamlQ {
    param([string]$s)
    if ($null -eq $s) { return "''" }
    return "'" + ($s -replace "'", "''") + "'"
}

# ----------------------------
# Determine repo root (cross-platform)
# Priority:
# 1) env:FIAE_NOTES_ROOT
# 2) git rev-parse --show-toplevel (if inside git repo)
# 3) parent folder of script ($PSScriptRoot\..), else current directory
# ----------------------------
$repoRoot = $env:FIAE_NOTES_ROOT

if ([string]::IsNullOrWhiteSpace($repoRoot)) {
    try {
        $gitRoot = (& git rev-parse --show-toplevel 2>$null)
        if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($gitRoot)) {
            $repoRoot = $gitRoot.Trim()
        }
    } catch { }
}

if ([string]::IsNullOrWhiteSpace($repoRoot)) {
    if ($PSScriptRoot) {
        try { $repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path }
        catch { $repoRoot = (Get-Location).Path }
    } else {
        $repoRoot = (Get-Location).Path
    }
}

if (-not (Test-Path -LiteralPath $repoRoot)) {
    Write-Host "❌ Repo root not found: $repoRoot"
    exit 1
}

Write-Host "📁 RepoRoot gefunden: $repoRoot"

$notesRoot = Join-Path $repoRoot "notes"
if (-not (Test-Path -LiteralPath $notesRoot)) {
    Write-Host "❌ Unterordner 'notes' nicht gefunden: $notesRoot"
    exit 1
}
Write-Host "📁 Notes-Root gefunden: $notesRoot"

# ----------------------------
# Inputs
# ----------------------------
$defaultSubject = "Programmiertechnik"
$defaultDozent  = "ASS"
$yearFolder     = Get-Date -Format "yyyy"

while ($true) {
    $SubjectRaw = Read-Host "Fach (z.B. PT, ST, BS, Datenbanken)"

    if ([string]::IsNullOrWhiteSpace($SubjectRaw)) {
        Write-Host "⚠️ Eingabe darf nicht leer sein."
        continue
    }

    $SubjectCandidate = Normalize-Subject $SubjectRaw

    # OPTIONAL DEBUG (uncomment if needed)
    # $kdbg = Normalize-SubjectKey $SubjectRaw
    # Write-Host "DEBUG raw=[$SubjectRaw] key=[$kdbg] aliasHas=$($AliasMap.ContainsKey($kdbg)) canonHas=$($CanonMap.ContainsKey($kdbg))"
    # Write-Host "DEBUG alias[st]=[$($AliasMap['st'])] canon[systemtechnik]=[$($CanonMap[(Normalize-SubjectKey 'Systemtechnik')])]"

    if ([string]::IsNullOrWhiteSpace($SubjectCandidate)) {
        Write-Host "⚠️ Unbekanntes Fach: $SubjectRaw"
        continue
    }

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

$dateIso = Get-Date -Format "yyyy-MM-dd"
$weekday = Get-Date -Format "dddd"
$slug    = Slugify $Title

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

$tagsYaml = if ($Tags.Count -gt 0) {
    ($Tags | ForEach-Object { "  - " + $_ }) -join "`n"
} else {
    "  -"
}

$frontmatter = @"
---
title: $(YamlQ $Title)
date: $dateIso
weekday: $(YamlQ $weekday)
subject: $(YamlQ $Subject)
instructor: $(YamlQ $Dozent)
program: 'FIAE Umschulung 2025-2027'
module: $(YamlQ $Module)
topic: $(YamlQ $Topic)
level: $(YamlQ $Level)
tags:
$tagsYaml
author: 'Sean Conroy'
license: 'CC BY-NC-SA 4.0'
---
"@

$header = @"
# $weekday, ${dateIso}_${Subject}_${Dozent}

<!-- Hier beginnt der Mitschriftsinhalt -->
"@

$content = $frontmatter + "`n" + $header + "`n"

$utf8NoBOM = [System.Text.UTF8Encoding]::new($false)
[System.IO.File]::WriteAllText($filePath, $content, $utf8NoBOM)

Write-Host "✅ Note erstellt: $filePathResolved"

if (Get-Command code -ErrorAction SilentlyContinue) {
    try { code $filePathResolved } catch { Write-Host "Hinweis: 'code' command failed to open editor." }
} else {
    Write-Host "Hinweis: VS Code CLI 'code' nicht gefunden. Datei wurde erstellt."
}

