# DROP-IN FIX: keep your *working* script, just replace your Show-Box with this centered version.
# No cursor moves, no side-effects. Supports optional -ContentWidth and -NoCenter.

function Show-Box {
  param(
    [Parameter(Mandatory)][string]$Title,
    [Parameter(Mandatory)][string[]]$Lines,
    [int]$ContentWidth,          # e.g. 60, 72, 90 (optional)
    [int]$MaxWidth = 120,        # cap inner width so the box doesn’t get too wide
    [switch]$NoCenter            # show left-aligned if set
  )

  Clear-Host

  # determine inner content width (auto from longest line unless ContentWidth supplied)
  $autoLen = (@($Title)+$Lines | ForEach-Object { ($_ -replace "`e\[[\d;]*m","").Length } | Measure-Object -Maximum).Maximum
  $len = if ($ContentWidth -and $ContentWidth -gt 0) { $ContentWidth } else { $autoLen }
  $len = [math]::Min([math]::Max(10,$len), [math]::Max(10,$MaxWidth-6))   # inner width (not counting borders + inner padding)

  # horizontal padding to center (safe for Windows Terminal)
  $boxWidth = $len + 6                        # +2 borders +4 inner spaces
  $winW = [Console]::WindowWidth
  if (-not $winW -or $winW -lt 40) { $winW = 80 }
  $left = if ($NoCenter) { 0 } else { [int][math]::Max(0, [math]::Floor(($winW - $boxWidth)/2.0)) }
  $pad  = ' ' * $left

  $h = '+' + ('-' * ($len + 4)) + '+'

  Write-Host ($pad + $h) -ForegroundColor DarkGray
  Write-Host ($pad + '|  ' + $Title.PadRight($len) + '  |') -ForegroundColor Cyan
  Write-Host ($pad + $h) -ForegroundColor DarkGray

  foreach ($l in $Lines) {
    $text = $l
    while ($text.Length -gt $len) {
      $wrapAt = $text.Substring(0, [Math]::Min($len, $text.Length)).LastIndexOf(' ')
      if ($wrapAt -lt 1) { $wrapAt = $len }
      Write-Host ($pad + '|  ' + $text.Substring(0,$wrapAt).PadRight($len) + '  |')
      $text = $text.Substring([Math]::Min($wrapAt + 1, $text.Length))
    }
    Write-Host ($pad + '|  ' + $text.PadRight($len) + '  |')
  }

  Write-Host ($pad + $h) -ForegroundColor DarkGray
  Write-Host
}



# Test (uncomment to try): 
# ShowSlide1



function ShowSlide1 { Show-Box -Title 'Wie heißen die Skriptdateien?' -Lines @(
  'PowerShell-Skripte sind Textdateien mit Befehlen.',
  'Bezeichnung: PowerShell-Skripte.',
  'Standard-Dateiendung:  .ps1'
)}

function ShowSlide2 { Show-Box -Title 'Übliche Dateiendungen' -Lines @(
  '.ps1    – Skriptdatei (ausführbar; Befehle/Funktionen)',
  '.psm1   – Script-Modul (wiederverwendbare Funktionen; Import-Module)',
  '.psd1   – Manifest (Metadaten, Version, Abhängigkeiten)',
  '.ps1xml – Format-/Typdefinitionen (Anzeige/Typen steuern)',
  '.pssc   – Session-Konfiguration (z. B. Just Enough Administration)'
)}

function ShowSlide3 { Show-Box -Title 'Beispiel (Pipeline)' -Lines @(
  'Objektpipeline statt Text-Parsing.',
  'Get-Process | Where-Object { $_.CPU -gt 1 } |',
  '  Sort-Object CPU -Descending |',
  '  Select-Object -First 5 Name, Id, CPU'
)}

function ShowSlide4 { Show-Box -Title 'Kurzaufgabe' -Lines @(
  'RAM statt CPU filtern. Prozess > 300 MB nennen.',
  'Get-Process | Where-Object { $_.WorkingSet -gt 300MB } |',
  '  Sort-Object WorkingSet -Descending |',
  '  Select-Object -First 5 Name, Id, @{n=''RAM_MB''; e={[math]::Round($_.WorkingSet/1MB)}}'
)}

function ShowSlide5 { Show-Box -Title 'Ausführen & Sicherheit (knapp)' -Lines @(
  'Execution Policy: Schutzschicht; kein Ersatz für Code-Review/Signaturen.',
  'Datei entsperren oder pro Prozess ausführen.',
  'Unblock-File .\Script.ps1',
  'powershell -ExecutionPolicy Bypass -NoProfile -File .\Script.ps1'
)}

function ShowSlide6 { Show-Box -Title 'Fazit' -Lines @(
  'Skripte heißen .ps1.',
  'Weitere üblich: .psm1, .psd1, .ps1xml, .pssc.'
)}

function ShowSlide7 { Show-Box -Title 'Warum textbasiert trotz GUI? (Zusatz)' -Lines @(
  'Automatisierbar und wiederholbar.',
  'Nachvollziehbar und versionierbar.',
  'Skalierbar auf viele Systeme (remote/headless).',
  'Objektpipeline – präzise Filter statt brüchigem Text.'
)}
