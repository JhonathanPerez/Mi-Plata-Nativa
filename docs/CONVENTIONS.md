# CONVENTIONS

## Idioma
Respuestas de la IA, textos de la app, comentarios, commits y PR: español (es-CO). Código e identificadores: inglés.
Textos de la app solo en `res/values/strings.xml` (es-CO); sin textos escritos en el código.

## Ramas
`tipo/ámbito-descripcion` — minúsculas, dígitos y guiones, sin acentos ni espacios.
Ejemplos: `feat/dominio-dinero-fechas-texto`, `build/gradle-esqueleto-multimodulo`, `fix/gastos-redondeo-de-presupuesto`.
Una rama por etapa. La rama se borra al fusionar.

## Commits (Conventional Commits en español)
`tipo(ámbito): descripción en minúscula, en infinitivo o presente, sin punto final` — máximo 100 caracteres en el encabezado.

| Tipo | Uso | Publica versión |
|---|---|---|
| feat | funcionalidad nueva visible | MINOR |
| fix | corrección de un defecto | PATCH |
| refactor, perf | reorganizar / mejorar rendimiento sin cambiar comportamiento | no |
| test | pruebas | no |
| build | Gradle, dependencias, versionado | no |
| ci | GitHub Actions | no |
| docs | documentación | no |
| style | formato | no |
| chore | tareas varias | no |
| revert | revertir | no |

- `feat!:` o `BREAKING CHANGE:` en el cuerpo → MAJOR (no se usa antes de la 1.0.0).
- Ámbito (kebab-case ASCII): `repo, gradle, app, dominio, datos, ui, navegacion, importacion, gastos, historial, inicio, estadisticas, catalogos, tarjetas, ahorros, excel, captura, recordatorios, seguridad, copias, actualizador, ajustes, identidad, release, guias, estado`.
- Pie para cambios pedidos (línea en blanco antes): `Cambio-pedido: CHG-01`.
- Orden dentro de una etapa: primero `test(...)` (pruebas portadas), después `feat(...)`, y al final `docs(estado): …` (cierre).

## Pull requests
- Título = un commit convencional (el CI lo valida con regex; ver `.github/workflows/ci.yml`).
- Se fusiona con **Squash and merge**: el título del PR y su cuerpo (con los pies `Cambio-pedido`) son el commit que lee semantic-release.
- `scripts/Publicar-PR.ps1` hace todo: abre, espera el CI, fusiona, borra la rama y pone el tag de hito.

## Tags
- **Versión** `vX.Y.Z`: SOLO los crea semantic-release en CI. Nunca a mano.
- **Hito** `hito-etapa-NN`: lo pone `Publicar-PR.ps1` al fusionar. No es versión; semantic-release los ignora.

## Versionado de la app
- Primera publicada: 1.0.0. Sale sola de semantic-release (sin etiqueta base ni BREAKING CHANGE).
- `versionName = X.Y.Z`; `versionCode = X*1.000.000 + Y*1.000 + Z` (1.0.0 → 1000000; 1.2.3 → 1002003). Límites: Y y Z < 1000.
- Gradle recibe `-PappVersion=X.Y.Z` en CI; sin esa propiedad compila `0.0.0` con versionCode 1.

## Identificadores (regla de convivencia)
- `applicationId`: `co.miplata.nativa` (debug `.debug`). `namespace`: `co.miplata.nativa`.
- En manifiestos y recursos: SOLO `${applicationId}` (autoridad de FileProvider `${applicationId}.updates`, acciones `${applicationId}.action.*`, permisos `${applicationId}.permission.*`).
- En código: `BuildConfig.APPLICATION_ID` o `context.packageName`. Prohibido el literal `co.miplata.app`.

## Kotlin
- Estilo oficial de Kotlin; 4 espacios; `.editorconfig` manda.
- Un tipo público por archivo cuando es grande; nombres: `XxxViewModel`, `XxxUiState`, `XxxEvent`, `XxxRoute`, `XxxScreen`, `XxxRepository`, `XxxUseCase`.
- Dinero siempre `Long` en pesos (nunca `Double`). Fechas con `java.time` (`LocalDate`, `YearMonth`, `LocalTime`).
- Corrutinas: dispatchers inyectados (no `Dispatchers.IO` a mano en las clases de negocio).
- Sin `!!` salvo en pruebas. Sin `GlobalScope`.

## Pruebas
- Nombre: `` `descripción en español` `` (backticks) o `metodo_estado_resultado`. Mismas descripciones que el `it('...')` del híbrido cuando se porta.
- Cada `*.test.ts` portado deja una tabla en el PR: «prueba del híbrido → prueba Kotlin» y las que NO se portan con su motivo.
- Pruebas de CSS (`hygiene.test.ts`, `tokens.test.ts`) no se portan: se reemplazan por pruebas del tema Compose.
- Reglas puras: JVM (`:core:domain`). Room: Robolectric o instrumentadas. UI: pruebas de Compose.

## Entrega de cada etapa
Un zip `etapa-NN-nombre.zip`, rutas relativas a la raíz del repo, sin carpeta envoltorio, archivos completos, `borrar.txt` para borrados
(una ruta por línea, relativa a la raíz; `#` comenta). Se aplica con `scripts/Aplicar-Etapa.ps1`.
