# VERSIONES — verificadas en la web el 15-nov-2026

Regla: no se inventan versiones. La etapa 01 vuelve a verificarlas con `scripts/Verificar-Versiones.ps1` (consulta Google Maven y Maven Central
desde tu PC) y reemplaza lo que haya salido después de esta fecha. La IA dice cuáles usó en el PR.

## Verificadas (fuente)

| Componente | Versión | Fuente |
|---|---|---|
| Android Gradle Plugin | 9.2.1 (línea 9.2, abril 2026; compileSdk hasta 37) | developer.android.com/build/releases (notas AGP 9.2.0/9.2.1) |
| Kotlin en AGP | integrado (KGP ≥ 2.2.10 como dependencia de AGP 9) | developer.android.com/build/migrate-to-built-in-kotlin |
| KSP | 2.3.10 (independiente de la versión de Kotlin desde 2.3.0; soporta AGP 9 y Kotlin integrado) | github.com/google/ksp/releases |
| Compose BOM | 2026.08.00 (Compose 1.12.0; hoy ya hay Compose 1.12.1) | developer.android.com/develop/ui/compose/bom |
| Material 3 | 1.4.0 | developer.android.com/jetpack/androidx/versions |
| Activity (+compose) | 1.13.0 | idem |
| Core KTX | 1.19.1 | idem |
| Lifecycle | 2.11.0 | idem |
| Navigation (Compose) | 2.10.2 | idem |
| Room | 2.8.5 (existe Room 3.0.3 en `androidx.room3`; ver ADR-007) | idem |
| DataStore | 1.3.0 | idem |
| WorkManager | 2.12.0 | developer.android.com/jetpack/androidx/versions/stable-channel |
| Biometric | 1.1.0 | idem |
| AndroidX Hilt (navigation-compose, work) | 1.4.0 | idem |
| DocumentFile | 1.1.0 | idem |
| Dagger / Hilt | 2.59.2 (trae soporte de AGP 9) | github.com/google/dagger/releases |
| Gradle (wrapper) | 9.7.1 aparece como versión actual de Gradle en septiembre 2026; confirmar con `Crear-GradleWrapper.ps1` | repo gradle/actions (`.tool-versions`) |
| JDK | 17 (mínimo de AGP 9); CI con Temurin 17 | developer.android.com (AGP 9.0) |
| actions/checkout | v7 | usada también por el híbrido |
| actions/setup-java | v5 | github.com/actions/setup-java |
| gradle/actions/setup-gradle | v6 (aceptar los términos de uso del componente de caché) | github.com/gradle/actions |
| actions/upload-artifact | v7 | PR de actualización de acciones (may 2026) |
| actions/setup-node | v7 | usada también por el híbrido |
| cycjimmy/semantic-release-action | v4 (semantic-release 24) | usada también por el híbrido |
| semantic-release, commitlint, husky y plugins | los mismos rangos de `package.json` del híbrido | zip del híbrido |

## Por verificar en la etapa 01 (no las inventé)

| Componente | Cómo se verifica |
|---|---|
| kotlinx-coroutines | `Verificar-Versiones.ps1` |
| kotlinx-serialization-json | idem |
| JUnit 4, MockK, Turbine, Robolectric | idem |
| Compose Kotlin plugin (`org.jetbrains.kotlin.plugin.compose`) y plugin de serialización | misma versión de Kotlin que use AGP 9.2.x; confirmarla en las notas de AGP |
| Gradle exacto compatible con AGP 9.2.1 | tabla de compatibilidad de AGP |
| BOM de Compose más nueva que 2026.08.00 | `Verificar-Versiones.ps1` (artefacto `androidx.compose:compose-bom`) |

## SDK
- `compileSdk`: el que exija AGP/Compose (Compose 1.12 pide compileSdk 37). `targetSdk` = `compileSdk`.
- `minSdk` 26 (ver ADR-020).
