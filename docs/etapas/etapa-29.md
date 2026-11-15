# Etapa 29 — Reescribe en Kotlin los recordatorios con la app cerrada

| Dato | Valor |
|---|---|
| Rama | `feat/recordatorios-avisos-de-pago-y-pendientes` |
| Título del PR | `feat(recordatorios): reescribe en Kotlin los recordatorios con la app cerrada` |
| Tamaño | **M** (adjuntos ≈ 54 KB ≈ 15.8k tokens) |
| Zip esperado | `etapa-29-avisos-de-pago-y-pendientes.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-29` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(recordatorios): reescribe en Kotlin los avisos de pago y de pendientes`
2. `feat(recordatorios): agrega la pantalla de ajustes de recordatorios`
3. `docs(estado): registra el cierre de la etapa 29` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 29`:

- `native/android/PendingReminderReceiver.java`
- `native/android/res/ic_stat_miplata.xml`
- `src/lib/localNotifications.ts`
- `src/services/reminderService.ts`
- `src/services/reminderService.test.ts`
- `src/services/reminderSync.ts`
- `src/app/ReminderSync.tsx`
- `src/components/cards/ReminderSettingsCard.tsx`
- `src/components/cards/PendingReminderCard.tsx`
- `src/components/cards/useReminderStatus.ts`
- `src/pages/PaymentRemindersPage.tsx`
- `src/pages/PendingRemindersPage.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Aviso de pago con N días de anticipación y hora elegida.
- Aviso de pendientes repetido cada N minutos mientras no abras la app.
- Pide permiso de notificaciones (Android 13+) y de alarmas exactas.
- El aviso funciona con la app cerrada.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

WorkManager/AlarmManager en Kotlin, reprogramación al reiniciar el teléfono (defecto D-04).

Un solo zip `etapa-29-avisos-de-pago-y-pendientes.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
