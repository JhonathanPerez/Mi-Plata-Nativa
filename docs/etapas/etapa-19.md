# Etapa 19 — Agrega la lista de gastos y el detalle en forma de recibo

| Dato | Valor |
|---|---|
| Rama | `feat/gastos-lista-y-detalle` |
| Título del PR | `feat(gastos): agrega la lista de gastos y el detalle en forma de recibo` |
| Tamaño | **S** (adjuntos ≈ 36 KB ≈ 10.6k tokens) |
| Zip esperado | `etapa-19-lista-y-detalle.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-19` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(gastos): agrega la lista de gastos con deslizar y pulsación larga`
2. `feat(gastos): agrega el detalle en forma de recibo con editar y eliminar`
3. `docs(estado): registra el cierre de la etapa 19` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 19`:

- `src/pages/ExpenseDetailPage.tsx`
- `src/components/expenses/ExpenseList.tsx`
- `src/components/expenses/ExpenseRow.tsx`
- `src/components/expenses/ExpenseListSkeleton.tsx`
- `src/components/ui/SwipeRow.tsx`
- `src/hooks/useLongPress.ts`
- `src/hooks/useSwipeHint.ts`
- `src/components/ui/ActionSheet.tsx`
- `src/app/providers/ConfirmProvider.tsx`
- `src/app/providers/ToastProvider.tsx`
- `src/styles/components/expenses.css`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Lista de gastos por día con deslizar y pulsación larga.
- Detalle como recibo con acciones Editar y Eliminar (v1.4.0).
- Confirmación antes de eliminar y avisos tipo 'toast'.
- Pista visual la primera vez que se puede deslizar.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Lista y detalle con acciones.

Un solo zip `etapa-19-lista-y-detalle.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
