# Etapa 13 — Agrega capturas pendientes, ajustes con DataStore y apps de captura

| Dato | Valor |
|---|---|
| Rama | `feat/captura-pendientes-y-ajustes` |
| Título del PR | `feat(captura): agrega capturas pendientes, ajustes con DataStore y apps de captura` |
| Tamaño | **S** (adjuntos ≈ 27 KB ≈ 7.8k tokens) |
| Zip esperado | `etapa-13-pendientes-y-ajustes.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-13` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(captura): porta las pruebas de capturas pendientes`
2. `feat(captura): implementa capturas pendientes, spam aprendido y ajustes en DataStore`
3. `docs(estado): registra el cierre de la etapa 13` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 13`:

- `src/repositories/pendingCaptureRepository.ts`
- `src/repositories/learnedSpamRepository.ts`
- `src/repositories/settingsRepository.ts`
- `src/services/captureService.ts`
- `src/services/captureService.test.ts`
- `src/services/captureSync.ts`
- `src/services/captureAppsService.ts`
- `src/services/spamLearningService.ts`
- `src/services/settingsService.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Una compra detectada queda 'Por categorizar' con estados pendiente, aceptada, descartada o spam.
- Evita duplicados con una huella del mensaje.
- Sugiere cuenta/tarjeta solo por los últimos 4 dígitos.
- El texto del mensaje se borra al categorizar o descartar.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Casos de uso de captura y SettingsStore (DataStore).

Un solo zip `etapa-13-pendientes-y-ajustes.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
