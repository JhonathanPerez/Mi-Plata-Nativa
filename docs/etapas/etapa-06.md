# Etapa 06 — Agrega el lector de montos y comercios de notificaciones bancarias

| Dato | Valor |
|---|---|
| Rama | `feat/captura-lectura-de-notificaciones` |
| Título del PR | `feat(captura): agrega el lector de montos y comercios de notificaciones bancarias` |
| Tamaño | **M** (adjuntos ≈ 50 KB ≈ 14.7k tokens) |
| Zip esperado | `etapa-06-lectura-de-notificaciones.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-06` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(captura): porta las pruebas del lector de notificaciones`
2. `feat(captura): implementa un único lector de notificaciones en :core:domain`
3. `docs(estado): registra el cierre de la etapa 06` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 6`:

- `src/lib/parseNotification.ts`
- `src/lib/parseNotification.test.ts`
- `src/config/capture.ts`
- `native/android/ExpenseTextParser.java`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Detecta monto en pesos, banco, comercio y últimos 4 dígitos de mensajes del banco.
- Ignora mensajes sin monto o que parecen publicidad.
- Hoy hay DOS lectores (TypeScript y Java) que hay que mantener iguales; en la nativa habrá uno solo.
- 'Pegar un mensaje' explica por qué no se detecta uno real.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Un parser Kotlin único; las pruebas de ambos lectores quedan juntas.

Un solo zip `etapa-06-lectura-de-notificaciones.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
