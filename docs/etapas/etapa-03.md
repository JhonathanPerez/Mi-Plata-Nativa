# Etapa 03 — Agrega las reglas de ciclo y pago de tarjetas

| Dato | Valor |
|---|---|
| Rama | `feat/dominio-ciclos-de-tarjeta` |
| Título del PR | `feat(dominio): agrega las reglas de ciclo y pago de tarjetas` |
| Tamaño | **S** (adjuntos ≈ 27 KB ≈ 7.9k tokens) |
| Zip esperado | `etapa-03-ciclos-de-tarjeta.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-03` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(dominio): porta las pruebas de ciclos y vencimientos de tarjeta`
2. `feat(dominio): implementa ciclos de corte y pago de tarjetas`
3. `docs(estado): registra el cierre de la etapa 03` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 3`:

- `src/lib/cycles.ts`
- `src/lib/cycles.test.ts`
- `src/lib/cardDue.ts`
- `src/lib/cardDue.test.ts`
- `src/lib/dates.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Corte y pago configurables: último día, día fijo o n-ésimo día de la semana.
- El pago puede caer el mes siguiente y el fin de semana se mantiene o se corre.
- Resumen de lo que vence y cuándo (cardDue).

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Reglas de CycleRules y vencimientos, puras y probadas.

Un solo zip `etapa-03-ciclos-de-tarjeta.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
