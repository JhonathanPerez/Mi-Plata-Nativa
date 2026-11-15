# Funciones comunes. Se usa con:  . "$PSScriptRoot\_comun.ps1"
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch { }

$script:Repo = 'JhonathanPerez/Mi-Plata-Nativa'

function Get-RepoRoot {
  $raiz = Split-Path -Parent $PSScriptRoot
  if (-not (Test-Path (Join-Path $raiz 'AGENTS.md'))) { throw "No encuentro AGENTS.md en $raiz. Corre los scripts desde el repo nuevo." }
  return $raiz
}

function Write-Utf8([string]$Ruta, [string]$Texto) {
  $dir = Split-Path -Parent $Ruta
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
  [System.IO.File]::WriteAllText($Ruta, $Texto, (New-Object System.Text.UTF8Encoding($false)))
}

function Read-Utf8([string]$Ruta) { return [System.IO.File]::ReadAllText($Ruta, [System.Text.Encoding]::UTF8) }

function Require-Command([string]$Nombre, [string]$Ayuda) {
  if (-not (Get-Command $Nombre -ErrorAction SilentlyContinue)) { throw "Falta '$Nombre'. $Ayuda" }
}

function Invoke-Native([string]$Exe, [string[]]$Argumentos) {
  & $Exe @Argumentos
  if ($LASTEXITCODE -ne 0) { throw "Falló: $Exe $($Argumentos -join ' ') (código $LASTEXITCODE)" }
}

function Get-Etapas([string]$Raiz) {
  return (Read-Utf8 (Join-Path $Raiz 'docs/etapas.json')) | ConvertFrom-Json
}

function Find-JavaBin {
  $c = @()
  if ($env:JAVA_HOME) { $c += (Join-Path $env:JAVA_HOME 'bin') }
  $c += "$env:ProgramFiles\Android\Android Studio\jbr\bin"
  $c += "$env:LOCALAPPDATA\Programs\Android Studio\jbr\bin"
  foreach ($d in $c) { if (Test-Path (Join-Path $d 'java.exe')) { return $d } }
  $j = Get-Command java -ErrorAction SilentlyContinue
  if ($j) { return (Split-Path -Parent $j.Source) }
  return $null
}
