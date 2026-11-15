# Etapa 05 — Agrega las reglas de ahorros, comparativos y serie diaria

| Dato | Valor |
|---|---|
| Rama | `feat/dominio-ahorros-y-comparativos` |
| Título del PR | `feat(dominio): agrega las reglas de ahorros, comparativos y serie diaria` |
| Tamaño | **S** (adjuntos ≈ 33 KB ≈ 9.6k tokens) |
| Zip esperado | `etapa-05-ahorros-y-comparativos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-05` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(dominio): porta las pruebas de ahorros y comparativos`
2. `feat(dominio): implementa saldos de ahorro, comparativos y serie diaria`
3. `docs(estado): registra el cierre de la etapa 05` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 5`:

- `src/lib/savings.ts`
- `src/lib/savings.test.ts`
- `src/lib/comparison.ts`
- `src/lib/comparison.test.ts`
- `src/lib/dailyChart.ts`
- `src/lib/dailyChart.test.ts`
- `src/lib/historyLink.ts`
- `src/lib/historyLink.test.ts`
- `src/lib/money.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Un retiro no puede superar el saldo; un movimiento manual se borra solo si el saldo no queda negativo.
- Ajustar saldo crea el ingreso o retiro por la diferencia ('Ajuste de saldo').
- Ahorro neto del mes = metiste − sacaste − pagado con ahorro.
- Comparativo entre periodos y serie diaria para los gráficos.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Reglas puras de ahorros y comparativos con pruebas.

Un solo zip `etapa-05-ahorros-y-comparativos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
