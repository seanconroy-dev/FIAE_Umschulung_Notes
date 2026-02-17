<#
MIGRATION SCRIPT (FIXED): Read frontmatter -> normalize -> rename/move
- Cross-platform base folder detection (Linux pwsh + Windows)
- Fixes: missing param block, missing Find-GitRoot, stray typo chars ("a")
- Keeps your logic: strip legacy <details> footer, archive invalid, collision handling, dry-run default

USAGE (Linux pwsh)
  pwsh ./migrate-notes.ps1                 # Dry run
  pwsh ./migrate-notes.ps1 -Apply          # Apply
  pwsh ./migrate-notes.ps1 -Apply -BaseFolder /home/sean/umschulung-work/FIAE_Umschulung_Notes

USAGE (Windows)
  .\migrate-notes.ps1
  .\migrate-notes.ps1 -Apply
#>

param(
    [switch]$Apply,
    [string[]]$ExcludeDirs = @("node_modules",".git","notes","archive"),
    [switch]$StripFooter = $true,
    [switch]$ArchiveInvalid = $true,

    # Optional: explicitly set repo root (recommended on Linux)
    [string]$BaseFolder
)

Set-StrictMode -Version Latest
if ($IsWindows) { chcp 65001 | Out-Null }

function Find-GitRoot {
    param([string]$StartPath)

    $resolved = Resolve-Path -LiteralPath $StartPath -ErrorAction Stop
    $cur = $resolved.Path

    while ($true) {
        if (Test-Path (Join-Path $cur ".git")) { return $cur }

        $parent = Split-Path -Parent $cur
        if ([string]::IsNullOrWhiteSpace($parent) -or $parent -eq $cur) { break }
        $cur = $parent
    }
    return $null
}

# ----------------------------
# 1) Find base folder (cross-platform)
# ----------------------------
$baseFolder = $null

if (-not [string]::IsNullOrWhiteSpace($BaseFolder)) {
    if (-not (Test-Path $BaseFolder)) {
        Write-Host "❌ BaseFolder not found: $BaseFolder"
        exit 1
    }
    $baseFolder = (Resolve-Path $BaseFolder).Path
}
else {
    # Prefer git root from current location or script location
    $try1 = Find-GitRoot -StartPath (Get-Location).Path
    $try2 = Find-GitRoot -StartPath $PSScriptRoot

    if ($try1) { $baseFolder = $try1 }
    elseif ($try2) { $baseFolder = $try2 }
    elseif ($IsWindows) {
        # fallback: drive probing (Windows only)
        foreach ($drive in @("D:", "E:")) {
            $pathCheck = Join-Path $drive "FIAE_Umschulung_Notes"
            if (Test-Path $pathCheck) { $baseFolder = $pathCheck; break }
        }
    }
}

if (-not $baseFolder) {
    Write-Host "❌ Could not determine repo root. Run from inside the repo OR pass -BaseFolder."
    Write-Host "   Example: pwsh ./migrate-notes.ps1 -Apply -BaseFolder /home/sean/umschulung-work/FIAE_Umschulung_Notes"
    exit 1
}

$notesRoot   = Join-Path $baseFolder "notes"
$archiveRoot = Join-Path (Join-Path $baseFolder "archive") "invalid"
$reportPath  = Join-Path $baseFolder ("migration_report_{0}.txt" -f (Get-Date -Format "yyyyMMdd_HHmmss"))

function Log {
    param([string]$Msg)
    $Msg | Add-Content -Encoding UTF8 -Path $reportPath
}

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) { New-Item -Path $Path -ItemType Directory -Force | Out-Null }
}

Ensure-Dir $notesRoot
if ($ArchiveInvalid.IsPresent) { Ensure-Dir $archiveRoot }

# ----------------------------
# 2) Canon + aliases (LONG subjects only)
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
    "digitaltechnik"="Digitaltechnik"

    "nt"="Netzwerktechnik"
    "nt/tre"="Netzwerktechnik"
    "netzwerktechnik"="Netzwerktechnik"

    "tk"="Telekommunikation"
    "telekommunikation"="Telekommunikation"

    "web"="Webentwicklung"
    "webentwicklung"="Webentwicklung"

    "wiso"="WiSo"
}

function Normalize-Subject {
    param([string]$s)

    $raw = ($s ?? "").Trim()
    if ([string]::IsNullOrWhiteSpace($raw)) { return "" }

    $k = $raw.ToLowerInvariant()
    if ($SubjectAliases.ContainsKey($k)) { return $SubjectAliases[$k] }

    foreach ($c in $CanonSubjects) {
        if ($c.ToLowerInvariant() -eq $k) { return $c }
    }

    Log "WARN unknown subject '$raw' (kept as-is)"
    return $raw
}

