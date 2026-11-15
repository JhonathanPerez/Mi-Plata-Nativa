# STATE — Mi Plata Nativa (máximo 60 líneas)

> Lo actualiza la IA al cierre de cada sesión (prompt de cierre). Si pasa de 60 líneas, resume.

## Dónde estamos
- Etapa cerrada: **01 — esqueleto multimódulo con identificadores propios**
- Última etapa cerrada: 01
- Último hito: `hito-etapa-01` (lo crea `Publicar-PR.ps1 -Etapa 1` al fusionar)
- Versión publicada: ninguna (release DESACTIVADO hasta la etapa 39)

## Siguiente paso exacto
<!-- SIGUIENTE:INICIO -->
Etapa 02 · rama `feat/dominio-dinero-fechas-texto` · PR `feat(dominio): agrega las reglas de dinero, fechas y texto`
0. Antes: `Publicar-PR.ps1 -Etapa 1` debe haber terminado (tag `hito-etapa-01`). Luego `git switch main` y `git pull --ff-only`.
1. `./scripts/Armar-Adjunto.ps1 -Etapa 2` (money, dates, text, ids, errors, constants y sus `.test.ts`).
2. La IA hace la pregunta de cambios (Sí, punto 8), espera tu respuesta y entrega `etapa-02-dinero-fechas-texto.zip`.
3. Rama de la ficha y `./scripts/Aplicar-Etapa.ps1 -Zip ...`. Commits en orden: `test(dominio): porta las pruebas de dinero, fechas y texto`,
   luego `feat(dominio): implementa dinero, fechas y texto en :core:domain`.
4. Cierre: commit `docs(estado): registra el cierre de la etapa 02` y `./scripts/Publicar-PR.ps1 -Etapa 2`.
Entregable: funciones puras en :core:domain con todas las pruebas portadas.
Ficha completa en `docs/etapas/etapa-02.md`.
<!-- SIGUIENTE:FIN -->

## Cambios pedidos vigentes (CHG)
Ninguno. (Detalle completo en `docs/CAMBIOS.md`; aquí solo `CHG-xx: resumen en una línea`.)

## Decisiones vigentes que importan
- applicationId `co.miplata.nativa` (+`.debug`), nombre «Mi Plata Nativa», versionCode = major*1.000.000+minor*1.000+patch.
- La versión sale de `appVersion` en `gradle.properties` (default 1.0.0); el CI de release la sobrescribe con `-PappVersion=X.Y.Z`.
- Identificadores que pueden chocar con el híbrido: siempre `${applicationId}`; nunca `co.miplata.app`.
- Esquema Room v1 nuevo (estado final del híbrido); los datos entran solo por la importación guiada.
- Versiones de librerías: ver `docs/VERSIONES.md` y `gradle/libs.versions.toml` (no inventar; verificar con `Verificar-Versiones.ps1`).
- ADR-025: `package.json` con `"type": "module"`; `commitlint.config.js` es ES module (un `.js` nuevo en la raíz también lo sea, o `.cjs`).
- ADR-026: compileSdk 37 / targetSdk 36 / minSdk 26 y versiones efectivas (AGP 9.5.1, Kotlin 2.4.21, KSP 2.3.14, Hilt 2.60.1, Gradle 9.9.1).
- ADR-027: módulos iniciales `:app`, `:core:domain` (JVM), `:core:data`, `:core:ui`; `build-logic/` con convention plugins (ADR-005 cumplido, config en `ProjectDefaults.kt`).
- Release sin minificar hasta la etapa de empaquetado; tema provisional verde #0B7A63 (`allowBackup=false` ya es ADR-024).

## Pendientes y avisos
- Confirmar CI verde del PR de la etapa 01 y la prueba en el teléfono (ícono, nombre debug, pantalla «Hola», conviviendo con el híbrido).
- La etapa 01 dejó varios commits de código (ajuste de compileSdk 37 y `build-logic`); se fusionan con squash.
- `gradle/gradle-daemon-jvm.properties` quedó versionado (toolchain del daemon); revisar que pida JDK 17 o superior.
- Mientras convivan híbrido y nativa, captura de notificaciones y recordatorios activos en UNA sola app.
- Defectos del híbrido por corregir: ver `docs/DEFECTOS-HIBRIDO.md` (D-01 a D-12).
- Avisos de CRLF→LF en los `.ps1` son normales (`.gitattributes` fuerza LF).
- Etapa no partida: nada quedó incompleto.

## Historial de etapas cerradas
- 00 · kit de trabajo (herramientas de commits con husky + commitlint, semantic-release desactivado, CI, scripts PowerShell, docs de 41 etapas) · hito-etapa-00
- 01 · esqueleto multimódulo (Gradle + catálogo de versiones + build-logic, :app con Hilt y pantalla «Hola», FileProvider con `${applicationId}`) · hito-etapa-01
