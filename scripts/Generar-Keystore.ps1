<#
 Genera el keystore NUEVO de la nativa (PKCS12, RSA 4096, validez ≈ 100 años) FUERA del repo, en %USERPROFILE%\.mi-plata-nativa\.
 Las contraseñas se generan al azar, se muestran UNA vez y se guardan cifradas con tu usuario de Windows (para Cargar-Secretos.ps1).
 Uso:  ./scripts/Generar-Keystore.ps1
 IMPORTANTE (manual): guarda una copia del .jks y las contraseñas en un lugar seguro. Si los pierdes no podrás publicar actualizaciones.
#>
. "$PSScriptRoot\_comun.ps1"
$jb = Find-JavaBin
if (-not $jb -or -not (Test-Path (Join-Path $jb 'keytool.exe'))) { throw 'No encuentro keytool.exe (viene con el JDK de Android Studio).' }
$dir = Join-Path $env:USERPROFILE '.mi-plata-nativa'
New-Item -ItemType Directory -Path $dir -Force | Out-Null
$jks = Join-Path $dir 'mi-plata-nativa.jks'
if (Test-Path $jks) { throw "Ya existe $jks. No lo sobrescribo (cambiar de llave rompe las actualizaciones). Bórralo a mano solo si aún no publicaste nada." }
$alias = 'mi-plata-nativa'
$chars = [char[]](48..57 + 65..90 + 97..122)
$rng = [Security.Cryptography.RandomNumberGenerator]::Create()
$bytes = New-Object byte[] 32; $rng.GetBytes($bytes)
$pass = -join ($bytes | ForEach-Object { $chars[$_ % $chars.Length] })
& (Join-Path $jb 'keytool.exe') -genkeypair -v -keystore $jks -storetype PKCS12 -alias $alias -keyalg RSA -keysize 4096 -validity 36500 `
  -storepass $pass -keypass $pass -dname 'CN=Mi Plata Nativa, O=Mi Plata, C=CO'
if ($LASTEXITCODE -ne 0) { throw 'keytool falló.' }
$cfg = [ordered]@{ alias = $alias; password = ($pass | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString) }
Write-Utf8 (Join-Path $dir 'secretos.json') ($cfg | ConvertTo-Json)
$fp = & (Join-Path $jb 'keytool.exe') -list -v -keystore $jks -storepass $pass -alias $alias | Select-String 'SHA256:'
Write-Host "`nKeystore: $jks" -ForegroundColor Green
Write-Host "Alias: $alias"
Write-Host "Contraseña (guárdala AHORA en tu gestor de contraseñas; no se vuelve a mostrar): $pass" -ForegroundColor Yellow
Write-Host "Huella $($fp.ToString().Trim())"
Write-Host "`nSiguiente: ./scripts/Cargar-Secretos.ps1"
