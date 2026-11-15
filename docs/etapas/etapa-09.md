# Etapa 09 — Agrega la base de datos Room con el esquema final

| Dato | Valor |
|---|---|
| Rama | `feat/datos-room-esquema` |
| Título del PR | `feat(datos): agrega la base de datos Room con el esquema final` |
| Tamaño | **S** (adjuntos ≈ 38 KB ≈ 11.1k tokens) |
| Zip esperado | `etapa-09-room-esquema.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-09` |
| ¿Pregunta de cambios? | No (parte técnica sin impacto visible) |

## Commits (en este orden)

1. `test(datos): porta las pruebas de esquema y semillas`
2. `feat(datos): crea la base Room con entidades, DAO y semillas`
3. `docs(estado): registra el cierre de la etapa 09` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 9`:

- `src/db/migrations/001_init.ts`
- `src/db/migrations/002_transferencia.ts`
- `src/db/migrations/003_pending_captures.ts`
- `src/db/migrations/004_paid_status_and_cycles.ts`
- `src/db/migrations/005_spam_learning.ts`
- `src/db/migrations/006_savings_accounts.ts`
- `src/db/migrations/007_savings_account_last4.ts`
- `src/db/migrations/008_expense_observations.ts`
- `src/db/migrations/migrations.test.ts`
- `src/db/mappers.ts`
- `src/db/types.ts`
- `src/db/seed.ts`
- `src/config/seeds.ts`
- `src/repositories/backupRepository.ts`

## Entregable

Room (esquema v1 con el estado final del híbrido: sin migrar las 8 migraciones), exportSchema, DAO, TypeConverters y semillas (solo Efectivo y Transferencia).

Un solo zip `etapa-09-room-esquema.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
