# Etapa 36 — Agrega pruebas instrumentadas de los flujos principales

| Dato | Valor |
|---|---|
| Rama | `test/app-flujos-instrumentados` |
| Título del PR | `test(app): agrega pruebas instrumentadas de los flujos principales` |
| Tamaño | **S** (adjuntos ≈ 0 KB ≈ 0.0k tokens) |
| Zip esperado | `etapa-36-flujos-instrumentados.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-36` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `test(app): agrega pruebas instrumentadas de registrar gasto, importar copia y recordatorios`
2. `docs(estado): registra el cierre de la etapa 36` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Ninguno.

## Entregable

Pruebas con Compose y Hilt de los flujos clave, más prueba de importación con una copia de ejemplo.

Un solo zip `etapa-36-flujos-instrumentados.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
