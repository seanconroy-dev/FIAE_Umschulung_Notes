function Show-Box {
  param(
        [Parameter(Mandatory)][string]$Title,
        [Parameter(Mandatory)]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [string[]]$Lines,
        [int]$Width = 72,
        [ConsoleColor]$Fg = 'White',
        [ConsoleColor]$Bg = 'Black',
        [switch]$Center,
        [switch]$AutoFit,
        [int]$LineSpacing = 1,           # 1 = no extra space, 2 = add one blank line between rows, etc.
        [int]$TopPadding = 0,            # extra empty lines INSIDE the box, above content
        [int]$BottomPadding = 0,         # extra empty lines INSIDE the box, below content
        [int]$TopMargin = 10,
        [switch]$NoWait
  )

  Clear-Host
 if ($TopMargin -gt 0){
 1..$TopMargin | ForEach-Object { Write-Host '' }
}

  # Console metrics
  $winW = ([Console]::WindowWidth);  if(-not $winW -or $winW -lt 40){ $winW = 120 }
  $winH = ([Console]::WindowHeight); if(-not $winH -or $winH -lt 20){ $winH = 30  }

  # Box chars (encoding-safe via code points)
  $TL=[char]0x2554; $TR=[char]0x2557; $BL=[char]0x255A; $BR=[char]0x255D
  $Hc=[char]0x2550; $Vc=[char]0x2551; $LM=[char]0x2560; $RM=[char]0x2563
  $H=$Hc.ToString(); $V=$Vc.ToString()

  # Autofit to current window
  if ($AutoFit) {
    $Width = [math]::Max(20, [math]::Min(($winW - 6), 200))
    $Center = $true
  }
  if ($Width -lt 20)  { $Width = 20 }
  if ($Width -gt 200) { $Width = 200 }
  if ($LineSpacing -lt 1) { $LineSpacing = 1 }
  if ($TopPadding   -lt 0) { $TopPadding = 0 }
  if ($BottomPadding-lt 0) { $BottomPadding = 0 }

  # Horizontal centering
  $boxW = $Width + 6  # inner + 2 spaces + 2 borders + 2 corners math already handled
  $leftPad = if ($Center) { [int][math]::Max(0, [math]::Floor(($winW - $boxW)/2.0)) } else { 0 }
  $pad = ' ' * $leftPad

  # Helpers
  function _wrap([string]$text,[int]$w){
    $t = $text
    while($t.Length -gt $w){
      $p = $t.Substring(0,$w).LastIndexOf(' ')
      if($p -lt 1){ $p = $w }
      ($t.Substring(0,$p))
      $t = $t.Substring([Math]::Min($p+1,$t.Length))
    }
    if($t.Length){ $t }
  }
  function _emptyLine([string]$pad,[int]$w,[string]$V){
    $pad + $V + ' ' + (' ' * $w) + ' ' + $V
  }

  $hbar = ($H * ($Width + 2))

  # Build all lines first (for vertical centering with AutoFit)
  $render = New-Object System.Collections.Generic.List[string]
  $render.Add($pad + $TL + $hbar + $TR)

  $t = if($Title.Length -gt $Width){ $Title.Substring(0,$Width) } else { $Title }
  $ls = [int][math]::Max(0,[math]::Floor(($Width-$t.Length)/2.0))
  $rs = $Width - $t.Length - $ls
  $render.Add($pad + $V + ' ' + (' ' * $ls) + $t + (' ' * $rs) + ' ' + $V)

  $render.Add($pad + $LM + ($H * ($Width + 2)) + $RM)

  # top padding inside the box
  for($i=0;$i -lt $TopPadding;$i++){ $render.Add((_emptyLine $pad $Width $V)) }

  foreach($line in $Lines){
  # treat null/whitespace as a deliberate blank row
  if ([string]::IsNullOrWhiteSpace($line)) {
    $render.Add((_emptyLine $pad $Width $V))
    continue
  }

  $chunks = _wrap $line $Width
  foreach($chunk in $chunks){
    $render.Add($pad + $V + ' ' + $chunk.PadRight($Width) + ' ' + $V)
    for($k=1;$k -lt $LineSpacing;$k++){ $render.Add((_emptyLine $pad $Width $V)) }
  }
}

  # bottom padding inside the box
  for($i=0;$i -lt $BottomPadding;$i++){ $render.Add((_emptyLine $pad $Width $V)) }

  $render.Add($pad + $BL + $hbar + $BR)

  # Vertical centering (only with AutoFit)
  if ($AutoFit) {
    $needed = $render.Count
    $topPad = [int][math]::Max(0, [math]::Floor(($winH - $needed)/2.0))
    if ($topPad -gt 0) { 1..$topPad | ForEach-Object { Write-Host '' } }
  }

  # Emit
  foreach($l in $render){ Write-Host $l -ForegroundColor $Fg -BackgroundColor $Bg }
  Write-Host
}


