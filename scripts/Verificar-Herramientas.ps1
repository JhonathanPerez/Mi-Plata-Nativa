<# Revisa que tengas lo necesario. Resultado esperado: una línea OK por herramienta. #>
. "$PSScriptRoot\_comun.ps1"
$falta = 0
function Probar($nombre, $cmd, $ayuda) {
  if (Get-Command $cmd -ErrorAction SilentlyContinue) { Write-Host "OK   $nombre" -ForegroundColor Green }
  else { Write-Host "FALTA $nombre -> $ayuda" -ForegroundColor Yellow; $script:falta++ }
}
Probar 'Git' 'git' 'winget install --id Git.Git -e'
Probar 'GitHub CLI (gh)' 'gh' 'winget install --id GitHub.cli -e'
Probar 'Node.js y npm (solo commitlint/release)' 'npm' 'winget install --id OpenJS.NodeJS.LTS -e'
$jb = Find-JavaBin
if ($jb) { Write-Host "OK   JDK en $jb" -ForegroundColor Green } else { Write-Host 'FALTA JDK 17+ (viene con Android Studio: carpeta jbr)' -ForegroundColor Yellow; $falta++ }
$adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
if (Test-Path $adb) { Write-Host 'OK   adb (Android SDK)' -ForegroundColor Green } else { Write-Host 'AVISO adb no está; se instala con Android Studio (SDK Platform-Tools)' -ForegroundColor Yellow }
if (Get-Command gh -ErrorAction SilentlyContinue) {
  $ErrorActionPreference = 'Continue'
  gh auth status *> $null
  $ErrorActionPreference = 'Stop'
  if ($LASTEXITCODE -eq 0) { Write-Host 'OK   gh con sesión iniciada' -ForegroundColor Green } else { Write-Host 'FALTA iniciar sesión: gh auth login' -ForegroundColor Yellow; $falta++ }
}
if ($falta -gt 0) { Write-Host "`nFaltan $falta cosas. Instálalas y vuelve a correr este script." -ForegroundColor Red; exit 1 }
Write-Host "`nTodo listo." -ForegroundColor Green
