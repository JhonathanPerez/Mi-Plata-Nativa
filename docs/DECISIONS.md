# DECISIONES (ADR)

Formato: Contexto → Decisión → Consecuencias. Estado: **aceptada** salvo nota. Una decisión nueva se agrega al final con el siguiente número;
las cambiadas se marcan «reemplazada por ADR-xx», nunca se borran.

### ADR-001 — Repositorio nativo independiente
**Contexto:** el híbrido sigue vivo con su ciclo propio. **Decisión:** repo nuevo `JhonathanPerez/Mi-Plata-Nativa`, público; el código del híbrido nunca entra (ni copiado, ni submódulo, ni monorepo); se lee solo lo que el dueño adjunta por etapa.
**Consecuencias:** el CI vigila que no aparezcan `*.tsx`, `capacitor.config.*` ni `co.miplata.app`. Los adjuntos viven fuera del repo (`Armar-Adjunto.ps1` lo exige).

### ADR-002 — applicationId distinto y sufijo debug
**Decisión:** `co.miplata.nativa`; debug `co.miplata.nativa.debug`; nombre «Mi Plata Nativa». `namespace` = `co.miplata.nativa`.
**Consecuencias:** se pueden tener instaladas a la vez el híbrido, la nativa release y la nativa debug.

### ADR-003 — Identificadores derivados de `${applicationId}`
**Contexto:** dos apps con la misma autoridad de FileProvider no se instalan juntas. **Decisión:** autoridades, acciones y permisos propios siempre con `${applicationId}` (manifiesto) o `BuildConfig.APPLICATION_ID` (código).
**Consecuencias:** además de `.debug` y release distintos, el híbrido no choca. Verificación automática en CI.

### ADR-004 — Versionado y publicación
**Decisión:** semantic-release (Conventional Commits en español); primera publicación 1.0.0 sin etiqueta base; `versionCode = major*1.000.000 + minor*1.000 + patch`; Gradle recibe `-PappVersion`. Tags de versión nunca a mano; hitos `hito-etapa-NN`.
**Consecuencias:** minor y patch limitados a 999. El release está desactivado (`if: false`) hasta la etapa 39.

### ADR-005 — Multimódulo con `build-logic`
**Decisión:** módulos `:app`, `:core:*`, `:feature:*`, `:platform:*` y convention plugins en `build-logic/`. **Por qué:** builds incrementales, límites de dependencia verificables, y etapas pequeñas que tocan pocos módulos.
**Consecuencias:** más archivos Gradle; se compensa con plugins de convención.

### ADR-006 — MVVM con flujo unidireccional
**Decisión:** `UiState` inmutable (StateFlow) + `onEvent`; sin lógica en composables; casos de uso en `:core:domain`. **Por qué:** pruebas sencillas y comportamiento predecible.

### ADR-007 — Room 2.8.5 (no Room 3)
**Contexto:** el 15-nov-2026 existen Room 2.8.5 (`androidx.room`) y Room 3.0.3 (`androidx.room3`, enfocado en KMP, sin SupportSQLite). **Decisión:** Room 2.8.5 con KSP. **Por qué:** app solo Android, mayor cantidad de documentación y menor riesgo para sesiones cortas de IA.
**Consecuencias:** migrar a Room 3 queda como mejora futura (ADR nuevo). `exportSchema = true`.

### ADR-008 — DataStore para ajustes
**Decisión:** Preferences DataStore para las claves de `SETTING_KEYS`; la tabla `settings` del híbrido no existe en Room. La importación traduce esas claves.

### ADR-009 — Navigation Compose con rutas tipadas
**Contexto:** existen Navigation 2.10.2 y Navigation3 1.2.0. **Decisión:** Navigation Compose 2.10.2 con rutas `@Serializable`, como pide el encargo. **Consecuencias:** requiere el plugin y la librería de serialización (versiones por verificar en la etapa 01).

### ADR-010 — Esquema Room v1 desde el estado final del híbrido
**Contexto:** el híbrido tiene 8 migraciones. **Decisión:** la nativa nace con el esquema final como v1; las migraciones del híbrido no se portan; los datos entran por la importación. **Consecuencias:** semillas solo Efectivo y Transferencia; sin datos personales sembrados (D-06).

