# INVENTARIO DEL HÍBRIDO (rellenado desde el zip, versión 1.6.1)

Fuente de verdad para planear. El código del híbrido NO está en este repo; solo se adjunta por etapa.

## Identidad
| Dato | Valor |
|---|---|
| Nombre / paquete | Mi Plata / `co.miplata.app` |
| Versión | **1.6.1** (package.json y CHANGELOG; el encargo decía 1.5.0) |
| Stack | Capacitor 7, React 18, TypeScript 5.6, Vite 5, SQLite (`@capacitor-community/sqlite`), Vitest 2 |
| Repo de actualizaciones | `JhonathanPerez/Mi-Plata-App` (`UPDATE_REPO`) |
| Publicación | semantic-release + `release.yml`; APK `mi-plata-vX.Y.Z.apk`; secretos `ANDROID_KEYSTORE_*` |
| Pruebas | 38 archivos `*.test.ts`, ≈ 387 casos (`it`/`test`) |

## Funciones (por README y código)
Registro de gastos en COP (enteros) · presupuesto mensual · historial con filtros · estadísticas · modo privacidad · exportar e importar Excel · copia JSON ·
bloqueo con huella/rostro/PIN · captura automática desde notificaciones · pagado/por pagar y extractos de tarjeta de crédito · cuentas de ahorro ·
avisos de pago y de pendientes con la app cerrada · copias automáticas programadas con envío a carpeta de la nube (cifradas) · actualizador desde GitHub Releases.

## Pantallas (src/pages, 22)
| Pantalla | KB | Etapa |
|---|---|---|
| AutoBackupPage | 17.0 | 32 |
| CaptureSetupPage | 2.5 | 28 |
| CardRulesPage | 8.4 | 24 |
| CardsPage | 2.9 | 24 |
| CategoriesPage | 6.8 | 23 |
| ExpenseDetailPage | 5.9 | 19 |
| ExpenseFormPage | 16.6 | 18 |
| ExportPage | 4.6 | 26 |
| HistoryPage | 9.6 | 20 |
| HomePage | 9.0 | 21 |
| LockSettingsPage | 3.4 | 30 |
| PayCardPage | 9.0 | 24 |
| PaymentMethodsPage | 9.8 | 23 |
| PaymentRemindersPage | 0.4 | 29 |
| PendingPage | 6.4 | 28 |
| PendingRemindersPage | 0.4 | 29 |
| SavingsAccountPage | 7.9 | 25 |
| SavingsPage | 3.9 | 25 |
| SettingsPage | 11.3 | 34 |
| StatementsPage | 9.2 | 24 |
| StatsPage | 10.3 | 22 |
| TrackedAppsPage | 5.3 | 28 |

## Servicios y repositorios (reglas de negocio / SQL)
| Archivo | KB |
|---|---|
| src/services/autoBackupService.ts | 9.7 |
| src/services/backupService.ts | 14.0 |
| src/services/budgetService.ts | 2.4 |
| src/services/captureAppsService.ts | 1.8 |
| src/services/captureService.ts | 6.7 |
| src/services/captureSync.ts | 1.6 |
| src/services/cardService.ts | 11.8 |
| src/services/categoryService.ts | 3.4 |
| src/services/cloudBackupService.ts | 4.6 |
| src/services/excelWriter.ts | 4.9 |
| src/services/expenseService.ts | 12.0 |
| src/services/exportData.ts | 4.4 |
| src/services/exportService.ts | 1.1 |
| src/services/importService.ts | 11.9 |
| src/services/lockService.ts | 1.2 |
| src/services/paymentMethodService.ts | 5.0 |
| src/services/reminderService.ts | 4.2 |
| src/services/reminderSync.ts | 4.7 |
| src/services/savingsService.ts | 10.6 |
| src/services/settingsService.ts | 1.7 |
| src/services/spamLearningService.ts | 1.5 |
| src/services/statsService.ts | 6.4 |
| src/services/updateService.ts | 3.6 |
| src/repositories/backupRepository.ts | 4.8 |
| src/repositories/budgetRepository.ts | 1.3 |
| src/repositories/cardCycleRepository.ts | 2.3 |
| src/repositories/categoryRepository.ts | 3.0 |
| src/repositories/expenseRepository.ts | 10.6 |
| src/repositories/learnedSpamRepository.ts | 1.9 |
| src/repositories/paymentMethodRepository.ts | 4.3 |
| src/repositories/pendingCaptureRepository.ts | 3.2 |
| src/repositories/savingsRepository.ts | 5.8 |
| src/repositories/settingsRepository.ts | 1.0 |

