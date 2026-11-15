# Etapa 21 — Agrega la pantalla de inicio con presupuesto y modo privacidad

| Dato | Valor |
|---|---|
| Rama | `feat/inicio-resumen-y-presupuesto` |
| Título del PR | `feat(inicio): agrega la pantalla de inicio con presupuesto y modo privacidad` |
| Tamaño | **S** (adjuntos ≈ 22 KB ≈ 6.6k tokens) |
| Zip esperado | `etapa-21-resumen-y-presupuesto.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-21` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(inicio): agrega el resumen del mes y la franja de presupuesto`
2. `feat(inicio): agrega la tarjeta de vencimientos y el modo privacidad`
3. `docs(estado): registra el cierre de la etapa 21` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 21`:

- `src/pages/HomePage.tsx`
- `src/components/expenses/BudgetSheet.tsx`
- `src/components/charts/BudgetStrip.tsx`
- `src/components/cards/DueSummaryCard.tsx`
- `src/app/providers/PrivacyProvider.tsx`
- `src/components/ui/PrivacyToggle.tsx`
- `src/styles/components/privacy.css`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Resumen del mes y presupuesto editable.
- Tarjeta de lo que vence de las tarjetas de crédito.
- Tarjeta de cuentas de ahorro.
- Modo privacidad que oculta todos los valores.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Inicio completo con modo privacidad.

Un solo zip `etapa-21-resumen-y-presupuesto.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
