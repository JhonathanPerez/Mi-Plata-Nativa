# Etapa 18 — Agrega el formulario para registrar y editar gastos

| Dato | Valor |
|---|---|
| Rama | `feat/gastos-registrar-y-editar` |
| Título del PR | `feat(gastos): agrega el formulario para registrar y editar gastos` |
| Tamaño | **S** (adjuntos ≈ 31 KB ≈ 9.0k tokens) |
| Zip esperado | `etapa-18-registrar-y-editar.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-18` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(gastos): agrega el formulario de gasto con monto, categoría, método y fecha`
2. `feat(gastos): agrega observaciones, hora y recuerdo del último método`
3. `docs(estado): registra el cierre de la etapa 18` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 18`:

- `src/pages/ExpenseFormPage.tsx`
- `src/components/ui/DateField.tsx`
- `src/components/ui/PickerField.tsx`
- `src/components/expenses/OptionSheet.tsx`
- `src/components/ui/ItemPreview.tsx`
- `src/components/ui/EmojiTile.tsx`
- `src/components/cards/ReminderPrompt.tsx`
- `src/styles/components/pickers.css`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Monto, categoría, método de pago, fecha (hoy por defecto), hora, nota y observaciones.
- Recuerda el último método de pago usado.
- Con una cuenta de ahorro, muestra su saldo en el método de pago.
- Edición del mismo formulario.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantalla de registro/edición con ViewModel y estado unidireccional.

Un solo zip `etapa-18-registrar-y-editar.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