function ShowSlide1 {
  Show-Box -Title '**PowerShell Skriptdateien**' -Lines @(
    [string]::Empty
    'PowerShell-Skripte sind Textdateien mit Befehlen.'
    [string]::Empty
    'Bezeichnung: PowerShell-Skripte.'
    [string]::Empty
    'Standard-Dateiendung: .ps1'
    [string]::Empty
  ) -Width 72 -Center
}

function ShowSlide2 { Show-Box -Title 'Übliche Dateiendungen' -Lines @(
    [string]::Empty
  '.ps1    – Skriptdatei (ausführbar; Befehle/Funktionen)'
    [string]::Empty
  '.psm1   – Script-Modul (wiederverwendbare Funktionen; Import-Module)'
    [string]::Empty
  '.psd1   – Manifest (Metadaten, Version, Abhängigkeiten)'
    [string]::Empty
  '.ps1xml – Format-/Typdefinitionen (Anzeige/Typen steuern)'
    [string]::Empty
  '.pssc   – Session-Konfiguration (z. B. Just Enough Administration)'
    [string]::Empty
) -Width 72 -Center }

function ShowSlide3 { Show-Box -Title 'Ausführen & Sicherheit (knapp)' -Lines @(
   [string]::Empty
  'Execution Policy: Schutzschicht; kein Ersatz für Code-Review/Signaturen.'
   [string]::Empty
  'Datei gezielt entsperren oder pro Prozess ausführen.'
   [string]::Empty
  'Unblock-File .\Script.ps1'
   [string]::Empty
  'powershell -ExecutionPolicy Bypass -NoProfile -File .\Script.ps1'
   [string]::Empty
) -Width 72 -Center }

function ShowSlide4 { Show-Box -Title 'Fazit' -Lines @(
   [string]::Empty
  'Skripte heißen .ps1.'
   [string]::Empty
  'Weitere üblich: .psm1, .psd1, .ps1xml, .pssc.'
   [string]::Empty
) -Width 72 -Center }

function ShowSlide5 { Show-Box -Title 'Warum textbasiert trotz GUI?' -Lines @(
   [string]::Empty
  'Automatisierbar und wiederholbar.'
   [string]::Empty
  'Nachvollziehbar und versionierbar.'
   [string]::Empty
  'Skalierbar auf viele Systeme (remote/headless).'
   [string]::Empty
  'Objektpipeline – präzise Filter statt brüchigem Text.'
   [string]::Empty
) -Width 72 -Center }

function ShowSlide6 { Show-Box -Title 'Beispiel: (Pipeline) Objektpipeline statt Text-Parsing.' -Lines @(
   [string]::Empty
  'Get-Process | Where-Object { $_.CPU -gt 1 } | Sort-Object CPU -Descending | Select-Object -First 5 Name, Id, CPU'
   [string]::Empty
) -Width 112 -Center }

function ShowSlide7 { Show-Box -Title 'Kurzaufgabe: RAM statt CPU filtern. Prozess > 300 MB nennen. ' -Lines @(
   [string]::Empty
  'Get-Process | Where-Object { $_.WorkingSet -gt 300MB } | Sort-Object WorkingSet -Descending | Select-Object -First 5 Name, Id, @{n=''RAM_MB''; e={[math]::Round($_.WorkingSet/1MB)}}'
   [string]::Empty
) -Width 112 -Center }

function ShowSlidesAll { ShowSlide1; ShowSlide2; ShowSlide3; ShowSlide4; ShowSlide5; ShowSlide6; ShowSlide7 }



