# CAMBIOS — desviaciones deliberadas respecto al híbrido

Cada cambio que el dueño pide en la «pregunta de cambios» de una etapa se registra aquí con un id `CHG-xx` (consecutivo, nunca se reutiliza).
El commit que lo implementa lleva el pie `Cambio-pedido: CHG-xx`. Las pruebas portadas se actualizan para reflejarlo.
Cualquier IA debe RESPETAR los CHG vigentes (también están resumidos en `docs/STATE.md`).

## Formato de cada entrada

```
### CHG-xx — título corto
- Etapa: NN
- Estado: vigente | revertido (por CHG-yy)
- Qué cambió: …
- Por qué: …
- Qué hacía el híbrido: …
- Afecta la copia JSON: no | sí (explicar y versión del formato)
- Pruebas: archivo(s) donde se refleja
- Commit: pie `Cambio-pedido: CHG-xx`
```

## Registro

Sin cambios pedidos todavía.

## Decisiones del encargo original (no son CHG)

Estas diferencias con el híbrido vienen del encargo y no necesitan CHG:
- La importación desde el híbrido no borra nada (el «Restaurar» del híbrido reemplaza todo).
- Un único lector de notificaciones (el híbrido tiene dos: TypeScript y Java).
- Copias automáticas escritas desde Room con el formato normal (el híbrido escribe un volcado crudo y lo convierte al restaurar).
- Identificadores derivados de `${applicationId}`; keystore y repo de actualizaciones propios.
