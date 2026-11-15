# Etapa 38 — Agrega la guía de usuario y la guía de convivencia con el híbrido

| Dato | Valor |
|---|---|
| Rama | `docs/guias-usuario-y-convivencia` |
| Título del PR | `docs(guias): agrega la guía de usuario y la guía de convivencia con el híbrido` |
| Tamaño | **S** (adjuntos ≈ 11 KB ≈ 3.2k tokens) |
| Zip esperado | `etapa-38-usuario-y-convivencia.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-38` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `docs(guias): agrega la guía de instalación, importación y convivencia`
2. `docs(estado): registra el cierre de la etapa 38` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 38`:

- `README.md`

## Entregable

README final, guía para importar desde el híbrido y comparar cifras lado a lado, y cómo desactivar captura/recordatorios en una de las dos apps.

Un solo zip `etapa-38-usuario-y-convivencia.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
