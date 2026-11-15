# Etapa 07 — Agrega las reglas de spam aprendido y de recordatorios

| Dato | Valor |
|---|---|
| Rama | `feat/captura-aprendizaje-y-recordatorios` |
| Título del PR | `feat(captura): agrega las reglas de spam aprendido y de recordatorios` |
| Tamaño | **S** (adjuntos ≈ 37 KB ≈ 10.9k tokens) |
| Zip esperado | `etapa-07-aprendizaje-y-recordatorios.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-07` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(captura): porta las pruebas de spam, textos y recordatorios`
2. `feat(captura): implementa spam aprendido, textos y reglas de recordatorios`
3. `docs(estado): registra el cierre de la etapa 07` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 7`:

- `src/lib/spamLearning.ts`
- `src/lib/spamLearning.test.ts`
- `src/lib/captureCopy.ts`
- `src/lib/captureCopy.test.ts`
- `src/lib/pendingReminders.ts`
- `src/lib/pendingReminders.test.ts`
- `src/lib/reminders.ts`
- `src/lib/reminders.test.ts`
- `src/lib/dates.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Marcar spam enseña frases que luego se descartan solas.
- Textos de ayuda de la captura.
- Recordatorio de pendientes repetido cada N minutos si no abres la app.
- Aviso de pago con N días de anticipación y a una hora elegida.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Reglas puras con pruebas.

Un solo zip `etapa-07-aprendizaje-y-recordatorios.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
