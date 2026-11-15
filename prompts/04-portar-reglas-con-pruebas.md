Porta reglas del híbrido a Kotlin con pruebas primero. Responde en español; código en inglés. Lee AGENTS.md y docs/STATE.md.

Te adjunto los archivos `.ts` y sus `.test.ts`. Procede así:
1. Tabla «prueba del híbrido → prueba Kotlin» (mismas descripciones en español) y las pruebas que NO se portan con su motivo.
2. Escribe las pruebas Kotlin (JUnit 4, módulo JVM `:core:domain` cuando la regla sea pura) y confirma que cubren los mismos casos y bordes (montos enteros, fechas locales, zonas horarias, mayúsculas/acentos).
3. Después implementa. Reglas puras: sin Android, sin `Double` para dinero, con `java.time`.
4. Lista los defectos del híbrido que encuentres (DEFECTOS-HIBRIDO.md) y cómo los corriges; los visibles pasan por mi pregunta de cambios.
5. Entrega un zip con archivos completos y los commits exactos (primero `test(...)`, luego `feat(...)`).
