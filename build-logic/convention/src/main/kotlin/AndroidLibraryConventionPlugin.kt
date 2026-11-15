import com.android.build.api.dsl.LibraryExtension
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.kotlin.dsl.configure

/** Convención de los módulos de librería Android: SDK y Java 17. El `namespace` lo define cada módulo. */
class AndroidLibraryConventionPlugin : Plugin<Project> {
    override fun apply(target: Project) {
        with(target) {
            pluginManager.apply("com.android.library")

            extensions.configure<LibraryExtension> {
                compileSdk = ProjectDefaults.COMPILE_SDK
                defaultConfig.minSdk = ProjectDefaults.MIN_SDK
                compileOptions.sourceCompatibility = ProjectDefaults.JAVA_VERSION
                compileOptions.targetCompatibility = ProjectDefaults.JAVA_VERSION
            }
            configureKotlinJvmTarget()
        }
    }
}
