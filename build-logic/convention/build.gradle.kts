plugins {
    `kotlin-dsl`
}

group = "co.miplata.nativa.buildlogic"

dependencies {
    // compileOnly: las clases reales las aporta el classpath del proyecto (plugins del build raíz).
    compileOnly(libs.android.gradlePlugin)
    compileOnly(libs.kotlin.gradlePlugin)
}

gradlePlugin {
    plugins {
        register("androidApplication") {
            id = "miplata.android.application"
            implementationClass = "AndroidApplicationConventionPlugin"
        }
        register("androidLibrary") {
            id = "miplata.android.library"
            implementationClass = "AndroidLibraryConventionPlugin"
        }
        register("jvmLibrary") {
            id = "miplata.jvm.library"
            implementationClass = "JvmLibraryConventionPlugin"
        }
    }
}
