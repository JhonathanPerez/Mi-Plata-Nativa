# Etapa 20 — Agrega el historial con filtros y navegador de meses

| Dato | Valor |
|---|---|
| Rama | `feat/historial-filtros-y-meses` |
| Título del PR | `feat(historial): agrega el historial con filtros y navegador de meses` |
| Tamaño | **S** (adjuntos ≈ 20 KB ≈ 5.9k tokens) |
| Zip esperado | `etapa-20-filtros-y-meses.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-20` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(historial): agrega el historial por mes con navegador de meses`
2. `feat(historial): agrega la hoja de filtros`
3. `docs(estado): registra el cierre de la etapa 20` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 20`:

- `src/pages/HistoryPage.tsx`
- `src/components/expenses/FilterSheet.tsx`
- `src/components/ui/MonthNavigator.tsx`
- `src/lib/historyLink.ts`
- `src/hooks/useScrollRestoration.ts`
- `src/hooks/useHideOnScroll.ts`
- `src/hooks/useDebounced.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Historial por mes con navegador de meses.
- Hoja de filtros sobre los gastos.
- Enlaces desde otras pantallas que abren el historial ya filtrado.
- Conserva la posición al volver.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantalla de historial con filtros.

Un solo zip `etapa-20-filtros-y-meses.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
