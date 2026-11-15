import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.plugins.JavaPluginExtension
import org.gradle.kotlin.dsl.configure

/** Convención de los módulos JVM puros (sin Android), como :core:domain. */
class JvmLibraryConventionPlugin : Plugin<Project> {
    override fun apply(target: Project) {
        with(target) {
            pluginManager.apply("org.jetbrains.kotlin.jvm")

            extensions.configure<JavaPluginExtension> {
                sourceCompatibility = ProjectDefaults.JAVA_VERSION
                targetCompatibility = ProjectDefaults.JAVA_VERSION
            }
            configureKotlinJvmTarget()
        }
    }
}
