# Etapa 23 — Agrega la gestión de categorías y métodos de pago

| Dato | Valor |
|---|---|
| Rama | `feat/catalogos-categorias-y-metodos` |
| Título del PR | `feat(catalogos): agrega la gestión de categorías y métodos de pago` |
| Tamaño | **S** (adjuntos ≈ 26 KB ≈ 7.7k tokens) |
| Zip esperado | `etapa-23-categorias-y-metodos.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-23` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(catalogos): agrega la gestión de categorías`
2. `feat(catalogos): agrega la gestión de métodos de pago`
3. `docs(estado): registra el cierre de la etapa 23` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 23`:

- `src/pages/CategoriesPage.tsx`
- `src/pages/PaymentMethodsPage.tsx`
- `src/components/ui/ManagedRow.tsx`
- `src/components/ui/ManagedListSkeleton.tsx`
- `src/components/ui/IconPicker.tsx`
- `src/components/ui/ColorPicker.tsx`
- `src/config/constants.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Crear y editar con icono (36 opciones) y color (12).
- Interruptor 'Aparece al registrar un gasto' para ocultar.
- Una categoría o método con gastos no se elimina.
- Reordenar.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantallas de catálogos.

Un solo zip `etapa-23-categorias-y-metodos.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
