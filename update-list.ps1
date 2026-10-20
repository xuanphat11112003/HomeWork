# Script tu dong quet cac file HTML trong toan va tieng-anh
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Get-HtmlTitle([string]$filePath) {
    try {
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        if ($content -match '<title>(.*?)</title>') {
            return $matches[1].Trim()
        }
    } catch {}
    return [System.IO.Path]::GetFileNameWithoutExtension($filePath)
}

function Count-Questions([string]$filePath) {
    try {
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        $matches = [regex]::Matches($content, 'exercise-card')
        if ($matches.Count -gt 0) {
            return $matches.Count
        }
    } catch {}
    return 5
}

$items = @()
$counter = 1

# Quet thu muc toan
$toanPath = Join-Path $ScriptDir "toan"
if (Test-Path $toanPath) {
    $toanFiles = Get-ChildItem -Path $toanPath -Filter "*.html" | Sort-Object Name
    foreach ($file in $toanFiles) {
        $title = Get-HtmlTitle $file.FullName
        $qCount = Count-Questions $file.FullName
        $relPath = "toan/" + $file.Name
        
        $item = [ordered]@{
            id = "toan-" + $counter.ToString("D2")
            title = $title
            subject = "toan"
            subjectName = "Toan hoc"
            file = $relPath
            grade = "Lop 6"
            badge = "Toan hoc"
            questionsCount = $qCount
            description = "Bai tap ren luyen va cung co kien thuc mon Toan."
        }
        $items += $item
        $counter++
    }
}

# Quet thu muc tieng-anh
$enPath = Join-Path $ScriptDir "tieng-anh"
if (Test-Path $enPath) {
    $enFiles = Get-ChildItem -Path $enPath -Filter "*.html" | Sort-Object Name
    foreach ($file in $enFiles) {
        $title = Get-HtmlTitle $file.FullName
        $qCount = Count-Questions $file.FullName
        $relPath = "tieng-anh/" + $file.Name
        
        $item = [ordered]@{
            id = "en-" + $counter.ToString("D2")
            title = $title
            subject = "tieng-anh"
            subjectName = "Tieng Anh"
            file = $relPath
            grade = "Lop 6"
            badge = "Tieng Anh"
            questionsCount = $qCount
            description = "Luyen tap tu vung, ngu phap va cau truc cau Tieng Anh."
        }
        $items += $item
        $counter++
    }
}

$json = $items | ConvertTo-Json -Depth 4
$header = "// ========================================================`r`n// DANH SACH BAI TAP (TU DONG CAP NHAT)`r`n// ========================================================`r`nwindow.EXERCISE_DATA = "
$dataJsContent = $header + $json + ";`r`n"

$dataJsPath = Join-Path $ScriptDir "data.js"
[System.IO.File]::WriteAllText($dataJsPath, $dataJsContent, [System.Text.Encoding]::UTF8)

# Dong bo tu-vung.json sang tu-vung.js (ho tro mo offline truc tiep tren may)
$vocabJsonPath = Join-Path $ScriptDir "tu-vung.json"
if (Test-Path $vocabJsonPath) {
    try {
        $vocabRaw = Get-Content -Path $vocabJsonPath -Raw -Encoding UTF8
        $vocabJsContent = "// ========================================================`r`n// TU VUNG TIENG ANH (DONG BO TU TU-VUNG.JSON)`r`n// ========================================================`r`nwindow.VOCAB_DATA = " + $vocabRaw.Trim() + ";`r`n"
        $vocabJsPath = Join-Path $ScriptDir "tu-vung.js"
        [System.IO.File]::WriteAllText($vocabJsPath, $vocabJsContent, [System.Text.Encoding]::UTF8)
        Write-Host " [+] Da dong bo tu-vung.json sang tu-vung.js!" -ForegroundColor Magenta
    } catch {}
}

Write-Host "Cap nhat thanh cong $($items.Count) bai tap vao data.js!" -ForegroundColor Green
foreach ($it in $items) {
    Write-Host (" [+] " + $it.file + " : " + $it.title) -ForegroundColor Cyan
}
