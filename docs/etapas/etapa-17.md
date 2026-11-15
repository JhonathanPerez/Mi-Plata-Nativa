# Etapa 17 — Agrega la importación guiada desde el híbrido

| Dato | Valor |
|---|---|
| Rama | `feat/importacion-desde-el-hibrido` |
| Título del PR | `feat(importacion): agrega la importación guiada desde el híbrido` |
| Tamaño | **S** (adjuntos ≈ 38 KB ≈ 11.2k tokens) |
| Zip esperado | `etapa-17-desde-el-hibrido.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-17` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(importacion): agrega pruebas del resumen, la transacción única y la verificación`
2. `feat(importacion): agrega la pantalla guiada de importación desde Mi Plata híbrida`
3. `feat(importacion): avisa que la captura y los recordatorios deben estar en una sola app`
4. `docs(estado): registra el cierre de la etapa 17` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 17`:

- `src/services/backupService.ts`
- `src/lib/backupCrypto.ts`
- `src/lib/rawDump.ts`
- `src/components/backup/BackupPasswordSheet.tsx`
- `src/lib/fileIO.ts`
- `src/pages/SettingsPage.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Hoy 'Restaurar' REEMPLAZA todos los datos de la app.
- Las copias cifradas piden la contraseña (mínimo 8 caracteres).
- Acepta copias v1 a v3 y volcados crudos de la tarea en segundo plano.
- En la nativa: leer el JSON, mostrar resumen (cantidades y totales), confirmar, importar en UNA transacción, verificar, sin borrar nada.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Pantalla guiada completa y aviso de convivencia en la app. Prueba con tu copia real.

Un solo zip `etapa-17-desde-el-hibrido.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
