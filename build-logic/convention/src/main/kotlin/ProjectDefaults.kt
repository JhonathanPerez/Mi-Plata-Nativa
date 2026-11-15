import org.gradle.api.JavaVersion
import org.gradle.api.Project
import org.gradle.kotlin.dsl.withType
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

/** Valores comunes de todos los módulos (ADR-020, ADR-021 y ADR-026). */
internal object ProjectDefaults {
    const val COMPILE_SDK = 37
    const val TARGET_SDK = 36
    const val MIN_SDK = 26
    val JAVA_VERSION: JavaVersion = JavaVersion.VERSION_17
    val KOTLIN_JVM_TARGET: JvmTarget = JvmTarget.JVM_17
}

/** Fija el destino JVM de Kotlin en todas las tareas de compilación del módulo. */
internal fun Project.configureKotlinJvmTarget() {
    tasks.withType<KotlinCompile>().configureEach {
        compilerOptions.jvmTarget.set(ProjectDefaults.KOTLIN_JVM_TARGET)
    }
}
