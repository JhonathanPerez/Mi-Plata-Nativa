# Etapa 08 — Agrega el formato de copias de seguridad y su cifrado

| Dato | Valor |
|---|---|
| Rama | `feat/copias-formato-y-cifrado` |
| Título del PR | `feat(copias): agrega el formato de copias de seguridad y su cifrado` |
| Tamaño | **M** (adjuntos ≈ 51 KB ≈ 14.8k tokens) |
| Zip esperado | `etapa-08-formato-y-cifrado.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-08` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `test(copias): porta las pruebas de formato, volcado crudo y cifrado`
2. `feat(copias): implementa lectura, validación y cifrado AES-GCM de copias`
3. `docs(estado): registra el cierre de la etapa 08` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 8`:

- `src/lib/backupCrypto.ts`
- `src/lib/backupCrypto.test.ts`
- `src/lib/rawDump.ts`
- `src/lib/rawDump.test.ts`
- `src/services/backupService.ts`
- `src/services/importParse.test.ts`
- `src/types/models.ts`
- `src/config/constants.ts`
- `native/android/BackupCrypto.java`
- `native/android/Pbkdf2.java`
- `src/lib/cycles.ts`

## Entregable

Modelos de BackupFile v1–3, lector/validador, soporte del sobre cifrado (mi-plata-backup-encrypted) y del volcado crudo (mi-plata-raw-dump), con pruebas.

Un solo zip `etapa-08-formato-y-cifrado.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
