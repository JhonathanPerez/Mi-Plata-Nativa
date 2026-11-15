<#
 Instala en tu teléfono (USB, depuración activada) el APK debug o uno que indiques. Convive con el híbrido y con la nativa de release.
 Uso:  ./scripts/Instalar-Debug.ps1            ./scripts/Instalar-Debug.ps1 -Apk "C:\ruta\mi-plata-nativa-v1.0.0.apk"
 Resultado esperado: 'Success'. Para ver tus dispositivos antes:  adb devices
#>
param([string]$Apk)
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot
$adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
if (-not (Test-Path $adb)) { throw 'No encuentro adb. Instala Android SDK Platform-Tools desde Android Studio (SDK Manager).' }
if (-not $Apk) { $Apk = Join-Path $raiz 'app\build\outputs\apk\debug\app-debug.apk' }
if (-not (Test-Path $Apk)) { throw "No existe el APK: $Apk. Corre antes ./scripts/Revisar-Todo.ps1" }
& $adb devices
Invoke-Native $adb @('install', '-r', $Apk)
