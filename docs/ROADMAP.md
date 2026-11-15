# ROADMAP — de la preparación del repo a publicar la 1.0.0

Cada etapa cabe en **una sesión** de un chat gratuito. El detalle de cada una está en `docs/etapas/etapa-NN.md`
(rama, commits, título del PR, adjuntos, pregunta de cambios y definición de hecho). Los adjuntos de cada etapa
los arma `scripts/Armar-Adjunto.ps1`.

Tamaños: **S** < 45 KB de adjuntos, **M** < 100 KB, **L** más (≈ 3,5 bytes por token).

## Fases

| Fase | Etapas | Qué se logra |
|---|---|---|
| 0 Preparación | 00–01 | Repo, CI y esqueleto multimódulo con `applicationId` propio |
| 1 Reglas de negocio (puras, pruebas primero) | 02–08 | Dinero, ciclos, ahorros, lector de notificaciones, recordatorios, formato y cifrado de copias |
| 2 Datos | 09–14 | Room, repositorios, DataStore y estadísticas |
| 3 Interfaz | 15–26 | Tema, navegación, **importación desde el híbrido (17)** y todas las pantallas |
| 4 Plataforma Android | 27–33 | Captura, recordatorios, bloqueo, copias automáticas, nube y actualizador, en Kotlin |
| 5 Cierre | 34–40 | Ajustes, identidad, pruebas, firma, guías, activar la publicación y **publicar 1.0.0** |

La importación (etapa 17) va temprano a propósito: desde ahí puedes probar cada etapa siguiente con tus datos reales.

## Etapas