### ADR-011 — Importación guiada no destructiva
**Decisión:** pantalla guiada: elegir archivo → (contraseña si está cifrado) → resumen (cantidades y totales) → confirmar → importar en una sola transacción → verificar. No borra nada. Acepta `mi-plata-backup` v1–3, el sobre `mi-plata-backup-encrypted` y `mi-plata-raw-dump`.
**Consecuencias:** si ya hay datos en la nativa, el comportamiento está definido en la etapa 17 (se pregunta al dueño); nunca reemplaza en silencio.

### ADR-012 — Formato de copia JSON compatible
**Decisión:** la nativa exporta el mismo `mi-plata-backup` v3 (y lo cifra con el mismo sobre AES-256-GCM, PBKDF2-SHA256, 600.000 iteraciones). Cualquier cambio de formato exige aviso al dueño y un CHG.

### ADR-013 — Un solo lector de notificaciones
**Contexto:** el híbrido mantiene dos lectores (TS y Java) «en sintonía». **Decisión:** un parser Kotlin en `:core:domain` que usan el servicio y la pantalla «Pegar un mensaje». Las pruebas de ambos se unen.

### ADR-014 — Copias automáticas con WorkManager y casos de uso
**Decisión:** `PeriodicWork`/`OneTimeWork` en `:platform:backup`; el worker usa los casos de uso sobre Room y escribe la copia normal (no el volcado crudo). Se conservan las últimas 5 locales y se envían a la carpeta de nube elegida (SAF). La contraseña vive en Android Keystore.

### ADR-015 — Recordatorios
**Decisión:** avisos de pago y de pendientes con WorkManager/AlarmManager según exactitud necesaria, más un receptor de arranque que reprograma (D-04). Permiso de notificaciones (Android 13+) y de alarmas exactas solo si hace falta.

### ADR-016 — Pruebas
**Decisión:** JUnit 4 + MockK + Turbine (+ Robolectric para Room y Android), pruebas de Compose para UI. Se porta primero cada `*.test.ts`. Versiones por verificar en la etapa 01.

### ADR-017 — Actualizador interno
**Decisión:** consulta `https://api.github.com/repos/JhonathanPerez/Mi-Plata-Nativa/releases/latest` como mucho una vez por hora; descarga solo de `https://github.com/JhonathanPerez/Mi-Plata-Nativa/releases/download/…`; antes de instalar verifica que el APK tenga el `packageName` de la nativa, una versión mayor y la misma firma que la app instalada; si no, lo borra y avisa. `FileProvider` propio `${applicationId}.updates`.
**Consecuencias:** el repo debe ser público. El debug no se actualiza a release (firmas distintas).

### ADR-018 — Excel sin librerías pesadas
**Decisión:** escritor/lector `.xlsx` propio con `java.util.zip` y XML. **Por qué:** `exceljs` no existe en Android y Apache POI es demasiado pesado. Se confirma con el dueño en la etapa 26.

### ADR-019 — Firma propia
**Decisión:** keystore NUEVO generado con `Generar-Keystore.ps1`, guardado fuera del repo y cargado como secretos de CI (`ANDROID_KEYSTORE_B64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`). Si se pierde, no se podrán publicar actualizaciones: hay que guardar una copia.

### ADR-020 — minSdk 26
**Decisión:** `minSdk 26` (Android 8.0). **Por qué:** `java.time` nativo y canales de notificación sin compatibilidad extra. El híbrido (Capacitor 7) llega a 23; el dueño puede pedir bajarlo con un CHG si algún teléfono lo exige.

### ADR-021 — Compilación con AGP 9 y Kotlin integrado
**Decisión:** AGP 9.2.x con Kotlin integrado (sin `org.jetbrains.kotlin.android`), KSP 2.3.x, Dagger/Hilt 2.59.x (soporta AGP 9), módulos JVM puros con `org.jetbrains.kotlin.jvm`. JDK 17.
**Consecuencias:** cada subida de AGP puede mover la versión de Kotlin; revisar KSP en cada actualización.

