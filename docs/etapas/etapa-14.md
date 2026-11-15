# Etapa 14 — Agrega las consultas de estadísticas

| Dato | Valor |
|---|---|
| Rama | `feat/datos-estadisticas` |
| Título del PR | `feat(datos): agrega las consultas de estadísticas` |
| Tamaño | **S** (adjuntos ≈ 13 KB ≈ 3.8k tokens) |
| Zip esperado | `etapa-14-estadisticas.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-14` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(datos): porta las pruebas de estadísticas`
2. `feat(datos): implementa las consultas de estadísticas del mes`
3. `docs(estado): registra el cierre de la etapa 14` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 14`:

- `src/services/statsService.ts`
- `src/services/exportData.ts`
- `src/lib/comparison.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Total gastado del mes, por categoría, por método de pago y por día.
- Sección de ahorros que sigue al mes elegido.
- Comparación contra el mes anterior.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

StatsRepository con consultas Room y pruebas.

Un solo zip `etapa-14-estadisticas.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