## Reglas puras (src/lib sin pruebas)
`appUpdate.ts`, `autoBackup.ts`, `backNavigation.ts`, `backStack.ts`, `backgroundBackup.ts`, `backupCrypto.ts`, `backupSecret.ts`, `backupStore.ts`, `biometrics.ts`, `captureCopy.ts`, `cardColor.ts`, `cardDue.ts`, `cloudFolder.ts`, `comparison.ts`, `cssVars.ts`, `cx.ts`, `cycles.ts`, `dailyChart.ts`, `dataBus.ts`, `dates.ts`, `errors.ts`, `fileIO.ts`, `haptics.ts`, `historyLink.ts`, `ids.ts`, `localNotifications.ts`, `lockPolicy.ts`, `money.ts`, `navigationState.ts`, `notificationCapture.ts`, `parseNotification.ts`, `payment.ts`, `pendingReminders.ts`, `rawDump.ts`, `reminders.ts`, `savings.ts`, `spamLearning.ts`, `statementStatus.ts`, `statementText.ts`, `statements.ts`, `text.ts`, `updateBridge.ts`

## Código nativo propio en Java (se reescribe en Kotlin)
| Archivo | Hace | Destino | Etapa | KB |
|---|---|---|---|---|
| AppUpdatePlugin.java | Actualizador: descarga, verifica package/firma, instalador | `:platform:update` | 33 | 15.6 |
| BackupCrypto.java | AES-256-GCM de las copias | `:core:domain` / `:platform:backup` | 08 | 1.9 |
| BackupNames.java | Nombres de archivo de copia | `:core:domain` | 31 | 2.2 |
| BackupSchedulePlugin.java | Puente Capacitor de copias | (desaparece) | 31 | 4.3 |
| BackupScheduleStore.java | Guarda frecuencia y hora | `:core:datastore` | 31 | 3.7 |
| BackupScheduler.java | Programa la tarea | `:platform:backup` | 31 | 3.8 |
| BackupTiming.java | Cálculo del próximo horario | `:core:domain` | 31 | 2.2 |
| BackupWorker.java | Tarea en segundo plano de copias | `:platform:backup` | 31 | 4.2 |
| CaptureListenerService.java | NotificationListenerService de la captura | `:platform:capture` | 27 | 16.5 |
| CaptureStore.java | Guarda capturas para la app | `:platform:capture` | 27 | 9.9 |
| CloudFolderPlugin.java | Puente de la carpeta de nube (SAF) | (desaparece) | 32 | 5.2 |
| CloudFolderStore.java | Guarda el permiso de la carpeta | `:platform:backup` | 32 | 7.2 |
| ExpenseTextParser.java | Gemelo Java del lector de mensajes | `:core:domain` (parser único) | 06 | 17.4 |
| MainActivity.java | Registra los plugins | `:app` (`MainActivity` Compose) | 01 | 0.5 |
| NotificationCapturePlugin.java | Puente Capacitor de la captura | (desaparece) | 27 | 7.3 |
| Pbkdf2.java | PBKDF2-SHA256 | `:core:domain` / `:platform:backup` | 08 | 1.5 |
| PendingReminderReceiver.java | Cadena de avisos de pendientes (AlarmManager) | `:platform:reminders` | 29 | 9.3 |
| RawDump.java | Volcado crudo de la base | (desaparece; D-02) | 31 | 3.8 |
| SecretStore.java | Contraseña cifrada con Android Keystore | `:platform:backup` | 32 | 3.2 |
| SqliteDumpSource.java | Lee SQLite para el volcado | (desaparece; D-02) | 31 | 5.4 |
| UpdateFileProvider.java | FileProvider propio `.updates` | `:platform:update` | 33 | 0.7 |
| res/ic_stat_miplata.xml, res/update_paths.xml | ícono de avisos y rutas del FileProvider | `:platform:*` | 29 / 33 | — |

## Esquema de datos final (SQLite v8)
`categories`, `payment_methods` (+`cycle_rules` JSON, `savings_account_id`), `expenses` (+`paid_at`, `observations`), `budgets`, `settings`, `pending_captures` (estados pending/accepted/dismissed/spam, huella),
`learned_spam_phrases`, `card_statement_dates` (PK método+periodo), `savings_accounts` (+`last4`), `savings_movements` (deposit/withdrawal, `expense_id` único).
IDs `TEXT` (UUID); montos `INTEGER`; fechas `TEXT` ISO. Detalle en las migraciones 001–008 (adjuntas en la etapa 09).

