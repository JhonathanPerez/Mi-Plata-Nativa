# Etapa 32 — Agrega el envío de copias a la carpeta de la nube con cifrado

| Dato | Valor |
|---|---|
| Rama | `feat/copias-nube-cifrada` |
| Título del PR | `feat(copias): agrega el envío de copias a la carpeta de la nube con cifrado` |
| Tamaño | **M** (adjuntos ≈ 49 KB ≈ 14.2k tokens) |
| Zip esperado | `etapa-32-nube-cifrada.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-32` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(copias): agrega la carpeta de la nube con el selector de documentos`
2. `feat(copias): cifra las copias y guarda la contraseña en el Keystore`
3. `feat(copias): agrega la pantalla de copias automáticas`
4. `docs(estado): registra el cierre de la etapa 32` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 32`:

- `native/android/CloudFolderPlugin.java`
- `native/android/CloudFolderStore.java`
- `native/android/SecretStore.java`
- `src/lib/cloudFolder.ts`
- `src/lib/backupSecret.ts`
- `src/services/cloudBackupService.ts`
- `src/services/cloudBackupService.test.ts`
- `src/pages/AutoBackupPage.tsx`
- `src/components/backup/BackupPasswordSheet.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Eliges una carpeta (de Drive, etc.) y las copias se envían solas.
- Copias cifradas con contraseña de mínimo 8 caracteres (AES-256-GCM).
- Si olvidas la contraseña no hay forma de recuperar la copia.
- Muestra la hora del último envío y el motivo del último fallo.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

SAF + Keystore + cifrado, con pantalla de copias automáticas.

Un solo zip `etapa-32-nube-cifrada.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
