# Etapa 30 — Agrega el bloqueo con huella, rostro o PIN

| Dato | Valor |
|---|---|
| Rama | `feat/seguridad-bloqueo-biometrico` |
| Título del PR | `feat(seguridad): agrega el bloqueo con huella, rostro o PIN` |
| Tamaño | **S** (adjuntos ≈ 16 KB ≈ 4.6k tokens) |
| Zip esperado | `etapa-30-bloqueo-biometrico.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-30` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(seguridad): porta las pruebas de la política de bloqueo`
2. `feat(seguridad): agrega el bloqueo biométrico y su pantalla de ajustes`
3. `docs(estado): registra el cierre de la etapa 30` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 30`:

- `src/app/LockGate.tsx`
- `src/lib/lockPolicy.ts`
- `src/lib/lockPolicy.test.ts`
- `src/services/lockService.ts`
- `src/lib/biometrics.ts`
- `src/pages/LockSettingsPage.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Pide huella, rostro o PIN al abrir la app.
- Tiempo de gracia configurable antes de volver a pedirlo.
- Se activa o desactiva en Ajustes.
- Oculta el contenido en la vista de apps recientes.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

BiometricPrompt con política de bloqueo probada.

Un solo zip `etapa-30-bloqueo-biometrico.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
