# STATE — Mi Plata Nativa (máximo 60 líneas)

> Lo actualiza la IA al cierre de cada sesión (prompt de cierre). Si pasa de 60 líneas, resume.

## Dónde estamos
- Etapa actual: **00 — preparar el repositorio** (pendiente)
- Última etapa cerrada: ninguna
- Último hito: ninguno
- Versión publicada: ninguna (release DESACTIVADO hasta la etapa 39)

## Siguiente paso exacto
<!-- SIGUIENTE:INICIO -->
Etapa 00 · rama `chore/repo-kit-inicial` · PR `chore(repo): agrega el kit de trabajo y deja el repositorio listo`
1. El dueño extrae el kit en la carpeta del repo nuevo y corre `scripts/Crear-Repo.ps1`.
2. Crea la rama, hace el commit `chore(repo): agrega el kit de trabajo del proyecto`, y corre `scripts/Publicar-PR.ps1 -Etapa 0`.
3. Siguiente: etapa 01 (`build/gradle-esqueleto-multimodulo`). Ficha en `docs/etapas/etapa-01.md`.
<!-- SIGUIENTE:FIN -->

## Cambios pedidos vigentes (CHG)
Ninguno. (Detalle completo en `docs/CAMBIOS.md`; aquí solo `CHG-xx: resumen en una línea`.)

## Decisiones vigentes que importan
- applicationId `co.miplata.nativa` (+`.debug`), nombre «Mi Plata Nativa», versionCode = major*1.000.000+minor*1.000+patch.
- Identificadores que pueden chocar con el híbrido: siempre `${applicationId}`; nunca `co.miplata.app`.
- Esquema Room v1 nuevo (estado final del híbrido); los datos entran solo por la importación guiada.
- Versiones de librerías: ver `docs/VERSIONES.md` (no inventar; verificar con `Verificar-Versiones.ps1`).

## Pendientes y avisos
- Mientras convivan híbrido y nativa, captura de notificaciones y recordatorios activos en UNA sola app.
- Defectos del híbrido por corregir: ver `docs/DEFECTOS-HIBRIDO.md` (D-01 a D-12).

## Historial de etapas cerradas
(vacío)
