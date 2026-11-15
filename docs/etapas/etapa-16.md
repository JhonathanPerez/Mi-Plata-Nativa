# Etapa 16 — Agrega la navegación, la barra inferior y la pantalla de arranque

| Dato | Valor |
|---|---|
| Rama | `feat/navegacion-arranque-y-barra-inferior` |
| Título del PR | `feat(navegacion): agrega la navegación, la barra inferior y la pantalla de arranque` |
| Tamaño | **S** (adjuntos ≈ 33 KB ≈ 9.8k tokens) |
| Zip esperado | `etapa-16-arranque-y-barra-inferior.zip` |
| Tag de hito (tras fusionar) | `hito-etapa-16` |
| ¿Pregunta de cambios? | Sí (punto 8) |

## Commits (en este orden)

1. `test(navegacion): porta las pruebas de navegación y botón atrás`
2. `feat(navegacion): crea el grafo de navegación, barra inferior y pantalla de arranque`
3. `docs(estado): registra el cierre de la etapa 16` (lo entrega el prompt de cierre)

Si esta etapa tiene cambios pedidos, cada commit afectado lleva el pie `Cambio-pedido: CHG-xx` (línea en blanco antes del pie).

## Archivos del híbrido a adjuntar

Se arman solos con `./scripts/Armar-Adjunto.ps1 -Etapa 16`:

- `src/app/App.tsx`
- `src/app/AppShell.tsx`
- `src/app/BottomNav.tsx`
- `src/app/DatabaseGate.tsx`
- `src/app/BackButtonHandler.tsx`
- `src/lib/backNavigation.ts`
- `src/lib/backNavigation.test.ts`
- `src/lib/navigationState.ts`
- `src/lib/navigationState.test.ts`
- `src/lib/backStack.ts`
- `src/components/ui/SplashLoading.tsx`
- `src/components/ui/RingLogo.tsx`
- `src/components/ui/PageTransition.tsx`
- `src/styles/components/splash.css`
- `src/config/constants.ts`

## Pregunta de cambios (hipótesis; la IA la verifica contra los adjuntos antes de preguntar)

Lo que cubre la etapa y qué hace hoy el híbrido:

- Barra inferior con las secciones principales.
- Pantalla de arranque mínima de 1,2 s con el logo de anillo de 5 tramos.
- El botón atrás vuelve donde estabas y conserva la posición de la lista.

Opciones: **Mantener igual** / **Cambiar (dime qué)**. Una sola pregunta, máximo 5 líneas, junto con la lista de archivos extra que falten.

## Entregable

Navigation Compose con rutas tipadas, shell y splash.

Un solo zip `etapa-16-arranque-y-barra-inferior.zip` con rutas relativas a la raíz del repo, sin carpeta envoltorio, y `borrar.txt` si hay que borrar algo.

## Definición de hecho

- CI verde (título del PR, compila, lint y pruebas).
- Pruebas portadas primero y en verde.
- `docs/STATE.md` y `docs/CAMBIOS.md` actualizados al cierre.
- Sin identificadores `co.miplata.app` escritos a mano.