## Ajustes (`SETTING_KEYS`)
theme, last_payment_method_id, seeded, biometric_lock, lock_delay_seconds, payment_reminders, reminder_lead_days, reminder_hour, pending_reminders, pending_reminder_minutes,
capture_apps, hide_amounts, swipe_hint_count, auto_backup_frequency, auto_backup_time, auto_backup_last, cloud_backup_last, cloud_backup_encrypted, cloud_backup_error,
update_last_check, update_skipped_version, update_skipped_at.

## Constantes que mandan
MAX_AMOUNT 999.999.999.999 · NOTE_MAX_LENGTH 200 · OBSERVATIONS_MAX_LENGTH 500 · NAME_MAX_LENGTH 30 · BACKUP_FORMAT `mi-plata-backup` · BACKUP_VERSION 3 · AUTO_BACKUP_KEEP 5 ·
UPDATE_CHECK_INTERVAL 1 h · UPDATE_SNOOZE 24 h · STARTUP_SPLASH 1,2 s · KDF 600.000 iteraciones (mín. 1.000, máx. 5.000.000) · contraseña mínimo 8 caracteres.

## Formatos de copia que la importación debe aceptar
Ver `docs/FORMATO-COPIAS.md`.

## Pruebas existentes y a dónde van
| Archivo de prueba | Casos | Etapa | Acción |
|---|---|---|---|
| src/db/migrations/migrations.test.ts | 10 | 09 | adaptar: esquema final y semillas; las migraciones no se portan |
| src/lib/appUpdate.test.ts | 23 | 33 | portar |
| src/lib/autoBackup.test.ts | 18 | 31 | portar |
| src/lib/backNavigation.test.ts | 10 | 16 | portar lo que sea regla; el resto lo cubre Navigation Compose |
| src/lib/backupCrypto.test.ts | 6 | 08 | portar |
| src/lib/captureCopy.test.ts | 7 | 07 | portar |
| src/lib/cardColor.test.ts | 3 | 04 | portar |
| src/lib/cardDue.test.ts | 7 | 03 | portar |
| src/lib/comparison.test.ts | 13 | 05 | portar |
| src/lib/cycles.test.ts | 14 | 03 | portar |
| src/lib/dailyChart.test.ts | 7 | 05 | portar |
| src/lib/dates.test.ts | 11 | 02 | portar |
| src/lib/historyLink.test.ts | 8 | 05 | portar |
| src/lib/lockPolicy.test.ts | 5 | 30 | portar |
| src/lib/money.test.ts | 12 | 02 | portar |
| src/lib/navigationState.test.ts | 6 | 16 | portar lo que sea regla |
| src/lib/parseNotification.test.ts | 41 | 06 | portar |
| src/lib/payment.test.ts | 8 | 04 | portar |
| src/lib/pendingReminders.test.ts | 11 | 07 | portar |
| src/lib/rawDump.test.ts | 3 | 08 | portar |
| src/lib/reminders.test.ts | 10 | 07 | portar |
| src/lib/savings.test.ts | 21 | 05 | portar |
| src/lib/spamLearning.test.ts | 8 | 07 | portar |
| src/lib/statementStatus.test.ts | 5 | 04 | portar |
| src/lib/statementText.test.ts | 8 | 04 | portar |
| src/lib/statements.test.ts | 10 | 04 | portar |
| src/lib/text.test.ts | 4 | 02 | portar |
| src/services/autoBackupService.test.ts | 4 | 31 | portar |
| src/services/captureService.test.ts | 13 | 13 | portar |
| src/services/cardService.test.ts | 18 | 11 | portar |
| src/services/cloudBackupService.test.ts | 6 | 32 | portar |
| src/services/importParse.test.ts | 3 | 26 | portar |
| src/services/rawDump.test.ts | 1 | 08 | portar |
| src/services/reminderService.test.ts | 7 | 29 | portar |
| src/services/savingsService.test.ts | 23 | 12 | portar |
| src/services/services.test.ts | 13 | 10 | portar |
| src/styles/hygiene.test.ts | 5 | — | NO se porta (CSS) |
| src/styles/tokens.test.ts | 5 | 15 | reemplazar por pruebas del tema Compose |

Utilidades de prueba del híbrido: `src/test/fixtures.ts`, `src/test/sqliteTestDb.ts` (se reemplazan por `:core:testing`).

## Configuración y CI del híbrido (modelo, no se copia)
`.github/workflows/ci.yml` (typecheck + pruebas), `release.yml` (semantic-release + APK firmado con secretos), `.releaserc.json`, `commitlint.config.js`, `.husky/commit-msg`, `scripts/*.mjs` (inyectan manifiesto, ícono, firma y versión en la carpeta `android/` generada).
En la nativa todo eso es declarativo en Gradle (ver ADR-005 y ADR-019).
