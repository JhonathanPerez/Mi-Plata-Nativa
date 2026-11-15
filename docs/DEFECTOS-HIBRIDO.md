# DEFECTOS Y MEJORAS DETECTADAS EN EL HÍBRIDO

Estado: **confirmado** (visto en el código del zip) o **probable** (hay que verificar al portar). Cada etapa indica cuál corrige.

| Id | Qué pasa hoy | Evidencia | Corrección en la nativa | Etapa | Estado |
|---|---|---|---|---|---|
| D-01 | Dos lectores de notificaciones (TS y Java) que hay que «mantener en sintonía» | README, `ExpenseTextParser.java` y `parseNotification.ts` | Un solo parser Kotlin en `:core:domain` | 06 | confirmado |
| D-02 | La tarea en segundo plano escribe un volcado crudo (`mi-plata-raw-dump`) que luego se convierte; el mapeo de filas está duplicado | `RawDump.java`, `rawDump.ts` | El worker usa Room y escribe la copia normal; el volcado crudo solo se lee al importar | 31 | confirmado |
| D-03 | «Restaurar» reemplaza TODOS los datos (`replaceAll`) | `backupService.restore` | Importación guiada que no borra nada | 17 | confirmado |
| D-04 | La cadena de avisos de pendientes usa AlarmManager y no hay receptor de arranque (no aparece `BOOT_COMPLETED`) | búsqueda en `native/` y `scripts/` | Receptor de arranque que reprograma | 29 | probable |
| D-05 | Se declara `SCHEDULE_EXACT_ALARM`; en Android 14+ puede venir denegado | `apply-android-native.mjs` | Pedirlo solo si hace falta y degradar a alarma inexacta con aviso claro | 29 | probable |
| D-06 | La migración 004 asigna reglas de ciclo a `pm_nubank` y `pm_davibank` (datos personales del dueño dentro de una migración) | `004_paid_status_and_cycles.ts` | No se siembra nada personal; esas reglas viajan solo en la importación; plantillas opcionales de ciclo | 09 / 24 | confirmado |
| D-07 | El manifiesto y el FileProvider se inyectan con expresiones regulares sobre un `android/` generado | `apply-android-native.mjs` | Manifiesto declarativo con `${applicationId}` | 01 / 33 | confirmado |
| D-08 | La contraseña de las copias en la nube tuvo una versión que vivía en `localStorage` del WebView (hay migración) | `backupSecret.ts` | Solo Android Keystore; no existe localStorage | 32 | confirmado |
| D-09 | Consulta a la API pública de GitHub sin credenciales (60 por hora) | README | Mantener 1 consulta por hora y usar `ETag` / `If-None-Match` | 33 | mejora |
| D-10 | `UPDATE_REPO` fijo en una constante del código web | `constants.ts` | `BuildConfig` con el repo nuevo | 33 | confirmado |
| D-11 | `supabase/schema.sql` en el repo sin uso en `src` | zip | No se porta | — | confirmado |
| D-12 | Pruebas de CSS (`hygiene.test.ts`, `tokens.test.ts`) atadas al stack web | `src/styles/` | No se portan; pruebas del tema Compose | 15 | confirmado |

Cada defecto corregido se anota en el PR de su etapa. Los que cambian algo visible para el dueño pasan por la pregunta de cambios.