function Slugify {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return "note" }

    $t = $Text.Trim().ToLowerInvariant()
    $t = $t -replace "ä","ae" -replace "ö","oe" -replace "ü","ue" -replace "ß","ss"

    # remove diacritics safely
    $t = $t.Normalize([Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($ch in $t.ToCharArray()) {
        $cat = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch)
        if ($cat -ne [Globalization.UnicodeCategory]::NonSpacingMark) { [void]$sb.Append($ch) }
    }
    $t = $sb.ToString().Normalize([Text.NormalizationForm]::FormC)

    $t = $t -replace "[^a-z0-9]+","-"
    $t = $t -replace "^-+","" -replace "-+$",""
    $t = $t -replace "-{2,}","-"
    if ([string]::IsNullOrWhiteSpace($t)) { return "note" }
    return $t
}

# ----------------------------
# 3) Frontmatter parsing
# ----------------------------
function Try-ParseFrontmatter {
    param([string]$Text)

    # Frontmatter must be at top: --- ... ---
    if ($Text -notmatch '^(?s)---\s*\r?\n(.*?)\r?\n---\s*\r?\n') { return $null }

    $fmBlock = $Matches[1]
    $lines = $fmBlock -split "\r?\n"

    $fm = @{}
    $currentKey = $null
    $inList = $false
    $listItems = @()

    foreach ($line in $lines) {
        if ($line -match '^\s*#') { continue }

        if ($inList -and $line -match '^\s*-\s*(.*)$') {
            $listItems += $Matches[1].Trim()
            continue
        }

        if ($line -match '^\s*([A-Za-z0-9_]+)\s*:\s*(.*)\s*$') {
            if ($inList -and $currentKey) {
                $fm[$currentKey] = $listItems
                $listItems = @()
                $inList = $false
            }

            $k = $Matches[1]
            $v = $Matches[2]
            $currentKey = $k

            if ($v -eq "") {
                $inList = $true
                $listItems = @()
                continue
            }

            $v2 = $v.Trim()
            if ($v2 -match '^"(.*)"$') { $v2 = $Matches[1] }
            elseif ($v2 -match "^'(.*)'$") { $v2 = $Matches[1] }

            $fm[$k] = $v2
        }
    }

    if ($inList -and $currentKey) { $fm[$currentKey] = $listItems }
    return $fm
}

function Try-ParseDate {
    param([string]$DateString, [string]$FallbackFromName)

    if (-not [string]::IsNullOrWhiteSpace($DateString)) {
        try {
            return [datetime]::ParseExact($DateString.Trim(), "yyyy-MM-dd", [Globalization.CultureInfo]::InvariantCulture)
        } catch { }
    }

    if (-not [string]::IsNullOrWhiteSpace($FallbackFromName)) {
        if ($FallbackFromName -match '(?<y>\d{4})-(?<m>\d{2})-(?<d>\d{2})') {
            return Get-Date -Year $Matches.y -Month $Matches.m -Day $Matches.d
        }
        if ($FallbackFromName -match '(?<d>\d{2})-(?<m>\d{2})-(?<y>\d{4})') {
            return Get-Date -Year $Matches.y -Month $Matches.m -Day $Matches.d
        }
    }

    return $null
}

# ----------------------------
# 4) Footer stripper (legacy <details> metadata block at end)
# ----------------------------
function Remove-LegacyFooter {
    param([string]$Text)

    if ($Text -notmatch '(?is)<details\b' -or $Text -notmatch '(?is)Metadaten anzeigen') {
        return $Text
    }

    $pattern1 = '(?is)\r?\n---\r?\n\s*<details\b.*?</details>\s*$'
    $newText = [regex]::Replace($Text, $pattern1, "")

    if ($newText -eq $Text) {
        $pattern2 = '(?is)\r?\n\s*<details\b.*?</details>\s*$'
        $newText = [regex]::Replace($Text, $pattern2, "")
    }

    return $newText.TrimEnd() + "`r`n"
}

# ----------------------------
# 5) Invalid archive mover
# ----------------------------
function Move-ToArchive {
    param(
        [string]$SourcePath,
        [string]$ReasonFolder
    )

    if (-not $ArchiveInvalid.IsPresent) { return }

    $destDir = Join-Path $archiveRoot $ReasonFolder
    Ensure-Dir $destDir

    $destPath = Join-Path $destDir ([IO.Path]::GetFileName($SourcePath))

    $i = 2
    while (Test-Path $destPath) {
        $base = [IO.Path]::GetFileNameWithoutExtension($SourcePath)
        $ext  = [IO.Path]::GetExtension($SourcePath)
        $destPath = Join-Path $destDir ("{0}_{1:00}{2}" -f $base, $i, $ext)
        $i++
    }

    if (-not $Apply) {
        Log "DRY  ARCHIVE  $SourcePath  ->  $destPath"
        return
    }

    try {
        Move-Item -Path $SourcePath -Destination $destPath -Force
        Log "OK   ARCHIVE  $SourcePath  ->  $destPath"
    } catch {
        Log "ERR  ARCHIVE  $SourcePath  ->  $destPath :: $($_.Exception.Message)"
    }
}

