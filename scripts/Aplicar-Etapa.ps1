<#
 Aplica el zip de una etapa en la raíz del repo: extrae los archivos (sobrescribe) y procesa borrar.txt.
 Uso:  ./scripts/Aplicar-Etapa.ps1 -Zip "$HOME\Downloads\etapa-02-dinero-fechas-texto.zip"   (agrega -Simular para solo mirar)
 Resultado esperado: lista de archivos escritos/borrados y 'git status' con los cambios, sin carpeta envoltorio.
#>
param([Parameter(Mandatory)][string]$Zip, [switch]$Simular)
. "$PSScriptRoot\_comun.ps1"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$raiz = Get-RepoRoot
if (-not (Test-Path $Zip)) { throw "No existe el zip: $Zip" }
$Zip = (Resolve-Path $Zip).Path
$base = [IO.Path]::GetFileNameWithoutExtension($Zip)
$rootFull = [IO.Path]::GetFullPath($raiz).TrimEnd('\') + '\'

function Seguro([string]$rel) {
  if ($rel -match '^[A-Za-z]:' -or $rel.StartsWith('/') -or $rel -match '(^|/)\.\.(/|$)') { throw "Ruta no permitida en el zip: $rel" }
  $dest = [IO.Path]::GetFullPath((Join-Path $raiz $rel))
  if (-not $dest.StartsWith($rootFull, [StringComparison]::OrdinalIgnoreCase)) { throw "Ruta fuera del repo: $rel" }
  if ($rel -match '^\.git(/|$)') { throw "No se toca .git: $rel" }
  return $dest
}

$z = [IO.Compression.ZipFile]::OpenRead($Zip)
try {
  $entradas = @($z.Entries | Where-Object { $_.Name -ne '' })
  if ($entradas.Count -eq 0) { throw 'El zip está vacío.' }
  $nombres = $entradas | ForEach-Object { $_.FullName.Replace('\', '/') }
  $primeros = $nombres | ForEach-Object { ($_ -split '/')[0] } | Sort-Object -Unique
  if ($primeros.Count -eq 1 -and ($primeros[0] -eq $base -or $primeros[0] -like 'etapa-*' -or $primeros[0] -like 'cierre-*' -or $primeros[0] -like 'fix-*')) {
    throw "El zip trae una carpeta envoltorio '$($primeros[0])'. Debe traer las rutas desde la raíz del repo. Pídele a la IA que lo vuelva a armar."
  }
  $escritos = 0
  foreach ($e in $entradas) {
    $rel = $e.FullName.Replace('\', '/')
    if ($rel -eq 'borrar.txt') { continue }
    $dest = Seguro $rel
    if ($Simular) { Write-Host "[simulación] escribiría $rel"; continue }
    $dir = Split-Path -Parent $dest
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    [IO.Compression.ZipFileExtensions]::ExtractToFile($e, $dest, $true)
    Write-Host "escrito  $rel"; $escritos++
  }
  $b = $entradas | Where-Object { $_.FullName.Replace('\', '/') -eq 'borrar.txt' }
  $borrados = 0
  if ($b) {
    $sr = New-Object IO.StreamReader($b.Open(), [Text.Encoding]::UTF8)
    $lineas = $sr.ReadToEnd() -split "`r?`n"; $sr.Close()
    foreach ($l in $lineas) {
      $rel = $l.Trim().Replace('\', '/')
      if ($rel -eq '' -or $rel.StartsWith('#')) { continue }
      $dest = Seguro $rel
      if ($Simular) { Write-Host "[simulación] borraría $rel"; continue }
      if (Test-Path $dest) { Remove-Item $dest -Recurse -Force; Write-Host "borrado  $rel"; $borrados++ } else { Write-Host "ya no existe  $rel" }
    }
  }
} finally { $z.Dispose() }
Write-Host "`nListo: $escritos escritos, $borrados borrados." -ForegroundColor Green
Set-Location $raiz
git status --short
