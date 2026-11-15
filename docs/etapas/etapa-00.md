# Etapa 00 — Agrega el kit de trabajo y deja el repositorio listo

| Dato | Valor |
|---|---|
| Rama | `chore/repo-kit-inicial` |
| Título del PR | `chore(repo): agrega el kit de trabajo y deja el repositorio listo` |
| Tamaño | **S** (adjuntos ≈ 0 KB ≈ 0.0k tokens) |
| Zip esperado | `etapa-00-kit-inicial.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-00` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `chore(repo): agrega el kit de trabajo del proyecto`
2. `docs(estado): registra el cierre de la etapa 00` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Ninguno.

## Entregable

Copiar el kit al repo nuevo, crear el repo público en GitHub y dejar el CI corriendo. Sin código Kotlin.

Un solo zip `etapa-00-kit-inicial.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Lo que haces tú a mano además de rama y commits

Crear la carpeta del repo, correr Crear-Repo.ps1, crear la rama y el commit (ver GUIA-WINDOWS).

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
