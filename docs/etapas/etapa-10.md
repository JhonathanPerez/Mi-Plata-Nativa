# Etapa 10 — Agrega los repositorios y reglas de gastos, categorías y presupuesto

| Dato | Valor |
|---|---|
| Rama | `feat/datos-gastos-y-categorias` |
| Título del PR | `feat(datos): agrega los repositorios y reglas de gastos, categorías y presupuesto` |
| Tamaño | **M** (adjuntos ≈ 49 KB ≈ 14.2k tokens) |
| Zip esperado | `etapa-10-gastos-y-categorias.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-10` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(datos): porta las pruebas de gastos, categorías y presupuesto`
2. `feat(datos): implementa repositorios y casos de uso de gastos, categorías y presupuesto`
3. `docs(estado): registra el cierre de la etapa 10` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 10`:

- `src/repositories/expenseRepository.ts`
- `src/repositories/categoryRepository.ts`
- `src/repositories/budgetRepository.ts`
- `src/services/expenseService.ts`
- `src/services/categoryService.ts`
- `src/services/budgetService.ts`
- `src/services/services.test.ts`
- `src/test/fixtures.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Un gasto exige monto > 0, categoría y método; fecha obligatoria y hora opcional.
- Nota (200) y observaciones (500) opcionales.
- El nombre de una categoría es único sin distinguir mayúsculas; una categoría con gastos no se elimina, se oculta.
- Presupuesto por mes.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Repositorios Room + casos de uso + pruebas de integración.

Un solo zip `etapa-10-gastos-y-categorias.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
