# Etapa 04 — Agrega las reglas de extractos, estados de pago y color de tarjeta

| Dato | Valor |
|---|---|
| Rama | `feat/dominio-extractos-y-pagos` |
| Título del PR | `feat(dominio): agrega las reglas de extractos, estados de pago y color de tarjeta` |
| Tamaño | **S** (adjuntos ≈ 41 KB ≈ 12.0k tokens) |
| Zip esperado | `etapa-04-extractos-y-pagos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-04` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(dominio): porta las pruebas de extractos y pagos`
2. `feat(dominio): implementa extractos, estado de extracto, textos y pagos`
3. `docs(estado): registra el cierre de la etapa 04` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 4`:

- `src/lib/statements.ts`
- `src/lib/statements.test.ts`
- `src/lib/statementStatus.ts`
- `src/lib/statementStatus.test.ts`
- `src/lib/statementText.ts`
- `src/lib/statementText.test.ts`
- `src/lib/cardColor.ts`
- `src/lib/cardColor.test.ts`
- `src/lib/payment.ts`
- `src/lib/payment.test.ts`
- `src/lib/cycles.ts`
- `src/lib/dates.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Fechas de corte y pago guardadas por periodo para cada tarjeta.
- Estado del extracto y su texto explicativo.
- Pagado / por pagar de cada gasto.
- Color de cada tarjeta según su configuración.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Reglas puras de extractos y pagos con pruebas.

Un solo zip `etapa-04-extractos-y-pagos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
