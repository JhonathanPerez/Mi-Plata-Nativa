# Etapa 37 — Configura la firma, R8 y el versionado del APK de release

| Dato | Valor |
|---|---|
| Rama | `build/release-firma-r8-y-versionado` |
| Título del PR | `build(release): configura la firma, R8 y el versionado del APK de release` |
| Tamaño | **S** (adjuntos ≈ 12 KB ≈ 3.6k tokens) |
| Zip esperado | `etapa-37-firma-r8-y-versionado.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-37` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `build(release): configura la firma de release desde secretos de CI`
2. `build(release): activa R8 y reglas de conservación, y valida el versionado`
3. `docs(estado): registra el cierre de la etapa 37` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 37`:

- `scripts/apply-android-signing.mjs`
- `scripts/sync-android-version.mjs`
- `scripts/harden-android.mjs`
- `.github/workflows/release.yml`

## Entregable

signingConfig por variables de entorno, R8 con reglas, versionCode = major*1.000.000 + minor*1.000 + patch, allowBackup=false.

Un solo zip `etapa-37-firma-r8-y-versionado.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Lo que haces tú a mano además de rama y commits

Correr Generar-Keystore.ps1 y Cargar-Secretos.ps1 (guarda copia del keystore en un lugar seguro: sin él no podrás actualizar la app).

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
