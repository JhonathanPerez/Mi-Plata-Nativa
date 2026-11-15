<#
 Publica la etapa: sube la rama, abre el PR (título de docs/etapas.json), espera el CI, fusiona con squash, borra la rama y pone el tag hito-etapa-NN.
 Uso:  ./scripts/Publicar-PR.ps1 -Etapa 2          (con -SinFusionar solo abre el PR)
 Debes estar en la rama de la etapa con todo commiteado. Resultado esperado: 'Etapa NN fusionada' y el tag de hito en GitHub.
#>
param([Parameter(Mandatory)][int]$Etapa, [switch]$SinFusionar)
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot; Set-Location $raiz
Require-Command gh 'winget install --id GitHub.cli -e'
$e = Get-Etapas $raiz | Where-Object { $_.n -eq $Etapa }
if (-not $e) { throw "No hay etapa $Etapa en docs/etapas.json" }
$rama = (git branch --show-current).Trim()
if ($rama -ne $e.branch) { throw "Estás en '$rama' y la etapa $Etapa usa '$($e.branch)'. Cambia con: git switch $($e.branch)" }
if (git status --porcelain) { throw 'Hay cambios sin commitear. Haz commit antes de publicar.' }

# Pies «Cambio-pedido» de los commits de la rama: van al cuerpo del PR (y de ahí al commit de squash).
$pies = @(git log "origin/main..HEAD" --format=%B | Where-Object { $_ -match '^Cambio-pedido:\s*CHG-\d+' } | ForEach-Object { $_.Trim() } | Sort-Object -Unique)
$plantilla = Read-Utf8 (Join-Path $raiz '.github/pull_request_template.md')
$cuerpo = $plantilla.Replace('{{ETAPA}}', ('{0:D2}' -f $Etapa)).Replace('{{FICHA}}', "docs/etapas/etapa-$('{0:D2}' -f $Etapa).md")
if ($pies.Count -gt 0) { $cuerpo = $cuerpo.TrimEnd() + "`n`n" + ($pies -join "`n") + "`n" }
$tmp = Join-Path ([IO.Path]::GetTempPath()) "pr-etapa-$Etapa.md"
Write-Utf8 $tmp $cuerpo

Write-Host "1/4 Subiendo la rama $rama..."
Invoke-Native git @('push', '-u', 'origin', $rama)
Write-Host "2/4 Abriendo el PR: $($e.title)"
$ErrorActionPreference = 'Continue'
gh pr view $rama --json number *> $null
$hayPr = ($LASTEXITCODE -eq 0)
$ErrorActionPreference = 'Stop'
if (-not $hayPr) { Invoke-Native gh @('pr', 'create', '--base', 'main', '--head', $rama, '--title', $e.title, '--body-file', $tmp) }
else { Write-Host 'El PR ya existía; se reutiliza.' }
if ($SinFusionar) { Write-Host 'PR abierto (sin fusionar).' -ForegroundColor Green; exit 0 }

Write-Host '3/4 Esperando el CI (puede tardar varios minutos)...'
Start-Sleep -Seconds 15
gh pr checks $rama --watch
if ($LASTEXITCODE -ne 0) { throw 'El CI falló. Mira el PR en GitHub, usa el prompt de corrección de errores, haz un commit fix(...) y vuelve a correr este script.' }

Write-Host '4/4 Fusionando (squash) y poniendo el hito...'
$cuerpoMerge = if ($pies.Count -gt 0) { $pies -join "`n" } else { '' }
Invoke-Native gh @('pr', 'merge', $rama, '--squash', '--subject', $e.title, '--body', $cuerpoMerge, '--delete-branch')
Invoke-Native git @('switch', 'main')
Invoke-Native git @('pull', '--ff-only')
Invoke-Native git @('tag', $e.hito)
Invoke-Native git @('push', 'origin', $e.hito)
Write-Host "`nEtapa $('{0:D2}' -f $Etapa) fusionada. Tag de hito: $($e.hito)" -ForegroundColor Green
