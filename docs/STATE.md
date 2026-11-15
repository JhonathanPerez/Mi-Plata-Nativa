# STATE — Mi Plata Nativa (máximo 60 líneas)

> Lo actualiza la IA al cierre de cada sesión (prompt de cierre). Si pasa de 60 líneas, resume.

## Dónde estamos
- Etapa cerrada: **00 — kit de trabajo y repositorio listo** (sin código Kotlin)
- Última etapa cerrada: 00
- Último hito: `hito-etapa-00` (lo crea `Publicar-PR.ps1 -Etapa 0` al fusionar)
- Versión publicada: ninguna (release DESACTIVADO hasta la etapa 39)

## Siguiente paso exacto
<!-- SIGUIENTE:INICIO -->
Etapa 01 · rama `build/gradle-esqueleto-multimodulo` · PR `build(gradle): crea el esqueleto multimódulo con identificadores propios`
0. Antes: `Publicar-PR.ps1 -Etapa 0` debe haber terminado (tag `hito-etapa-00`). Luego `git switch main` y `git pull --ff-only`.
1. `./scripts/Verificar-Versiones.ps1` y pegar la tabla a la IA; `./scripts/Armar-Adjunto.ps1 -Etapa 1` (adjunta `capacitor.config.ts`).
2. La IA entrega `etapa-01-esqueleto-multimodulo.zip`. Rama de la ficha y `./scripts/Aplicar-Etapa.ps1 -Zip ...`.
3. Commits en orden: `build(gradle): crea el esqueleto multimódulo y el catálogo de versiones`, luego
   `build(app): define applicationId propio, sufijo debug y versionado por fórmula`.
4. `./scripts/Crear-GradleWrapper.ps1 -Version X.Y.Z` (la IA dice la versión), abrir en Android Studio y probar en el teléfono.
5. Cierre: commit `docs(estado): registra el cierre de la etapa 01` y `./scripts/Publicar-PR.ps1 -Etapa 1`.
Entregable: settings.gradle.kts, libs.versions.toml, módulos vacíos, :app con Hilt y pantalla «Hola», FileProvider con `${applicationId}`, CI verde.
Pregunta de cambios: No. Ficha completa en `docs/etapas/etapa-01.md`.
<!-- SIGUIENTE:FIN -->

## Cambios pedidos vigentes (CHG)
Ninguno. (Detalle completo en `docs/CAMBIOS.md`; aquí solo `CHG-xx: resumen en una línea`.)

## Decisiones vigentes que importan
- applicationId `co.miplata.nativa` (+`.debug`), nombre «Mi Plata Nativa», versionCode = major*1.000.000+minor*1.000+patch.
- Identificadores que pueden chocar con el híbrido: siempre `${applicationId}`; nunca `co.miplata.app`.
- Esquema Room v1 nuevo (estado final del híbrido); los datos entran solo por la importación guiada.
- Versiones de librerías: ver `docs/VERSIONES.md` (no inventar; verificar con `Verificar-Versiones.ps1`).
- ADR-025: `package.json` con `"type": "module"`; `commitlint.config.js` es ES module (un `.js` nuevo en la raíz también lo sea, o `.cjs`).

## Pendientes y avisos
- Mientras convivan híbrido y nativa, captura de notificaciones y recordatorios activos en UNA sola app.
- Defectos del híbrido por corregir: ver `docs/DEFECTOS-HIBRIDO.md` (D-01 a D-12).
- Etapa 00 completa en la parte técnica. Falta solo confirmar en GitHub: PR fusionado, tag `hito-etapa-00` y workflow *Release* con jobs omitidos.
- Avisos de CRLF→LF en los `.ps1` son normales (`.gitattributes` fuerza LF). Opcional: `git add --renormalize .` en un commit `chore`.
- Etapa no partida: nada quedó incompleto.

## Historial de etapas cerradas
- 00 · kit de trabajo (herramientas de commits con husky + commitlint, semantic-release desactivado, CI, scripts PowerShell, docs de 41 etapas) · hito-etapa-00
