# FORMATO DE COPIAS QUE LA IMPORTACIÓN DEBE ENTENDER

Detectar por contenido, en este orden: sobre cifrado → volcado crudo → copia normal.

## 1. Sobre cifrado `mi-plata-backup-encrypted` (versión 1)
JSON: `{ format, version: 1, kdf: "PBKDF2-SHA256", iterations, salt, iv, data }` con `salt`, `iv` y `data` en Base64.
- Clave: PBKDF2-SHA256 de la contraseña (UTF-8), 16 bytes de sal, `iterations` (hoy 600.000; aceptar 1.000 a 5.000.000), 256 bits.
- Cifrado: AES-256-GCM, IV de 12 bytes; `data` = texto cifrado + etiqueta de 16 bytes (formato de WebCrypto y de `javax.crypto`).
- Contraseña mínima: 8 caracteres. Contraseña errónea o archivo alterado → «La contraseña no es correcta, o el archivo está dañado.»
- El contenido descifrado es una copia normal o un volcado crudo.

## 2. Volcado crudo `mi-plata-raw-dump` (versión 1)
Filas de cada tabla en snake_case, tal como están en SQLite (lo escribe la tarea en segundo plano). Una tabla ausente = lista vacía.
Se convierte a la copia normal y luego se valida igual.

## 3. Copia normal `mi-plata-backup` (versiones 1 a 3)
```
{ format: "mi-plata-backup", version: 1|2|3, app, exportedAt,
  data: { categories, paymentMethods, expenses, budgets, settings,
          cardStatementDates, savingsAccounts, savingsMovements } }
```
- v1: sin estado pagado, reglas de ciclo ni extractos. v2: `paidAt`, reglas de ciclo y fechas de extractos. v3: cuentas de ahorro y movimientos.
- `version` mayor que 3 → «La copia fue creada con una versión más nueva de la app».
- Campos ausentes de versiones viejas toman valores por defecto; `cardStatementDates`, `savingsAccounts`, `savingsMovements` y `settings` pueden faltar.

## Validaciones (las mismas del híbrido)
Ids únicos; nombres únicos sin distinguir mayúsculas (categorías, métodos, cuentas); presupuestos únicos por mes; todo gasto apunta a una categoría y un método existentes;
un método con `savingsAccountId` apunta a una cuenta existente y no hay dos para la misma cuenta; movimientos de ahorro apuntan a cuenta (y gasto) existentes y no hay dos retiros del mismo gasto;
extractos apuntan a un método existente y no se repiten (método+periodo). Cualquier falla → «La copia de seguridad está dañada (…)» sin importar nada.

## Resumen que muestra la pantalla (antes de confirmar)
Versión del formato y fecha de exportación; cantidad de gastos, categorías, métodos, presupuestos, cuentas de ahorro y movimientos, capturas si las hay;
total gastado, total por mes del rango y saldo total de ahorros. Debe poder compararse con las cifras del híbrido lado a lado.

## Verificación posterior
Releer de Room y comparar cantidades y totales con el resumen. Si no coinciden, la transacción se revierte.
