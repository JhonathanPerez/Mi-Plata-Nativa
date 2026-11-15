# Etapa 35 — Agrega el ícono, el splash y el nombre de Mi Plata Nativa

| Dato | Valor |
|---|---|
| Rama | `feat/identidad-icono-y-nombre` |
| Título del PR | `feat(identidad): agrega el ícono, el splash y el nombre de Mi Plata Nativa` |
| Tamaño | **S** (adjuntos ≈ 7 KB ≈ 2.1k tokens) |
| Zip esperado | `etapa-35-icono-y-nombre.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-35` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `feat(identidad): agrega el ícono adaptable y el nombre Mi Plata Nativa`
2. `feat(identidad): agrega el splash y distingue el build debug`
3. `docs(estado): registra el cierre de la etapa 35` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 35`:

- `assets/icon/icon-foreground.svg`
- `assets/icon/icon-monochrome.svg`
- `assets/android-res/mipmap-anydpi-v26/ic_launcher.xml`
- `assets/android-res/values/ic_launcher_background.xml`
- `assets/android-res/drawable/splash_brand.xml`
- `scripts/generate-icons.mjs`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Ícono verde con el anillo de 5 tramos, adaptable y monocromo.
- Splash con la marca.
- En la nativa debe distinguirse del híbrido (propuesta: insignia o tono distinto).

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Íconos vectoriales y nombre 'Mi Plata Nativa' (debug: 'Mi Plata Nativa (debug)').

Un solo zip `etapa-35-icono-y-nombre.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
