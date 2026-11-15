# Etapa 39 — Activa el workflow de publicación con semantic-release

| Dato | Valor |
|---|---|
| Rama | `ci/release-activar-publicacion` |
| Título del PR | `ci(release): activa el workflow de publicación con semantic-release` |
| Tamaño | **S** (adjuntos ≈ 7 KB ≈ 2.0k tokens) |
| Zip esperado | `etapa-39-activar-publicacion.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-39` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `ci(release): activa el workflow de publicación`
2. `ci(release): adjunta el APK firmado mi-plata-nativa-vX.Y.Z.apk`
3. `docs(estado): registra el cierre de la etapa 39` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 39`:

- `.github/workflows/release.yml`
- `.releaserc.json`

## Entregable

Se quita la condición que mantiene desactivado el workflow. Esta fusión NO debe publicar nada si solo trae ci/docs/test/chore.

Un solo zip `etapa-39-activar-publicacion.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Lo que haces tú a mano además de rama y commits

Verificar que los 4 secretos existen (Cargar-Secretos.ps1 -Solo Verificar).

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
