<# Copia al portapapeles un prompt listo.  Uso: ./scripts/Copiar-Prompt.ps1 -Cual inicio|cierre|errores|portado #>
param([Parameter(Mandatory)][ValidateSet('inicio', 'cierre', 'errores', 'portado')][string]$Cual)
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot
$mapa = @{ inicio = '01-inicio-sesion.md'; cierre = '02-cierre-sesion.md'; errores = '03-correccion-errores.md'; portado = '04-portar-reglas-con-pruebas.md' }
Set-Clipboard -Value (Read-Utf8 (Join-Path $raiz "prompts/$($mapa[$Cual])"))
Write-Host "Prompt '$Cual' copiado. Pégalo en el chat." -ForegroundColor Green
