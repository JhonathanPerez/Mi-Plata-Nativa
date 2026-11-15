# Etapa 27 — Reescribe en Kotlin el lector de notificaciones

| Dato | Valor |
|---|---|
| Rama | `feat/captura-servicio-de-notificaciones` |
| Título del PR | `feat(captura): reescribe en Kotlin el lector de notificaciones` |
| Tamaño | **M** (adjuntos ≈ 49 KB ≈ 14.4k tokens) |
| Zip esperado | `etapa-27-servicio-de-notificaciones.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-27` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(captura): reescribe en Kotlin el servicio lector de notificaciones`
2. `feat(captura): agrega el guardado de capturas y el permiso de acceso`
3. `docs(estado): registra el cierre de la etapa 27` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 27`:

- `native/android/CaptureListenerService.java`
- `native/android/CaptureStore.java`
- `native/android/NotificationCapturePlugin.java`
- `src/lib/notificationCapture.ts`
- `src/hooks/useCaptureAccess.ts`
- `scripts/apply-android-native.mjs`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Lee solo las apps elegidas; por defecto solo las de SMS.
- Guarda únicamente mensajes con un monto en pesos.
- No pide permiso de SMS (los lee como notificaciones).
- Guía de 'ajustes restringidos' en Android 13+ y de batería en Xiaomi, Samsung, etc.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

NotificationListenerService en Kotlin con acción/permiso derivados de ${applicationId}.

Un solo zip `etapa-27-servicio-de-notificaciones.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
