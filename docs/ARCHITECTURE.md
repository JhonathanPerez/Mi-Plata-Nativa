# ARCHITECTURE

Multimódulo, MVVM con flujo unidireccional (UDF), inyección con Hilt, persistencia con Room y DataStore, navegación con Navigation Compose.
Cada decisión tiene su ADR en `docs/DECISIONS.md`.

## Capas y dependencias

```
:app ─────────────► :feature:*  ───► :core:ui ─► :core:designsystem
  │                    │                 │
  │                    ▼                 ▼
  ├──────────────► :core:domain  ◄── :core:model        (JVM puro: sin Android)
  │                    ▲
  ├──────────────► :core:data  ──► :core:database (Room) · :core:datastore (DataStore)
  └──────────────► :platform:*  (servicios, receivers, workers, FileProvider)
```

Regla: las flechas solo van hacia abajo. `:core:domain` no conoce Android, Room ni Compose.

## Módulos (Gradle path → paquete base `co.miplata.nativa`)

| Módulo | Tipo | Contenido | Etapas |
|---|---|---|---|
| `:app` | Android app | `Application`, `MainActivity`, grafo de navegación, módulos Hilt de ensamblado, manifiesto, `BuildConfig` | 01, 16, 34, 37 |
| `:core:model` | Kotlin JVM | Entidades y tipos de dominio (`Expense`, `Category`, `PaymentMethod`, `SavingsAccount`, `CycleRules`, `BackupFile`…) | 02–08 |
| `:core:domain` | Kotlin JVM | Reglas puras (dinero, fechas, ciclos, extractos, ahorros, lector de notificaciones, recordatorios), interfaces de repositorio y casos de uso | 02–14 |
| `:core:database` | Android lib | Room: entidades, DAO, convertidores, esquema v1 exportado | 09 |
| `:core:datastore` | Android lib | Ajustes con DataStore (equivalente a `SETTING_KEYS`) | 13 |
| `:core:data` | Android lib | Implementaciones de repositorio, mapeos, transacciones, módulos Hilt | 10–14 |
| `:core:designsystem` | Android lib | Tema Material 3, colores, tipografía (fuentes), componentes base | 15 |
| `:core:ui` | Android lib | Piezas compartidas con estado (privacidad, toasts, confirmaciones, formato de dinero) | 15–16 |
| `:core:testing` | Android lib | Fakes, fixtures, reglas de prueba | 09+ |
| `:feature:home / expenses / history / stats / catalogs / cards / savings / capture / settings / importer / excel` | Android lib | Pantalla (`Route` + `Screen`), `ViewModel`, `UiState`, navegación propia | 17–34 |
| `:platform:capture` | Android lib | `NotificationListenerService`, almacén de capturas | 27 |
| `:platform:reminders` | Android lib | Avisos de pago y pendientes (WorkManager/AlarmManager), receptor de arranque | 29 |
| `:platform:lock` | Android lib | BiometricPrompt y política de bloqueo | 30 |
| `:platform:backup` | Android lib | Copias programadas (WorkManager), carpeta de nube (SAF), Keystore | 31–32 |
| `:platform:update` | Android lib | Consulta a GitHub, descarga, verificación de package y firma, instalador, FileProvider | 33 |
| `build-logic` | Gradle incluido | Convention plugins (`miplata.android.library`, `.feature`, `.jvm.library`) | 01 |

## MVVM con flujo unidireccional

```
Screen (Compose) ──Event──► ViewModel ──► UseCase ──► Repository (interfaz en :core:domain)
      ▲                         │                          │
      └──────UiState (StateFlow)┘                          ▼ impl en :core:data → Room / DataStore
```

- Un `UiState` inmutable por pantalla (data class o sealed interface), expuesto como `StateFlow` y leído con `collectAsStateWithLifecycle`.
- Los eventos de usuario suben como una sola función `onEvent(XxxEvent)`; el ViewModel decide.
- Efectos de una sola vez (navegar, mostrar aviso) van como estado consumible o canal; nunca se guardan en el `UiState`.
- Los composables «Screen» son sin estado (reciben `UiState` y `onEvent`); la «Route» los conecta al ViewModel con Hilt.
- Los ViewModels no usan `Context`. Lo Android entra por interfaces definidas en `:core:domain` e implementadas en `:platform:*`.

## Datos

- **Room** (esquema v1 nuevo con el estado final del híbrido v8): tablas `categories, payment_methods, expenses, budgets, pending_captures, learned_spam_phrases, card_statement_dates, savings_accounts, savings_movements`. Montos `INTEGER` (Long). Fechas como `TEXT` ISO (`AAAA-MM-DD`) para que la importación y las consultas sean idénticas al híbrido.
- **DataStore** guarda los ajustes (tema, bloqueo, recordatorios, copias, actualizaciones). La tabla `settings` del híbrido se importa a DataStore, no a Room.
- Transacciones: el gasto pagado con una cuenta de ahorro y su retiro se escriben en una sola transacción; la importación completa también.
- `exportSchema = true` y pruebas de migración desde la v1 en adelante.

## Android nativo (reescrito en Kotlin)

| Función del híbrido (Java) | Destino Kotlin | Nota |
|---|---|---|
| `CaptureListenerService`, `CaptureStore`, `NotificationCapturePlugin`, `ExpenseTextParser` | `:platform:capture` + parser único en `:core:domain` | Sin gemelo Java/TS |
| `PendingReminderReceiver`, `localNotifications.ts` | `:platform:reminders` | + receptor de arranque (D-04) |
| `BackupWorker/Scheduler/ScheduleStore/Timing`, `RawDump`, `SqliteDumpSource`, `BackupNames` | `:platform:backup` | Worker usa los casos de uso sobre Room y escribe la copia normal |
| `CloudFolderPlugin/Store`, `SecretStore`, `BackupCrypto`, `Pbkdf2` | `:platform:backup` | SAF + Keystore + AES-256-GCM / PBKDF2-SHA256 |
| `AppUpdatePlugin`, `UpdateFileProvider`, `update_paths.xml` | `:platform:update` | Solo repo nuevo; verifica package y firma |

## Convivencia (reglas de arquitectura obligatorias)

1. Autoridades de FileProvider, acciones de intents/broadcasts y permisos propios: `${applicationId}` en manifiesto; `BuildConfig.APPLICATION_ID` en código.
2. El CI falla si encuentra `co.miplata.app` o código del híbrido (`*.tsx`, `capacitor.config.*`).
3. Importación guiada: lee la copia JSON, muestra resumen (cantidades y totales), pide confirmar, importa en UNA transacción, verifica y NO borra nada.
4. La app avisa (pantalla de importación y Ajustes) que captura y recordatorios deben estar activos en una sola de las dos apps.
5. El actualizador compara `packageName` y firma del APK descargado con los de la app instalada y solo descarga de `github.com/JhonathanPerez/Mi-Plata-Nativa/releases/download/…`.

## Compilación

AGP con Kotlin integrado, Compose con el plugin del compilador, KSP para Hilt y Room, catálogo de versiones `gradle/libs.versions.toml`.
Versiones: `docs/VERSIONES.md`. Ver ADR-021.
