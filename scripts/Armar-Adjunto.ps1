<#
 Arma el adjunto de una etapa con SOLO los archivos del híbrido que esa etapa necesita (lista en docs/adjuntos/etapa-NN.txt)
 más el contexto del repo nativo (AGENTS, STATE, CAMBIOS, ficha de la etapa y la siguiente).
 Genera dos formatos en la misma carpeta de salida (FUERA del repo): un .md plano y un .zip. Usa el que tu chat acepte.
 Uso:  ./scripts/Armar-Adjunto.ps1 -Etapa 2 -Hibrido "C:\ruta\Mi-Plata-App"
       (o define una vez:  setx MIPLATA_HIBRIDO "C:\ruta\Mi-Plata-App"  y abre otra terminal)
 Resultado esperado: adjunto-etapa-NN.md y adjunto-etapa-NN.zip en el Escritorio\adjuntos-mi-plata.
#>
param([Parameter(Mandatory)][int]$Etapa, [string]$Hibrido = $env:MIPLATA_HIBRIDO, [string]$Salida)
. "$PSScriptRoot\_comun.ps1"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$raiz = Get-RepoRoot
if (-not $Salida) { $Salida = Join-Path ([Environment]::GetFolderPath('Desktop')) 'adjuntos-mi-plata' }
$salidaFull = [IO.Path]::GetFullPath($Salida).TrimEnd('\') + '\'
if ($salidaFull.StartsWith(([IO.Path]::GetFullPath($raiz).TrimEnd('\') + '\'), [StringComparison]::OrdinalIgnoreCase)) {
  throw 'La carpeta de salida no puede estar dentro del repo nativo (el código del híbrido nunca entra al repo).'
}
$nn = '{0:D2}' -f $Etapa
$lista = Join-Path $raiz "docs/adjuntos/etapa-$nn.txt"
if (-not (Test-Path $lista)) { throw "No existe $lista" }
$archivos = @(Get-Content $lista -Encoding UTF8 | Where-Object { $_.Trim() -ne '' -and -not $_.StartsWith('#') } | ForEach-Object { $_.Trim() })
if ($archivos.Count -gt 0) {
  if (-not $Hibrido -or -not (Test-Path $Hibrido)) { throw 'Indica la carpeta del repo híbrido con -Hibrido "C:\ruta\Mi-Plata-App" (o la variable MIPLATA_HIBRIDO).' }
}
New-Item -ItemType Directory -Path $Salida -Force | Out-Null

$ctx = [ordered]@{
  'contexto/AGENTS.md'  = Join-Path $raiz 'AGENTS.md'
  'contexto/STATE.md'   = Join-Path $raiz 'docs/STATE.md'
  'contexto/CAMBIOS.md' = Join-Path $raiz 'docs/CAMBIOS.md'
  "contexto/etapa-$nn.md" = Join-Path $raiz "docs/etapas/etapa-$nn.md"
}
$sig = Join-Path $raiz ("docs/etapas/etapa-{0:D2}.md" -f ($Etapa + 1))
if (Test-Path $sig) { $ctx['contexto/siguiente-etapa.md'] = $sig }

$items = New-Object System.Collections.Generic.List[object]
foreach ($k in $ctx.Keys) { $items.Add(@{ Ruta = $k; Fuente = $ctx[$k] }) }
$faltan = @()
foreach ($a in $archivos) {
  $f = Join-Path $Hibrido ($a.Replace('/', '\'))
  if (Test-Path $f) { $items.Add(@{ Ruta = "hibrido/$a"; Fuente = $f }) } else { $faltan += $a }
}

$md = New-Object System.Text.StringBuilder
[void]$md.AppendLine("ADJUNTO DE LA ETAPA $nn — Mi Plata Nativa")
[void]$md.AppendLine('Cada archivo va entre «=== ARCHIVO: ruta ===» y «=== FIN ===». Los de contexto/ son del repo nativo; los de hibrido/ son del híbrido (solo lectura).')
[void]$md.AppendLine('')
$total = 0
foreach ($i in $items) {
  $t = (Read-Utf8 $i.Fuente).Replace("`r`n", "`n")
  $total += $t.Length
  [void]$md.AppendLine("=== ARCHIVO: $($i.Ruta) ===")
  [void]$md.AppendLine($t.TrimEnd("`n"))
  [void]$md.AppendLine('=== FIN ===')
  [void]$md.AppendLine('')
}
$mdRuta = Join-Path $Salida "adjunto-etapa-$nn.md"
Write-Utf8 $mdRuta $md.ToString()

$zipRuta = Join-Path $Salida "adjunto-etapa-$nn.zip"
if (Test-Path $zipRuta) { Remove-Item $zipRuta -Force }
$zip = [IO.Compression.ZipFile]::Open($zipRuta, 'Create')
try {
  foreach ($i in $items) {
    $e = $zip.CreateEntry($i.Ruta, [IO.Compression.CompressionLevel]::Optimal)
    $s = $e.Open(); $b = [IO.File]::ReadAllBytes($i.Fuente); $s.Write($b, 0, $b.Length); $s.Dispose()
  }
} finally { $zip.Dispose() }

Write-Host "Listo: $($items.Count) archivos, ≈ $([math]::Round($total/3.5/1000,1))k tokens." -ForegroundColor Green
Write-Host "  $mdRuta"; Write-Host "  $zipRuta"
if ($faltan.Count -gt 0) { Write-Host "`nNo se encontraron en el híbrido (avísale a la IA):" -ForegroundColor Yellow; $faltan | ForEach-Object { Write-Host "  $_" } }