| Etapa | Rama | Título del PR | Tamaño | Pregunta de cambios |
|---|---|---|---|---|
| 00 | `chore/repo-kit-inicial` | chore(repo): agrega el kit de trabajo y deja el repositorio listo | S | — |
| 01 | `build/gradle-esqueleto-multimodulo` | build(gradle): crea el esqueleto multimódulo con identificadores propios | S | — |
| 02 | `feat/dominio-dinero-fechas-texto` | feat(dominio): agrega las reglas de dinero, fechas y texto | S | Sí |
| 03 | `feat/dominio-ciclos-de-tarjeta` | feat(dominio): agrega las reglas de ciclo y pago de tarjetas | S | Sí |
| 04 | `feat/dominio-extractos-y-pagos` | feat(dominio): agrega las reglas de extractos, estados de pago y color de tarjeta | S | Sí |
| 05 | `feat/dominio-ahorros-y-comparativos` | feat(dominio): agrega las reglas de ahorros, comparativos y serie diaria | S | Sí |
| 06 | `feat/captura-lectura-de-notificaciones` | feat(captura): agrega el lector de montos y comercios de notificaciones bancarias | M | Sí |
| 07 | `feat/captura-aprendizaje-y-recordatorios` | feat(captura): agrega las reglas de spam aprendido y de recordatorios | S | Sí |
| 08 | `feat/copias-formato-y-cifrado` | feat(copias): agrega el formato de copias de seguridad y su cifrado | M | — |
| 09 | `feat/datos-room-esquema` | feat(datos): agrega la base de datos Room con el esquema final | S | — |
| 10 | `feat/datos-gastos-y-categorias` | feat(datos): agrega los repositorios y reglas de gastos, categorías y presupuesto | M | Sí |
| 11 | `feat/datos-metodos-de-pago-y-tarjetas` | feat(datos): agrega métodos de pago, tarjetas y extractos | S | Sí |
| 12 | `feat/datos-cuentas-de-ahorro` | feat(datos): agrega cuentas de ahorro y sus movimientos | S | Sí |
| 13 | `feat/captura-pendientes-y-ajustes` | feat(captura): agrega capturas pendientes, ajustes con DataStore y apps de captura | S | Sí |
| 14 | `feat/datos-estadisticas` | feat(datos): agrega las consultas de estadísticas | S | Sí |
| 15 | `feat/ui-sistema-de-diseno` | feat(ui): agrega el tema, los colores, las fuentes y los componentes base | M | Sí |
| 16 | `feat/navegacion-arranque-y-barra-inferior` | feat(navegacion): agrega la navegación, la barra inferior y la pantalla de arranque | S | Sí |
| 17 | `feat/importacion-desde-el-hibrido` | feat(importacion): agrega la importación guiada desde el híbrido | S | Sí |
| 18 | `feat/gastos-registrar-y-editar` | feat(gastos): agrega el formulario para registrar y editar gastos | S | Sí |
| 19 | `feat/gastos-lista-y-detalle` | feat(gastos): agrega la lista de gastos y el detalle en forma de recibo | S | Sí |
| 20 | `feat/historial-filtros-y-meses` | feat(historial): agrega el historial con filtros y navegador de meses | S | Sí |
| 21 | `feat/inicio-resumen-y-presupuesto` | feat(inicio): agrega la pantalla de inicio con presupuesto y modo privacidad | S | Sí |
| 22 | `feat/estadisticas-graficos` | feat(estadisticas): agrega los gráficos de estadísticas | S | Sí |
| 23 | `feat/catalogos-categorias-y-metodos` | feat(catalogos): agrega la gestión de categorías y métodos de pago | S | Sí |
| 24 | `feat/tarjetas-credito-y-extractos` | feat(tarjetas): agrega las pantallas de tarjetas de crédito, reglas y extractos | M | Sí |
| 25 | `feat/ahorros-cuentas-y-movimientos` | feat(ahorros): agrega las pantallas de cuentas de ahorro | S | Sí |
| 26 | `feat/excel-exportar-e-importar` | feat(excel): agrega la exportación e importación de Excel | S | Sí |
| 27 | `feat/captura-servicio-de-notificaciones` | feat(captura): reescribe en Kotlin el lector de notificaciones | M | Sí |
| 28 | `feat/captura-por-categorizar` | feat(captura): agrega las pantallas de Por categorizar y de configuración de captura | S | Sí |
| 29 | `feat/recordatorios-avisos-de-pago-y-pendientes` | feat(recordatorios): reescribe en Kotlin los recordatorios con la app cerrada | M | Sí |
| 30 | `feat/seguridad-bloqueo-biometrico` | feat(seguridad): agrega el bloqueo con huella, rostro o PIN | S | Sí |
| 31 | `feat/copias-automaticas-programadas` | feat(copias): reescribe en Kotlin las copias automáticas programadas | M | Sí |
| 32 | `feat/copias-nube-cifrada` | feat(copias): agrega el envío de copias a la carpeta de la nube con cifrado | M | Sí |
| 33 | `feat/actualizador-apk-desde-github` | feat(actualizador): reescribe en Kotlin el actualizador de APK con verificación de firma | M | Sí |
| 34 | `feat/ajustes-pantalla-y-acerca-de` | feat(ajustes): agrega la pantalla de ajustes y acerca de | S | Sí |
| 35 | `feat/identidad-icono-y-nombre` | feat(identidad): agrega el ícono, el splash y el nombre de Mi Plata Nativa | S | Sí |
| 36 | `test/app-flujos-instrumentados` | test(app): agrega pruebas instrumentadas de los flujos principales | S | — |
| 37 | `build/release-firma-r8-y-versionado` | build(release): configura la firma, R8 y el versionado del APK de release | S | — |
| 38 | `docs/guias-usuario-y-convivencia` | docs(guias): agrega la guía de usuario y la guía de convivencia con el híbrido | S | — |
| 39 | `ci/release-activar-publicacion` | ci(release): activa el workflow de publicación con semantic-release | S | — |
| 40 | `feat/app-publicar-1-0-0` | feat(app): publica la primera versión nativa de Mi Plata (1.0.0) | S | — |

## Reglas

- Una etapa por sesión; no se adelanta la siguiente.
- El workflow de release está DESACTIVADO hasta la etapa 39; la 40 produce la 1.0.0.
- Los tags `hito-etapa-NN` marcan avance y no son versiones.
- Si una etapa resulta demasiado grande para una sesión, la IA la parte y lo anota en `docs/STATE.md`.
