<# Revisa en local la regla de convivencia (la misma que el CI): sin co.miplata.app y sin código del híbrido. Resultado esperado: 'Convivencia OK'. #>
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot; Set-Location $raiz
$mal = 0
$codigo = Get-ChildItem -Recurse -File -Include *.kt, *.kts, *.xml, *.toml, *.pro, *.properties, *.gradle -ErrorAction SilentlyContinue |
  Where-Object { $_.FullName -notmatch '\\(build|\.gradle|node_modules|docs|\.git)\\' }
foreach ($f in $codigo) { if (Select-String -Path $f.FullName -Pattern 'co\.miplata\.app' -Quiet) { Write-Host "co.miplata.app en $($f.FullName)" -ForegroundColor Red; $mal++ } }
$hib = Get-ChildItem -Recurse -File -Include *.tsx, capacitor.config.* -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch '\\(node_modules|\.git)\\' }
foreach ($f in $hib) { Write-Host "Código del híbrido en el repo: $($f.FullName)" -ForegroundColor Red; $mal++ }
if ($mal -gt 0) { exit 1 }
Write-Host 'Convivencia OK' -ForegroundColor Green