### ADR-022 — Cambios pedidos como desviaciones registradas
**Decisión:** cada cambio sobre el híbrido pasa por la «pregunta de cambios» de la etapa, se anota como `CHG-xx` en `docs/CAMBIOS.md` y en el pie `Cambio-pedido:` del commit.

### ADR-023 — Fuentes del tema
**Decisión:** Bricolage Grotesque y Figtree como archivos TTF variables en `res/font` (bajados con `Descargar-Fuentes.ps1`), no como «downloadable fonts» (la app es offline).

### ADR-024 — Privacidad y red
**Decisión:** sin analítica ni servidores propios; `allowBackup=false`; la única conexión de red es la consulta/descarga de actualizaciones a GitHub.

### ADR-025 — Herramientas de Node como ES modules
**Contexto:** `commitlint.config.js` usa `export default` y `package.json` no declaraba el tipo de módulo; Node avisaba `MODULE_TYPELESS_PACKAGE_JSON` en cada commit y reanalizaba el archivo. **Decisión:** `"type": "module"` en `package.json`; la configuración de commitlint sigue como `commitlint.config.js` en sintaxis ES module.
**Consecuencias:** cualquier `.js` nuevo en la raíz debe ser ES module (o `.cjs` si usa `require`). `.releaserc.json` y los scripts `.ps1` no se ven afectados. Los avisos de CRLF→LF de los `.ps1` son esperados por `.gitattributes` (`* text=auto eol=lf`); se corrigen una vez con `git add --renormalize .`.

### ADR-026 — compileSdk 37, targetSdk 36 y versiones efectivas de la etapa 01
**Contexto:** con el BOM de Compose 2026.09.00 (Compose 1.12.1) y `core-ktx` 1.19.1, `checkDebugAarMetadata` exige compilar contra Android 37; con `compileSdk = 36` el build falla. **Decisión:** `compileSdk = 37` en todos los módulos Android; `targetSdk = 36` y `minSdk = 26` no cambian (compilar contra una API nueva no altera el comportamiento en ejecución ni los teléfonos compatibles). Versiones efectivas (de `Verificar-Versiones.ps1`, 15-nov-2026): AGP 9.5.1, Kotlin 2.4.21, KSP 2.3.14, Hilt 2.60.1, Gradle 9.9.1, BOM Compose 2026.09.00 (fija `material3`), JDK 17 como destino.
**Consecuencias:** complementa ADR-021 (que citaba AGP 9.2.x e Hilt 2.59.x como mínimos). Hace falta el SDK de Android 37 instalado. Subir `targetSdk` será una decisión aparte.

### ADR-027 — Esqueleto mínimo de la etapa 01 con convention plugins de `build-logic`
**Contexto:** la etapa 01 necesita pocos módulos, pero ADR-005 pide convention plugins desde el inicio para no repetir configuración. **Decisión:** módulos iniciales `:app`, `:core:domain` (JVM puro), `:core:data` y `:core:ui` (vacíos); el resto de `:core:*`, `:feature:*` y `:platform:*` se crea en la etapa que lo necesite. `build-logic/convention` (build incluido desde `settings.gradle.kts`, lee el mismo `libs.versions.toml`) ofrece tres plugins: `miplata.android.application`, `miplata.android.library` y `miplata.jvm.library`. Ahí viven compileSdk 37, targetSdk 36, minSdk 26, Java 17, destino JVM 17 de Kotlin, Compose y lint. Cada módulo solo declara lo suyo (`namespace`; en `:app`, applicationId y versión). La versión sale de `appVersion` (`gradle.properties`, por defecto 1.0.0; el CI de release la sobrescribe con `-PappVersion`) y el build falla si no es `X.Y.Z` o si minor/patch llegan a 1000. Release sin minificar y tema verde `#0B7A63` provisionales.
**Consecuencias:** cumple ADR-005. Subir un SDK o la versión de Java se hace en un solo archivo (`ProjectDefaults.kt`). Los plugins dependen de las clases de AGP y KGP vía `compileOnly`; si una subida de AGP cambia su API de extensiones, se ajusta en `build-logic`. `gradle/gradle-daemon-jvm.properties` se versiona.
