# AGENTS.md — reglas del proyecto «Mi Plata Nativa»

Lee este archivo y `docs/STATE.md` al empezar. No leas nada más salvo lo que el prompt o STATE te indiquen.

## Idioma
- Responde SIEMPRE en español.
- Código e identificadores en inglés. Textos de la app, comentarios, commits y PR en español (es-CO).

## Qué es
App Android **nativa** (Kotlin + Jetpack Compose) de control de gastos personales para Colombia, 100 % offline, solo Android.
Es la reescritura de la app híbrida «Mi Plata» (Capacitor 7 + React 18 + TypeScript + SQLite, v1.6.1, `co.miplata.app`).
Dueño: JhonathanPerez. Repo: `JhonathanPerez/Mi-Plata-Nativa` (público). Híbrido: `JhonathanPerez/Mi-Plata-App`.

## Datos fijos
| Dato | Valor |
|---|---|
| applicationId | `co.miplata.nativa` (debug: sufijo `.debug`) |
| Nombre visible | «Mi Plata Nativa» (debug: «Mi Plata Nativa (debug)») |
| Versión inicial | 1.0.0; `versionCode = major*1.000.000 + minor*1.000 + patch` (1.0.0 → 1000000) |
| Release | GitHub Releases, `mi-plata-nativa-vX.Y.Z.apk`, firmado con keystore NUEVO de la nativa (secretos de CI) |
| Datos | Separados del híbrido; pasan por la copia JSON (`mi-plata-backup` v1–3, cifrada `mi-plata-backup-encrypted`, volcado `mi-plata-raw-dump`) |
| Moneda | COP, enteros (`Long`), máx. 999.999.999.999 |

## Separación de proyectos (obligatoria)
1. El código del híbrido NUNCA entra al repo nativo (ni copiado, ni submódulo, ni carpeta de referencia, ni monorepo).
2. Solo se lee lo que el dueño adjunta, etapa por etapa. Nunca pidas modificar el repo híbrido.
3. Prohibido escribir `co.miplata.app` en el repo. Todo identificador que pueda chocar con el híbrido se deriva de `${applicationId}`
   (autoridades de FileProvider, acciones de intents y broadcasts, permisos propios). El CI lo vigila.
4. El actualizador solo descarga del repo nuevo y verifica package y firma del APK.
5. No hay «actualización sobre el híbrido» ni versión puente.

## Cómo se trabaja (una etapa por sesión)
1. Lee `docs/STATE.md` y la ficha de etapa (`docs/etapas/etapa-NN.md`, viene en el adjunto).
2. **Pregunta de cambios** (si la ficha dice «Sí»): UNA sola pregunta de máximo 5 líneas. 3 a 5 viñetas con las pantallas/reglas
   que cubre la etapa y qué hace hoy cada una (verifícalas contra los archivos adjuntos), y las opciones **«Mantener igual»** /
   **«Cambiar (dime qué)»**. Si tienes botones de respuesta, úsalos. Júntala con la lista de archivos extra que necesites en UN mensaje
   y ESPERA la respuesta antes de programar. No preguntes por infraestructura, build o CI.
   - «Igual» → sigue sin más preguntas.
   - Cambios → impleméntalos como desviaciones deliberadas: actualiza las pruebas portadas, anota cada una en `docs/CAMBIOS.md` con id
     `CHG-xx` (qué cambió, por qué y qué hacía el híbrido) y agrega al commit el pie `Cambio-pedido: CHG-xx`.
   - Si el cambio rompe la compatibilidad de la copia JSON, AVISA antes de aplicarlo.
3. **Pruebas primero**: porta los `*.test.ts` a Kotlin y recién después implementa. Detecta defectos del híbrido (`docs/DEFECTOS-HIBRIDO.md`) y propón su corrección.
4. Entrega UN zip `etapa-NN-nombre.zip`: archivos COMPLETOS (nunca diffs), rutas relativas a la raíz del repo, SIN carpeta envoltorio;
   lo que haya que borrar va en `borrar.txt` dentro del zip. Si algo es una tarea para la PC del dueño, entrégala como script de PowerShell.
5. Al cierre actualiza `docs/STATE.md` (máx. 60 líneas) y `docs/CAMBIOS.md`, y deja en STATE el siguiente paso exacto.
6. NO avances a la siguiente etapa. Si la etapa no cabe en la sesión, pártela y anótalo en STATE.

## Trabajo manual del dueño (solo esto)
Crear ramas y hacer commits. Todo lo demás debe llegar listo: zips, scripts de PowerShell, comandos exactos.
Nunca le pidas editar, renombrar ni mover archivos a mano. Lo inevitable (probar en el teléfono, cargar secretos, datos reales) dilo explícito y mínimo.
Entorno: Windows 11, PowerShell, Android Studio. Todo paso del dueño va **numerado, con comando exacto y resultado esperado**.

## Convenciones (resumen; completas en `docs/CONVENTIONS.md`)
- Rama: `tipo/ámbito-descripcion` (minúsculas, guiones, sin acentos). Ej.: `feat/dominio-dinero-fechas-texto`.
- Commits: Conventional Commits en español: `tipo(ámbito): descripción`. Tipos: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert.
- Título del PR: igual que un commit (el CI lo valida; se fusiona con *squash* y ese título es lo que lee semantic-release).
- Tags de versión: NUNCA a mano. Los crea semantic-release en CI. Los hitos usan `hito-etapa-NN` (no son versiones).
- El workflow `release.yml` está DESACTIVADO hasta la etapa 39; la etapa 40 publica la 1.0.0.
- Versiones de librerías: no las inventes; búscalas en la web (o usa `Verificar-Versiones.ps1`) y dile al dueño cuáles usaste. Ver `docs/VERSIONES.md`.

## Arquitectura (resumen; completa en `docs/ARCHITECTURE.md`)
Multimódulo, MVVM con flujo unidireccional (UiState ↓, eventos ↑), Hilt, Room, DataStore, Navigation Compose, WorkManager.
Reglas de negocio puras en `:core:domain` (JVM, sin Android). Cada decisión relevante se registra en `docs/DECISIONS.md` (ADR).

## Convivencia con el híbrido
Las dos apps conviven instaladas. Mientras convivan, la captura de notificaciones y los recordatorios deben estar activos en UNA sola
para evitar duplicados: la app lo avisa y la guía lo explica.
