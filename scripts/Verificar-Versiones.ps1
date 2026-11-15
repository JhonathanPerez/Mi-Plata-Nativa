<#
 Consulta Google Maven y Maven Central y muestra la ÚLTIMA versión ESTABLE de cada librería clave (sin alpha/beta/rc), y la versión actual de Gradle.
 Pégale la salida a la IA de la etapa 01. Resultado esperado: una tabla con ~20 filas.
#>
. "$PSScriptRoot\_comun.ps1"
$items = @(
  @('google', 'com.android.tools.build', 'gradle'),
  @('central', 'org.jetbrains.kotlin', 'kotlin-gradle-plugin'),
  @('central', 'com.google.devtools.ksp', 'symbol-processing-gradle-plugin'),
  @('central', 'com.google.dagger', 'hilt-android'),
  @('google', 'androidx.compose', 'compose-bom'),
  @('google', 'androidx.compose.material3', 'material3'),
  @('google', 'androidx.activity', 'activity-compose'),
  @('google', 'androidx.core', 'core-ktx'),
  @('google', 'androidx.lifecycle', 'lifecycle-viewmodel-compose'),
  @('google', 'androidx.navigation', 'navigation-compose'),
  @('google', 'androidx.room', 'room-runtime'),
  @('google', 'androidx.datastore', 'datastore-preferences'),
  @('google', 'androidx.work', 'work-runtime-ktx'),
  @('google', 'androidx.biometric', 'biometric'),
  @('google', 'androidx.hilt', 'hilt-navigation-compose'),
  @('google', 'androidx.documentfile', 'documentfile'),
  @('central', 'org.jetbrains.kotlinx', 'kotlinx-coroutines-core'),
  @('central', 'org.jetbrains.kotlinx', 'kotlinx-serialization-json'),
  @('central', 'junit', 'junit'),
  @('central', 'io.mockk', 'mockk'),
  @('central', 'app.cash.turbine', 'turbine'),
  @('central', 'org.robolectric', 'robolectric')
)
$res = foreach ($i in $items) {
  $base = if ($i[0] -eq 'google') { 'https://dl.google.com/dl/android/maven2' } else { 'https://repo1.maven.org/maven2' }
  $url = "$base/$($i[1].Replace('.', '/'))/$($i[2])/maven-metadata.xml"
  try {
    [xml]$x = (Invoke-WebRequest $url -UseBasicParsing).Content
    $v = $x.metadata.versioning.versions.version | Where-Object { $_ -match '^\d+(\.\d+){1,3}$' } | Sort-Object { [version]$_ } | Select-Object -Last 1
    [pscustomobject]@{ Libreria = "$($i[1]):$($i[2])"; UltimaEstable = $v }
  } catch { [pscustomobject]@{ Libreria = "$($i[1]):$($i[2])"; UltimaEstable = 'ERROR al consultar' } }
}
$res | Format-Table -AutoSize
try { Write-Host ('Gradle actual: ' + (Invoke-RestMethod 'https://services.gradle.org/versions/current').version) } catch { Write-Host 'Gradle: no se pudo consultar' }
Write-Host 'Compara con docs/VERSIONES.md. KSP (esquema nuevo 2.3.x) puede no aparecer si Maven lo ordena distinto: confirma en github.com/google/ksp/releases.'
