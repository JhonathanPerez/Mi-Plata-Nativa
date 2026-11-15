# Mi Plata Nativa

Control de gastos personales para Colombia, 100 % offline, solo Android. Versión **nativa** (Kotlin + Jetpack Compose) de la app híbrida «Mi Plata».
Es una app APARTE: `co.miplata.nativa`, nombre «Mi Plata Nativa», versionado propio desde 1.0.0, convive instalada junto al híbrido.

## Por dónde empezar
1. Lee `docs/GUIA-WINDOWS.md` (sección 1 y 2) y deja listas las herramientas.
2. Corre `./scripts/Crear-Repo.ps1` y sigue la sección 3 (etapa 00).
3. Cada etapa: `docs/GUIA-WINDOWS.md` sección 4.

## Documentos
| Archivo | Para qué |
|---|---|
| `AGENTS.md` | Reglas del proyecto para cualquier IA |
| `docs/STATE.md` | Etapa actual y siguiente paso exacto (≤ 60 líneas) |
| `docs/CAMBIOS.md` | Cambios que pides respecto al híbrido (CHG-xx) |
| `docs/ROADMAP.md` y `docs/etapas/` | 41 etapas pequeñas (00 a 40, la última publica 1.0.0) |
| `docs/CONVENTIONS.md` | Ramas, commits, PR, tags, versiones, identificadores |
| `docs/ARCHITECTURE.md` y `docs/DECISIONS.md` | Arquitectura y registro de decisiones (ADR) |
| `docs/INVENTARIO-HIBRIDO.md`, `docs/DEFECTOS-HIBRIDO.md`, `docs/FORMATO-COPIAS.md` | Lo encontrado en el híbrido |
| `docs/VERSIONES.md` | Versiones de librerías verificadas y por verificar |
| `docs/FLUJO-DE-TRABAJO.md`, `docs/GUIA-WINDOWS.md` | Cómo trabajar en Windows 11 |
| `prompts/` | Inicio, cierre, corrección de errores y portado con pruebas |
| `scripts/` | PowerShell: crear repo, aplicar zip, armar adjunto, publicar PR, wrapper, fuentes, keystore, secretos |

## Reglas que no se rompen
- El código del híbrido nunca entra a este repo.
- Nada de `co.miplata.app`: todo identificador compartible sale de `${applicationId}`.
- Los tags de versión los crea semantic-release; el workflow `release.yml` está DESACTIVADO hasta la etapa 39.

## Licencia
Pendiente de elegir por el dueño (el repo es público porque el actualizador consulta GitHub sin credenciales).
