# GUÍA DE WINDOWS 11 — paso a paso

Todo se corre en **PowerShell** (menú Inicio → «Terminal» o «PowerShell»). Cada paso dice el comando y el resultado esperado.
Lo único que haces a mano de forma recurrente: **crear la rama y hacer los commits**.

## 1. Una sola vez: herramientas
1. Abre PowerShell y permite scripts locales: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` → responde `S`. *Esperado: sin error.*
2. Instala lo que falte (cada comando solo si no lo tienes):
   `winget install --id Git.Git -e` · `winget install --id GitHub.cli -e` · `winget install --id OpenJS.NodeJS.LTS -e` · `winget install --id Google.AndroidStudio -e`.
   Cierra y abre PowerShell. *Esperado: `git --version` y `gh --version` muestran versión.*
3. Abre Android Studio una vez y deja que instale el SDK (incluye *SDK Platform-Tools*).
4. Inicia sesión en GitHub: `gh auth login` → GitHub.com → HTTPS → navegador. *Esperado: «Logged in as JhonathanPerez».*
5. Configura Git (si nunca lo hiciste): `git config --global user.name "Tu Nombre"` y `git config --global user.email "tu@correo"`.
6. Dile dónde está el repo híbrido (solo se lee): `setx MIPLATA_HIBRIDO "C:\ruta\a\Mi-Plata-App"` y abre una PowerShell nueva.

## 2. Una sola vez: poner el kit en su carpeta
1. Crea la carpeta del repo nuevo, fuera del híbrido: `mkdir $HOME\dev\Mi-Plata-Nativa`.
2. Extrae el kit ahí: `Expand-Archive "$HOME\Downloads\mi-plata-nativa-kit.zip" -DestinationPath $HOME\dev\Mi-Plata-Nativa`.
   *Esperado: `ls $HOME\dev\Mi-Plata-Nativa` muestra `AGENTS.md`, `docs`, `scripts`… directamente (sin carpeta envoltorio).*
3. `cd $HOME\dev\Mi-Plata-Nativa` y desbloquea los scripts: `Get-ChildItem .\scripts\*.ps1 | Unblock-File`.
4. `./scripts/Verificar-Herramientas.ps1`. *Esperado: todas en OK.*

## 3. Etapa 00 (preparar el repo)
1. `./scripts/Crear-Repo.ps1`. *Esperado: repo público creado, `main` subido, `npm install` termina, mensaje «Listo».*
2. **Tú:** `git switch -c chore/repo-kit-inicial`
3. **Tú:** `git add -A` y `git commit -m "chore(repo): agrega el kit de trabajo del proyecto"`. *Esperado: el hook de commitlint no se queja.*
4. `./scripts/Publicar-PR.ps1 -Etapa 0`. *Esperado: PR abierto, CI en verde, fusionado, tag `hito-etapa-00`.*
5. Revisa en GitHub → Actions: el workflow *Release* aparece con sus jobs **omitidos** (está desactivado a propósito).

## 4. Ciclo de cada etapa (01 a 40)
1. `git switch main` y `git pull --ff-only`. *Esperado: «Already up to date» o los cambios de tu fusión anterior.*
2. `./scripts/Armar-Adjunto.ps1 -Etapa NN`. *Esperado: `adjunto-etapa-NN.md` y `.zip` en `Escritorio\adjuntos-mi-plata`.*
3. `./scripts/Copiar-Prompt.ps1 -Cual inicio`, abre un chat nuevo de IA, pega el prompt y adjunta el `.md` (o el `.zip`).
4. Responde la **pregunta de cambios** («Mantener igual» o «Cambiar»). La IA te devuelve `etapa-NN-nombre.zip` y tus pasos.
5. **Tú:** crea la rama que diga la ficha: `git switch -c <rama>` (por ejemplo `git switch -c feat/dominio-dinero-fechas-texto`).
6. `./scripts/Aplicar-Etapa.ps1 -Zip "$HOME\Downloads\etapa-NN-nombre.zip"`. *Esperado: lista de archivos escritos y `git status` con cambios.*
7. **Tú:** haz los commits que indica la IA, en orden (primero `test(...)`, luego `feat(...)`): `git add -A` y `git commit -m "..."`.
   Si hubo un cambio pedido, el commit lleva el pie: `git commit -m "feat(...): ..." -m "Cambio-pedido: CHG-01"`.
8. `./scripts/Revisar-Todo.ps1` (desde la etapa 01). *Esperado: BUILD SUCCESSFUL.* Si falla: `./scripts/Copiar-Prompt.ps1 -Cual errores`, pega el error y aplica el `fix-…zip` con otro commit `fix(...)`.
9. Solo si la etapa lo pide: instalar en el teléfono con `./scripts/Instalar-Debug.ps1` (USB y depuración USB activada; `adb devices` debe listar tu teléfono).
10. Cierre: `./scripts/Copiar-Prompt.ps1 -Cual cierre`, pégalo en el mismo chat, descarga `cierre-etapa-NN.zip`, `./scripts/Aplicar-Etapa.ps1 -Zip ...` y
    **tú** haces el commit `git add -A` y `git commit -m "docs(estado): registra el cierre de la etapa NN"`.
11. `./scripts/Publicar-PR.ps1 -Etapa NN`. *Esperado: «Etapa NN fusionada. Tag de hito: hito-etapa-NN».*

## 5. Etapa 01 (esqueleto Gradle) — pasos extra
1. `./scripts/Verificar-Versiones.ps1` y pega la tabla a la IA (así no se inventan versiones).
2. Cuando la IA te diga la versión de Gradle: `./scripts/Crear-GradleWrapper.ps1 -Version X.Y.Z`. *Esperado: aparece `gradlew.bat`.*
3. Abre la carpeta en Android Studio (File → Open) y espera el *Sync*. *Esperado: «Gradle sync finished».*
4. Ejecuta la app en tu teléfono o emulador (botón ▶). *Esperado: «Mi Plata Nativa (debug)» junto a tu app híbrida, sin conflicto.*

## 6. Etapa 15 — fuentes
`./scripts/Descargar-Fuentes.ps1`. *Esperado: dos TTF en `core/designsystem/src/main/res/font`.* Esos archivos se commitean como parte de la etapa.

## 7. Etapas 37 y 39 — firma y secretos
1. `./scripts/Generar-Keystore.ps1`. *Esperado: keystore en `%USERPROFILE%\.mi-plata-nativa\`, contraseña mostrada UNA vez.*
2. **Manual (inevitable):** guarda la contraseña y una copia del `.jks` en tu gestor/almacenamiento seguro. Sin ellos no podrás actualizar la app.
3. `./scripts/Cargar-Secretos.ps1`. *Esperado: «Los 4 secretos existen».*

## 8. Etapa 40 — publicar 1.0.0
1. Con la nativa instalada en el teléfono, ve a **Importar desde Mi Plata híbrida**, elige tu copia (exportada desde el híbrido) y compara el resumen con las cifras del híbrido lado a lado.
2. `./scripts/Publicar-PR.ps1 -Etapa 40`. *Esperado: PR fusionado; en GitHub → Actions el workflow Release publica `v1.0.0` con `mi-plata-nativa-v1.0.0.apk`.*
3. En el teléfono: instala el APK (o `./scripts/Instalar-Debug.ps1 -Apk "ruta"`).

## 9. Pasar los datos del híbrido a la nativa
1. En el híbrido: Ajustes → copia de seguridad → exportar. Obtienes `MiPlata_copia_AAAA-MM-DD.json` (o la copia cifrada de la nube; necesitarás su contraseña).
2. En la nativa: Ajustes → **Importar desde Mi Plata híbrida** → elige el archivo → revisa el resumen → confirma.
3. Las dos apps conviven con datos separados: compara cifras lado a lado. La importación no borra nada.

## 10. Convivencia (importante)
Mientras tengas las dos apps instaladas, deja la **captura de notificaciones** y los **recordatorios** activos en UNA sola, para no recibir duplicados.
La nativa te lo avisa en la pantalla de importación y en Ajustes. Cuando dejes de usar el híbrido, desinstálalo.

## 11. Problemas frecuentes
| Síntoma | Qué hacer |
|---|---|
| «no se puede cargar el archivo… la ejecución de scripts está deshabilitada» | Paso 1.1 de esta guía |
| Un script sale con caracteres raros | Desbloquéalo: `Unblock-File .\scripts\*.ps1` |
| `Publicar-PR` dice que estás en otra rama | `git switch <rama de la ficha>` |
| El CI falla por el título del PR | Debe ser `tipo(ámbito): descripción` (máx. 100); lo trae el script desde `docs/etapas.json` |
| `INSTALL_FAILED_CONFLICTING_PROVIDER` | Algún identificador usa el paquete del híbrido: corre `./scripts/Verificar-Convivencia.ps1` y avisa a la IA |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Firma distinta (debug vs release): desinstala la nativa y vuelve a instalar (borra solo los datos de la nativa) |
