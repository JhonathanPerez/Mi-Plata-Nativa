# Etapa 28 — Agrega las pantallas de Por categorizar y de configuración de captura

| Dato | Valor |
|---|---|
| Rama | `feat/captura-por-categorizar` |
| Título del PR | `feat(captura): agrega las pantallas de Por categorizar y de configuración de captura` |
| Tamaño | **S** (adjuntos ≈ 25 KB ≈ 7.2k tokens) |
| Zip esperado | `etapa-28-por-categorizar.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-28` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(captura): agrega la pantalla Por categorizar`
2. `feat(captura): agrega la configuración y la elección de apps de captura`
3. `docs(estado): registra el cierre de la etapa 28` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 28`:

- `src/pages/PendingPage.tsx`
- `src/components/expenses/PendingRow.tsx`
- `src/pages/CaptureSetupPage.tsx`
- `src/pages/TrackedAppsPage.tsx`
- `src/components/capture/CaptureAppsSheet.tsx`
- `src/services/captureAppsService.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Por categorizar: eliges solo la categoría y el gasto queda registrado.
- Descartar o marcar como spam.
- Pegar un mensaje explica por qué se detecta o no.
- Elegir las apps que se vigilan.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantallas de captura con ViewModel.

Un solo zip `etapa-28-por-categorizar.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
