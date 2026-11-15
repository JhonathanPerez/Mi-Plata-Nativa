# Etapa 12 — Agrega cuentas de ahorro y sus movimientos

| Dato | Valor |
|---|---|
| Rama | `feat/datos-cuentas-de-ahorro` |
| Título del PR | `feat(datos): agrega cuentas de ahorro y sus movimientos` |
| Tamaño | **S** (adjuntos ≈ 38 KB ≈ 11.1k tokens) |
| Zip esperado | `etapa-12-cuentas-de-ahorro.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-12` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(datos): porta las pruebas de cuentas de ahorro`
2. `feat(datos): implementa cuentas de ahorro, movimientos y método espejo`
3. `docs(estado): registra el cierre de la etapa 12` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 12`:

- `src/repositories/savingsRepository.ts`
- `src/services/savingsService.ts`
- `src/services/savingsService.test.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Cada cuenta tiene nombre, últimos 4 (opcionales), icono y color.
- Saldo inicial como primer movimiento; meter, sacar y ajustar saldo.
- Pagar un gasto con una cuenta crea el retiro enlazado, atómico con el gasto.
- Una cuenta que ya pagó gastos no se elimina; ocultarla la saca de la lista al pagar.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Repositorio y servicio de ahorros con pruebas (incluye transacciones).

Un solo zip `etapa-12-cuentas-de-ahorro.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
