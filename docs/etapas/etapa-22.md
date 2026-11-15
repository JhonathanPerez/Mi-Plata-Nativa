# Etapa 22 — Agrega los gráficos de estadísticas

| Dato | Valor |
|---|---|
| Rama | `feat/estadisticas-graficos` |
| Título del PR | `feat(estadisticas): agrega los gráficos de estadísticas` |
| Tamaño | **S** (adjuntos ≈ 32 KB ≈ 9.3k tokens) |
| Zip esperado | `etapa-22-graficos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-22` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(estadisticas): agrega la dona y las barras por categoría y por día`
2. `feat(estadisticas): agrega los gráficos por método y de ahorros`
3. `docs(estado): registra el cierre de la etapa 22` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 22`:

- `src/components/charts/CategoryBars.tsx`
- `src/components/charts/DailyBars.tsx`
- `src/components/charts/DonutChart.tsx`
- `src/components/charts/MethodSingle.tsx`
- `src/components/charts/SavingsBars.tsx`
- `src/components/charts/StatsSkeleton.tsx`
- `src/styles/components/charts.css`
- `src/pages/StatsPage.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Dona y barras por categoría.
- Barras por día del mes.
- Reparto por método de pago.
- Sección de ahorros del mes.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Gráficos dibujados con Canvas de Compose, sin librerías de gráficos.

Un solo zip `etapa-22-graficos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
