<#
 Crea el repo nuevo en GitHub (público) desde la carpeta del kit. Corre UNA vez, en la etapa 00.
 Resultado esperado: repo https://github.com/JhonathanPerez/Mi-Plata-Nativa con main (commit vacío inicial) y squash como única fusión.
 Los archivos del kit quedan SIN commitear: los commiteas tú en la rama chore/repo-kit-inicial.
#>
. "$PSScriptRoot\_comun.ps1"
$raiz = Get-RepoRoot
Set-Location $raiz
Require-Command git 'winget install --id Git.Git -e'
Require-Command gh 'winget install --id GitHub.cli -e'
Require-Command npm 'winget install --id OpenJS.NodeJS.LTS -e'

if (Test-Path (Join-Path $raiz '.git')) { throw 'Esta carpeta ya es un repositorio Git. Si ya lo creaste, salta este script.' }

Write-Host '1/5 Inicializando Git (rama main) y commit inicial vacío...'
Invoke-Native git @('init', '-b', 'main')
Invoke-Native git @('commit', '--allow-empty', '-m', 'chore(repo): inicializa el repositorio')

Write-Host "2/5 Creando $script:Repo (público) y subiendo main..."
Invoke-Native gh @('repo', 'create', $script:Repo, '--public', '--source', '.', '--remote', 'origin', '--push', '--description', 'Mi Plata Nativa: control de gastos personales para Colombia (Kotlin + Jetpack Compose)')

Write-Host '3/5 Configurando fusiones: solo squash, título y cuerpo del PR como commit, borrar rama al fusionar...'
Invoke-Native gh @('repo', 'edit', $script:Repo, '--enable-squash-merge', '--enable-merge-commit=false', '--enable-rebase-merge=false', '--delete-branch-on-merge')
Invoke-Native gh @('api', '-X', 'PATCH', "repos/$script:Repo", '-f', 'squash_merge_commit_title=PR_TITLE', '-f', 'squash_merge_commit_message=PR_BODY')

Write-Host '4/5 Instalando herramientas de commits (npm install; crea package-lock.json y activa el hook de commit)...'
Invoke-Native npm @('install')

Write-Host '5/5 Listo.' -ForegroundColor Green
Write-Host 'Siguiente: git switch -c chore/repo-kit-inicial  y luego los pasos de docs/GUIA-WINDOWS.md (sección 3).'
