# Etapa 02 — Agrega las reglas de dinero, fechas y texto

| Dato | Valor |
|---|---|
| Rama | `feat/dominio-dinero-fechas-texto` |
| Título del PR | `feat(dominio): agrega las reglas de dinero, fechas y texto` |
| Tamaño | **S** (adjuntos ≈ 25 KB ≈ 7.2k tokens) |
| Zip esperado | `etapa-02-dinero-fechas-texto.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-02` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(dominio): porta las pruebas de dinero, fechas y texto`
2. `feat(dominio): implementa dinero, fechas y texto en :core:domain`
3. `docs(estado): registra el cierre de la etapa 02` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 2`:

- `src/lib/money.ts`
- `src/lib/money.test.ts`
- `src/lib/dates.ts`
- `src/lib/dates.test.ts`
- `src/lib/text.ts`
- `src/lib/text.test.ts`
- `src/lib/ids.ts`
- `src/lib/errors.ts`
- `src/config/constants.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Dinero: pesos enteros sin decimales, máximo 999.999.999.999 y formato colombiano.
- Fechas: día calendario local (AAAA-MM-DD) y mes (AAAA-MM); validación de fechas y horas.
- Textos: nombre máx. 30, nota 200 y observaciones 500 caracteres.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Funciones puras en :core:domain con todas las pruebas portadas.

Un solo zip `etapa-02-dinero-fechas-texto.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
