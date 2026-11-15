<#
 Crea el Gradle wrapper (gradlew, gradlew.bat, gradle/wrapper/*) verificando el SHA-256 de la distribución.
 Uso:  ./scripts/Crear-GradleWrapper.ps1 -Version 9.7.1      (sin -Version usa la versión actual que publica gradle.org)
 La IA de la etapa 01 te dice qué versión usar (compatible con el AGP elegido).
 Resultado esperado: archivos gradlew, gradlew.bat y gradle/wrapper/gradle-wrapper.jar en la raíz del repo.
#>
param([string]$Version)
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot; Set-Location $raiz
$jb = Find-JavaBin
if (-not $jb) { throw 'No encuentro Java. Instala Android Studio (trae un JDK en la carpeta jbr) o un JDK 17.' }
$env:JAVA_HOME = Split-Path -Parent $jb
if (-not $Version) { $Version = (Invoke-RestMethod 'https://services.gradle.org/versions/current').version; Write-Host "Versión actual de Gradle: $Version" }
$tmp = Join-Path ([IO.Path]::GetTempPath()) "gradle-$Version"
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
$zip = Join-Path $tmp "gradle-$Version-bin.zip"
Write-Host "1/4 Descargando Gradle $Version..."
Invoke-WebRequest "https://services.gradle.org/distributions/gradle-$Version-bin.zip" -OutFile $zip
$sha = (Invoke-WebRequest "https://services.gradle.org/distributions/gradle-$Version-bin.zip.sha256").Content
if ($sha -is [byte[]]) { $sha = [Text.Encoding]::ASCII.GetString($sha) }
$sha = $sha.Trim().Split(' ')[0].ToLower()
Write-Host '2/4 Verificando SHA-256...'
$real = (Get-FileHash $zip -Algorithm SHA256).Hash.ToLower()
if ($real -ne $sha) { throw "SHA-256 distinto. Esperado $sha, real $real. Descarga corrupta." }
Write-Host '3/4 Extrayendo...'
Expand-Archive $zip -DestinationPath $tmp -Force
Write-Host '4/4 Generando el wrapper...'
Invoke-Native (Join-Path $tmp "gradle-$Version\bin\gradle.bat") @('wrapper', '--gradle-version', $Version, '--distribution-type', 'bin', '--gradle-distribution-sha256-sum', $sha)
Write-Host "`nWrapper listo (Gradle $Version)." -ForegroundColor Green
