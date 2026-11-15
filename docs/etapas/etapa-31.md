# Etapa 31 — Reescribe en Kotlin las copias automáticas programadas

| Dato | Valor |
|---|---|
| Rama | `feat/copias-automaticas-programadas` |
| Título del PR | `feat(copias): reescribe en Kotlin las copias automáticas programadas` |
| Tamaño | **M** (adjuntos ≈ 62 KB ≈ 18.2k tokens) |
| Zip esperado | `etapa-31-automaticas-programadas.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-31` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(copias): porta las pruebas de horarios y de copias automáticas`
2. `feat(copias): reescribe en Kotlin la programación de copias con WorkManager`
3. `feat(copias): guarda las copias locales y conserva solo las últimas 5`
4. `docs(estado): registra el cierre de la etapa 31` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 31`:

- `native/android/BackupWorker.java`
- `native/android/BackupScheduler.java`
- `native/android/BackupScheduleStore.java`
- `native/android/BackupTiming.java`
- `native/android/BackupSchedulePlugin.java`
- `native/android/BackupNames.java`
- `native/android/RawDump.java`
- `native/android/SqliteDumpSource.java`
- `src/lib/autoBackup.ts`
- `src/lib/autoBackup.test.ts`
- `src/lib/backgroundBackup.ts`
- `src/app/AutoBackupSync.tsx`
- `src/services/autoBackupService.ts`
- `src/services/autoBackupService.test.ts`
- `src/lib/backupStore.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Copia por frecuencia y hora elegidas, aun con la app cerrada.
- Se guardan localmente y se conservan las últimas 5.
- Hoy la tarea en segundo plano escribe un 'volcado crudo' que luego se convierte; en la nativa usa Room y escribe la copia normal.
- Primera copia no reemplaza copias buenas si la app está vacía.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Worker en Kotlin que usa los casos de uso (defecto D-02).

Un solo zip `etapa-31-automaticas-programadas.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
