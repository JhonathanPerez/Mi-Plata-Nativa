<#
 Baja las fuentes del tema (Bricolage Grotesque y Figtree, licencia OFL) como TTF variables a core/designsystem/src/main/res/font/.
 Resultado esperado: figtree_variable.ttf y bricolage_grotesque_variable.ttf (verificados como TTF).
 Si GitHub cambió la ruta, pasa -UrlFigtree / -UrlBricolage con la dirección directa del .ttf y dile a la IA.
#>
param(
  [string]$UrlFigtree = 'https://github.com/google/fonts/raw/main/ofl/figtree/Figtree%5Bwght%5D.ttf',
  [string]$UrlBricolage = 'https://github.com/google/fonts/raw/main/ofl/bricolagegrotesque/BricolageGrotesque%5Bopsz%2Cwdth%2Cwght%5D.ttf'
)
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot
$dest = Join-Path $raiz 'core/designsystem/src/main/res/font'
New-Item -ItemType Directory -Path $dest -Force | Out-Null
function Bajar($url, $nombre) {
  $f = Join-Path $dest $nombre
  Invoke-WebRequest $url -OutFile $f
  $b = [IO.File]::ReadAllBytes($f)
  $ok = ($b.Length -gt 50000) -and ((($b[0] -eq 0 -and $b[1] -eq 1 -and $b[2] -eq 0 -and $b[3] -eq 0)) -or ([Text.Encoding]::ASCII.GetString($b, 0, 4) -in @('OTTO', 'true')))
  if (-not $ok) { Remove-Item $f -Force; throw "$nombre no es un TTF válido (¿cambió la URL?). Prueba con -UrlFigtree/-UrlBricolage." }
  Write-Host "OK $nombre ($([math]::Round($b.Length/1024)) KB)" -ForegroundColor Green
}
Bajar $UrlFigtree 'figtree_variable.ttf'
Bajar $UrlBricolage 'bricolage_grotesque_variable.ttf'
Write-Host 'Licencia OFL: conserva el aviso en la pantalla Acerca de.'
