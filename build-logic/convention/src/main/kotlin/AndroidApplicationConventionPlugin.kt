import com.android.build.api.dsl.ApplicationExtension
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.kotlin.dsl.configure

/** Convención del módulo :app: SDK, Java 17, Compose y lint. La identidad (applicationId, versión) queda en :app. */
class AndroidApplicationConventionPlugin : Plugin<Project> {
    override fun apply(target: Project) {
        with(target) {
            pluginManager.apply("com.android.application")
            pluginManager.apply("org.jetbrains.kotlin.plugin.compose")

            extensions.configure<ApplicationExtension> {
                compileSdk = ProjectDefaults.COMPILE_SDK
                defaultConfig.minSdk = ProjectDefaults.MIN_SDK
                defaultConfig.targetSdk = ProjectDefaults.TARGET_SDK
                compileOptions.sourceCompatibility = ProjectDefaults.JAVA_VERSION
                compileOptions.targetCompatibility = ProjectDefaults.JAVA_VERSION
                buildFeatures.compose = true
                lint.abortOnError = true
                lint.warningsAsErrors = false
            }
            configureKotlinJvmTarget()
        }
    }
}
