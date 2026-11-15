# Etapa 25 — Agrega las pantallas de cuentas de ahorro

| Dato | Valor |
|---|---|
| Rama | `feat/ahorros-cuentas-y-movimientos` |
| Título del PR | `feat(ahorros): agrega las pantallas de cuentas de ahorro` |
| Tamaño | **S** (adjuntos ≈ 26 KB ≈ 7.7k tokens) |
| Zip esperado | `etapa-25-cuentas-y-movimientos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-25` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(ahorros): agrega la lista de cuentas de ahorro`
2. `feat(ahorros): agrega el detalle, los movimientos y el ajuste de saldo`
3. `docs(estado): registra el cierre de la etapa 25` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 25`:

- `src/pages/SavingsPage.tsx`
- `src/pages/SavingsAccountPage.tsx`
- `src/components/savings/SavingsAccountSheet.tsx`
- `src/components/savings/SavingsAdjustSheet.tsx`
- `src/components/savings/SavingsMovementSheet.tsx`
- `src/styles/features/savings.css`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Crear cuenta con nombre, últimos 4, icono y saldo inicial.
- Meter y sacar plata; ajustar saldo con el del banco.
- Detalle con cada movimiento y su saldo resultante.
- Tocar un retiro enlazado abre el gasto.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantallas de ahorros.

Un solo zip `etapa-25-cuentas-y-movimientos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
