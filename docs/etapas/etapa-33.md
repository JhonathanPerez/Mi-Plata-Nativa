# Etapa 33 — Reescribe en Kotlin el actualizador de APK con verificación de firma

| Dato | Valor |
|---|---|
| Rama | `feat/actualizador-apk-desde-github` |
| Título del PR | `feat(actualizador): reescribe en Kotlin el actualizador de APK con verificación de firma` |
| Tamaño | **M** (adjuntos ≈ 57 KB ≈ 16.7k tokens) |
| Zip esperado | `etapa-33-apk-desde-github.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-33` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(actualizador): porta las pruebas de versiones y avisos`
2. `feat(actualizador): reescribe en Kotlin la consulta, la descarga y la verificación del APK`
3. `feat(actualizador): agrega el diálogo de actualización y el FileProvider propio`
4. `docs(estado): registra el cierre de la etapa 33` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 33`:

- `native/android/AppUpdatePlugin.java`
- `native/android/UpdateFileProvider.java`
- `native/android/res/update_paths.xml`
- `src/lib/appUpdate.ts`
- `src/lib/appUpdate.test.ts`
- `src/lib/updateBridge.ts`
- `src/services/updateService.ts`
- `src/app/providers/UpdateProvider.tsx`
- `src/components/update/UpdateDialog.tsx`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Avisa de una versión nueva al abrir (Descargar / Cancelar) y desde Ajustes.
- Como mucho una consulta por hora; Cancelar descansa 1 día esa versión.
- Barra de avance; Android pide la confirmación final.
- Solo descarga de GitHub y verifica que el APK sea la app y esté firmado con la misma clave.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Actualizador contra JhonathanPerez/Mi-Plata-Nativa, FileProvider ${applicationId}.updates y verificación package + firma.

Un solo zip `etapa-33-apk-desde-github.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
