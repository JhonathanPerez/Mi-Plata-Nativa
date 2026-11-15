# Etapa 40 — Publica la primera versión nativa de Mi Plata (1.0.0)

| Dato | Valor |
|---|---|
| Rama | `feat/app-publicar-1-0-0` |
| Título del PR | `feat(app): publica la primera versión nativa de Mi Plata (1.0.0)` |
| Tamaño | **S** (adjuntos ≈ 0 KB ≈ 0.0k tokens) |
| Zip esperado | `etapa-40-publicar-1-0-0.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-40` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `feat(app): publica la primera versión nativa de Mi Plata`
2. `docs(estado): registra el cierre de la etapa 40` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Ninguno.

## Entregable

Lista de verificación final, importación con tu copia real, comparación de cifras con el híbrido y la fusión que dispara semantic-release: sale 1.0.0 con mi-plata-nativa-v1.0.0.apk.

Un solo zip `etapa-40-publicar-1-0-0.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Lo que haces tú a mano además de rama y commits

Probar en el teléfono con tus datos reales, fusionar el PR y esperar al workflow Release.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
