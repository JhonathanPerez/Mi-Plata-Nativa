<#
 Carga los 4 secretos de CI en el repo: ANDROID_KEYSTORE_B64, ANDROID_KEYSTORE_PASSWORD, ANDROID_KEY_ALIAS, ANDROID_KEY_PASSWORD.
 Uso:  ./scripts/Cargar-Secretos.ps1            (carga)      ./scripts/Cargar-Secretos.ps1 -Solo Verificar   (solo lista los existentes)
 Resultado esperado: los 4 nombres aparecen en 'gh secret list'. Los valores nunca se imprimen.
#>
param([ValidateSet('Cargar', 'Verificar')][string]$Solo = 'Cargar')
. "$PSScriptRoot\_comun.ps1"
Require-Command gh 'winget install --id GitHub.cli -e'
$nombres = 'ANDROID_KEYSTORE_B64', 'ANDROID_KEYSTORE_PASSWORD', 'ANDROID_KEY_ALIAS', 'ANDROID_KEY_PASSWORD'
if ($Solo -eq 'Cargar') {
  $dir = Join-Path $env:USERPROFILE '.mi-plata-nativa'
  $jks = Join-Path $dir 'mi-plata-nativa.jks'; $cfgRuta = Join-Path $dir 'secretos.json'
  if (-not (Test-Path $jks) -or -not (Test-Path $cfgRuta)) { throw 'Primero corre ./scripts/Generar-Keystore.ps1' }
  $cfg = (Read-Utf8 $cfgRuta) | ConvertFrom-Json
  $sec = $cfg.password | ConvertTo-SecureString
  $pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec))
  $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($jks))
  Invoke-Native gh @('secret','set','ANDROID_KEYSTORE_B64','--repo',$script:Repo,'--body',$b64)
  Invoke-Native gh @('secret','set','ANDROID_KEYSTORE_PASSWORD','--repo',$script:Repo,'--body',$pass)
  Invoke-Native gh @('secret','set','ANDROID_KEY_ALIAS','--repo',$script:Repo,'--body',$cfg.alias)
  Invoke-Native gh @('secret','set','ANDROID_KEY_PASSWORD','--repo',$script:Repo,'--body',$pass)
}
$lista = gh secret list --repo $script:Repo
$lista | ForEach-Object { Write-Host $_ }
$falta = $nombres | Where-Object { -not ($lista -match $_) }
if ($falta) { Write-Host "Faltan: $($falta -join ', ')" -ForegroundColor Red; exit 1 }
Write-Host 'Los 4 secretos existen.' -ForegroundColor Green
