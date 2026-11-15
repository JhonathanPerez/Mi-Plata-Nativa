# Etapa 15 — Agrega el tema, los colores, las fuentes y los componentes base

| Dato | Valor |
|---|---|
| Rama | `feat/ui-sistema-de-diseno` |
| Título del PR | `feat(ui): agrega el tema, los colores, las fuentes y los componentes base` |
| Tamaño | **M** (adjuntos ≈ 69 KB ≈ 20.3k tokens) |
| Zip esperado | `etapa-15-sistema-de-diseno.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-15` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(ui): crea el tema Material 3 con colores, formas y tipografía`
2. `feat(ui): agrega los componentes base del sistema de diseño`
3. `docs(estado): registra el cierre de la etapa 15` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 15`:

- `src/styles/tokens.css`
- `src/styles/base.css`
- `src/styles/tokens.test.ts`
- `src/styles/components/buttons.css`
- `src/styles/components/controls.css`
- `src/styles/components/forms.css`
- `src/styles/components/rows.css`
- `src/styles/components/feedback.css`
- `src/styles/components/overlays.css`
- `src/components/ui/Button.tsx`
- `src/components/ui/Chip.tsx`
- `src/components/ui/Field.tsx`
- `src/components/ui/Money.tsx`
- `src/components/ui/MoneyInput.tsx`
- `src/components/ui/Sheet.tsx`
- `src/components/ui/Toggle.tsx`
- `src/components/ui/Segmented.tsx`
- `src/components/ui/Row.tsx`
- `src/components/ui/EmptyState.tsx`
- `src/components/ui/ErrorState.tsx`
- `src/components/ui/Skeleton.tsx`
- `src/components/ui/Notice.tsx`
- `src/components/ui/PageHeader.tsx`
- `src/components/ui/Stat.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Verde de marca #0B7A63; paleta de 12 colores para categorías.
- Fuentes Bricolage Grotesque (títulos) y Figtree (texto).
- Tema claro, oscuro o del sistema.
- Botones, chips, hojas inferiores, filas, estados vacíos, de error y de carga.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Módulo :core:designsystem con tema y componentes; las fuentes las baja Descargar-Fuentes.ps1.

Un solo zip `etapa-15-sistema-de-diseno.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
