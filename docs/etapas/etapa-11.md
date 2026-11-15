# Etapa 11 — Agrega métodos de pago, tarjetas y extractos

| Dato | Valor |
|---|---|
| Rama | `feat/datos-metodos-de-pago-y-tarjetas` |
| Título del PR | `feat(datos): agrega métodos de pago, tarjetas y extractos` |
| Tamaño | **S** (adjuntos ≈ 39 KB ≈ 11.4k tokens) |
| Zip esperado | `etapa-11-metodos-de-pago-y-tarjetas.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-11` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(datos): porta las pruebas de métodos de pago y tarjetas`
2. `feat(datos): implementa métodos de pago, ciclos y extractos de tarjeta`
3. `docs(estado): registra el cierre de la etapa 11` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 11`:

- `src/repositories/paymentMethodRepository.ts`
- `src/repositories/cardCycleRepository.ts`
- `src/services/paymentMethodService.ts`
- `src/services/cardService.ts`
- `src/services/cardService.test.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Una instalación nueva solo trae Efectivo y Transferencia.
- Un método con gastos no se elimina, se oculta; últimos 4 dígitos opcionales (nunca el número completo).
- Tarjetas de crédito con reglas de corte y pago y extractos por periodo.
- Los métodos 'espejo' de ahorros no aparecen en Métodos de pago.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Repositorios y casos de uso de métodos/tarjetas con pruebas.

Un solo zip `etapa-11-metodos-de-pago-y-tarjetas.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
