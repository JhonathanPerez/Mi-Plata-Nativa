# Etapa 24 — Agrega las pantallas de tarjetas de crédito, reglas y extractos

| Dato | Valor |
|---|---|
| Rama | `feat/tarjetas-credito-y-extractos` |
| Título del PR | `feat(tarjetas): agrega las pantallas de tarjetas de crédito, reglas y extractos` |
| Tamaño | **M** (adjuntos ≈ 67 KB ≈ 19.7k tokens) |
| Zip esperado | `etapa-24-credito-y-extractos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-24` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(tarjetas): agrega la lista de tarjetas y sus reglas de corte y pago`
2. `feat(tarjetas): agrega extractos y el pago de la tarjeta`
3. `docs(estado): registra el cierre de la etapa 24` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 24`:

- `src/pages/CardsPage.tsx`
- `src/pages/CardRulesPage.tsx`
- `src/pages/StatementsPage.tsx`
- `src/pages/PayCardPage.tsx`
- `src/components/cards/CreditCardTile.tsx`
- `src/components/cards/RuleSheet.tsx`
- `src/components/cards/StatementDatesSheet.tsx`
- `src/styles/features/credit-cards.css`
- `src/styles/features/payments.css`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Tarjeta con su color, cupo usado y próximas fechas.
- Reglas de corte y pago editables.
- Extractos por periodo con fechas ajustables.
- Pagar la tarjeta marca como pagados sus gastos.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantallas de tarjetas.

Un solo zip `etapa-24-credito-y-extractos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
