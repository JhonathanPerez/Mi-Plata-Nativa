# FLUJO DE TRABAJO

```
Armar-Adjunto → chat de IA (prompt de inicio) → pregunta de cambios → zip de la etapa
→ Aplicar-Etapa → git switch -c RAMA → commits (test, feat…) → Revisar-Todo → probar (si toca)
→ prompt de cierre → Aplicar-Etapa (zip de cierre) → commit docs(estado) → Publicar-PR → hito
```

## Reglas
- Una etapa = una rama = un PR = una sesión de IA. Fusión con *squash*; el título del PR es el commit.
- `main` siempre compila y pasa pruebas. El CI valida título del PR, commits, compila, lint, pruebas y la regla de convivencia.
- El release está desactivado hasta la etapa 39. Los tags `hito-etapa-NN` marcan avance y no son versiones.
- Lo único manual es crear la rama y hacer los commits; lo demás son scripts.

## Cambios pedidos (CHG)
En cada etapa con pregunta, si respondes «Cambiar», la IA los implementa como desviación, los anota en `docs/CAMBIOS.md` (`CHG-xx`) y el commit lleva `Cambio-pedido: CHG-xx`.
Si un cambio rompe la compatibilidad de la copia JSON, la IA te avisa antes.

## Si la etapa falla
Usa el prompt de **corrección de errores** con la salida del error. Si la etapa no cabe en la sesión, la IA la parte y lo anota en STATE.

## Retomar en otra IA
1. `./scripts/Armar-Adjunto.ps1 -Etapa NN` (incluye AGENTS, STATE, CAMBIOS y la ficha).
2. `./scripts/Copiar-Prompt.ps1 -Cual inicio` y pega en el chat nuevo; adjunta el archivo.
No hace falta explicar nada más.
