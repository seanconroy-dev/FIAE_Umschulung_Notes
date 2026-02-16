# Define base folder
$baseFolder = "D:\FIAE_Umschulung_Notes"  # or use dynamic drive detection like in your main script

# Get all .md files recursively
$files = Get-ChildItem -Path $baseFolder -Recurse -Filter *.md

foreach ($file in $files) {
    # Extract metadata from filename: e.g., 23-07-2025_Netzwerktechnik_TRE.md
    if ($file.Name -match "^(\d{2}-\d{2}-\d{4})_(.+)_(\w+)\.md$") {
        $dateForFilename = $matches[1]
        $Subject = $matches[2]
        $Dozent = $matches[3]
        $dateDisplay = $dateForFilename -replace "-", "."

        # Read content
        $content = Get-Content $file.FullName -Raw

        # Skip if footer already exists
        if ($content -match "Metadaten anzeigen") { continue }

        # Define footer dynamically
        $footer = @"
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am $dateDisplay mit $Dozent.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom $dateDisplay.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>
"@

        # Append footer
        $content += "`n`n---`n" + $footer

        # Save updated file
        $utf8WithBOM = New-Object System.Text.UTF8Encoding $true
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8WithBOM)
        Write-Host "✅ Footer added to $($file.Name)"
    }
}


