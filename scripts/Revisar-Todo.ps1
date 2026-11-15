<# Corre en tu PC lo mismo que el CI: lint, pruebas unitarias y compilación debug. Resultado esperado: BUILD SUCCESSFUL. #>
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot; Set-Location $raiz
if (-not (Test-Path .\gradlew.bat)) { throw 'No hay gradlew.bat todavía (se crea en la etapa 01 con Crear-GradleWrapper.ps1).' }
$jb = Find-JavaBin; if ($jb) { $env:JAVA_HOME = Split-Path -Parent $jb }
Invoke-Native .\gradlew.bat @('lintDebug', 'testDebugUnitTest', 'assembleDebug', '--console=plain')
Write-Host 'Todo en verde.' -ForegroundColor Green