# ----------------------------
# 6) File enumeration (robust excludes)
# ----------------------------
function Is-InExcludedDir {
    param([string]$FullPath)

    $p = $FullPath.Replace("/","\")
    foreach ($ex in $ExcludeDirs) {
        if ($p -match "(?i)\\$([regex]::Escape($ex))\\") { return $true }
        if ($p -match "(?i)\\$([regex]::Escape($ex))$")  { return $true }
    }
    return $false
}

$allMd = Get-ChildItem -Path $baseFolder -Recurse -File -Filter "*.md" -ErrorAction SilentlyContinue |
    Where-Object { -not (Is-InExcludedDir $_.FullName) }

Log "=== Migration started: $(Get-Date) ==="
Log "Base: $baseFolder"
Log "NotesRoot: $notesRoot"
Log "ArchiveInvalid: $ArchiveInvalid"
Log "StripFooter: $StripFooter"
Log "Apply: $Apply"
Log "Files found: $($allMd.Count)"
Log ""

# ----------------------------
# 7) Process
# ----------------------------
$changed  = 0
$archived = 0
$skipped  = 0

foreach ($f in $allMd) {
    $path = $f.FullName
    $name = $f.Name

    $raw = Get-Content -Raw -Path $path -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($raw)) {
        Log "INVALID empty file: $path"
        Move-ToArchive -SourcePath $path -ReasonFolder "empty"
        $archived++
        continue
    }

    $fm = Try-ParseFrontmatter -Text $raw
    if (-not $fm) {
        Log "INVALID no frontmatter: $path"
        Move-ToArchive -SourcePath $path -ReasonFolder "no-frontmatter"
        $archived++
        continue
    }

    $title = ""
    if ($fm.ContainsKey("title")) { $title = [string]$fm["title"] }
    if ([string]::IsNullOrWhiteSpace($title) -and $fm.ContainsKey("topic")) { $title = [string]$fm["topic"] }

    $subject = ""
    if ($fm.ContainsKey("subject")) { $subject = Normalize-Subject ([string]$fm["subject"]) }

    $instructor = ""
    if ($fm.ContainsKey("instructor")) { $instructor = ([string]$fm["instructor"]).Trim().ToUpperInvariant() }

    $dateStr = ""
    if ($fm.ContainsKey("date")) { $dateStr = [string]$fm["date"] }

    $d = Try-ParseDate -DateString $dateStr -FallbackFromName $name

    $missing = @()
    if (-not $d) { $missing += "date" }
    if ([string]::IsNullOrWhiteSpace($subject)) { $missing += "subject" }
    if ([string]::IsNullOrWhiteSpace($instructor)) { $missing += "instructor" }
    if ([string]::IsNullOrWhiteSpace($title)) { $missing += "title/topic" }

    if ($missing.Count -gt 0) {
        Log "INVALID missing fields ($($missing -join ', ')): $path"
        Move-ToArchive -SourcePath $path -ReasonFolder "missing-fields"
        $archived++
        continue
    }

    $year    = $d.ToString("yyyy")
    $dateIso = $d.ToString("yyyy-MM-dd")
    $slug    = Slugify $title

    $targetDir  = Join-Path (Join-Path (Join-Path $notesRoot $year) $subject) $instructor
    $baseFile   = "{0}_{1}_{2}_{3}.md" -f $dateIso, $subject, $instructor, $slug
    $targetPath = Join-Path $targetDir $baseFile

    $i = 2
    while (Test-Path $targetPath) {
        $alt = "{0}_{1}_{2}_{3}_{4:00}.md" -f $dateIso, $subject, $instructor, $slug, $i
        $targetPath = Join-Path $targetDir $alt
        $i++
    }

    $outText = $raw
    if ($StripFooter.IsPresent) {
        $outText = Remove-LegacyFooter -Text $outText
    }

    $actionLine = "MOVE  $path  ->  $targetPath"
    if (-not $Apply) {
        Log "DRY  $actionLine"
        continue
    }

    try {
        Ensure-Dir $targetDir

        $utf8WithBOM = New-Object System.Text.UTF8Encoding $true
        [System.IO.File]::WriteAllText($targetPath, $outText, $utf8WithBOM)

        Remove-Item -Path $path -Force

        Log "OK   $actionLine"
        $changed++
    } catch {
        Log "ERR  $actionLine :: $($_.Exception.Message)"
        $skipped++
    }
}

Log ""
Log "=== Migration finished: $(Get-Date) ==="
Log "Changed: $changed"
Log "Archived: $archived"
Log "Skipped (errors): $skipped"
Log "Report: $reportPath"

Write-Host "Report written to: $reportPath"
if (-not $Apply) {
    Write-Host "✅ Dry-run complete. Re-run with -Apply to perform changes."
} else {
    Write-Host "✅ Migration applied. Review changes, then commit on your branch."
}

