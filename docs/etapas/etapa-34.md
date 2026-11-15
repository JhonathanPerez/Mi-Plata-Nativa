# Etapa 34 — Agrega la pantalla de ajustes y acerca de

| Dato | Valor |
|---|---|
| Rama | `feat/ajustes-pantalla-y-acerca-de` |
| Título del PR | `feat(ajustes): agrega la pantalla de ajustes y acerca de` |
| Tamaño | **S** (adjuntos ≈ 19 KB ≈ 5.5k tokens) |
| Zip esperado | `etapa-34-pantalla-y-acerca-de.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-34` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(ajustes): agrega la pantalla de ajustes con todas sus secciones`
2. `feat(ajustes): agrega el tema, el acerca de y la comprobación de actualizaciones`
3. `docs(estado): registra el cierre de la etapa 34` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 34`:

- `src/pages/SettingsPage.tsx`
- `src/app/providers/ThemeProvider.tsx`
- `src/config/constants.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Secciones: apariencia, bloqueo, captura, recordatorios, copias, cuentas de ahorro, datos y acerca de.
- Elegir tema claro, oscuro o del sistema.
- Comprobar actualizaciones y ver la versión.
- Aviso permanente de convivencia con el híbrido mientras ambos estén instalados.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Ajustes completos que enlazan todas las pantallas.

Un solo zip `etapa-34-pantalla-y-acerca-de.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
