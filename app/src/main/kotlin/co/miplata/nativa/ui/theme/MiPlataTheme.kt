package co.miplata.nativa.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

private val VerdeMiPlata = Color(0xFF0B7A63)

private val LightColors = lightColorScheme(primary = VerdeMiPlata)
private val DarkColors = darkColorScheme(primary = Color(0xFF4FD1B5))

/** Tema provisional; la etapa de UI base lo reemplaza por el sistema de diseño completo. */
@Composable
fun MiPlataTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit,
) {
    MaterialTheme(
        colorScheme = if (darkTheme) DarkColors else LightColors,
        content = content,
    )
}
