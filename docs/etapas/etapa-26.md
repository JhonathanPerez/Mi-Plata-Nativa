# Etapa 26 — Agrega la exportación e importación de Excel

| Dato | Valor |
|---|---|
| Rama | `feat/excel-exportar-e-importar` |
| Título del PR | `feat(excel): agrega la exportación e importación de Excel` |
| Tamaño | **S** (adjuntos ≈ 28 KB ≈ 8.3k tokens) |
| Zip esperado | `etapa-26-exportar-e-importar.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-26` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(excel): porta las pruebas de importación de Excel`
2. `feat(excel): agrega exportar e importar .xlsx sin librerías pesadas`
3. `docs(estado): registra el cierre de la etapa 26` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 26`:

- `src/pages/ExportPage.tsx`
- `src/services/excelWriter.ts`
- `src/services/exportData.ts`
- `src/services/exportService.ts`
- `src/services/importService.ts`
- `src/services/importParse.test.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Exporta los gastos a un archivo .xlsx.
- Importa gastos desde .xlsx (nunca usa una cuenta de ahorro).
- Valida filas y reporta errores.
- Comparte el archivo con el menú de Android.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Lector/escritor .xlsx propio (zip + XML), sin dependencias.

Un solo zip `etapa-26-exportar-e-importar.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
