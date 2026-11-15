# Etapa 01 — Crea el esqueleto multimódulo con identificadores propios

| Dato | Valor |
|---|---|
| Rama | `build/gradle-esqueleto-multimodulo` |
| Título del PR | `build(gradle): crea el esqueleto multimódulo con identificadores propios` |
| Tamaño | **S** (adjuntos ≈ 0 KB ≈ 0.1k tokens) |
| Zip esperado | `etapa-01-esqueleto-multimodulo.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-01` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `build(gradle): crea el esqueleto multimódulo y el catálogo de versiones`
2. `build(app): define applicationId propio, sufijo debug y versionado por fórmula`
3. `docs(estado): registra el cierre de la etapa 01` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 1`:

- `capacitor.config.ts`

## Entregable

settings.gradle.kts, catálogo libs.versions.toml (con las versiones de docs/VERSIONES.md y las que arroje Verificar-Versiones.ps1), módulos vacíos, :app con Hilt y una pantalla 'Hola', FileProvider con ${applicationId}, CI verde.

Un solo zip `etapa-01-esqueleto-multimodulo.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Lo que haces tú a mano además de rama y commits

Correr Verificar-Versiones.ps1 y pegarle la salida a la IA; correr Crear-GradleWrapper.ps1; abrir en Android Studio y probar en el teléfono.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
