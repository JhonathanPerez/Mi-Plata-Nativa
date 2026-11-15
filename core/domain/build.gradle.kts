// Reglas de negocio puras: módulo JVM, sin Android.
plugins {
    alias(libs.plugins.miplata.jvm.library)
}

dependencies {
    implementation(libs.kotlinx.coroutines.core)

    testImplementation(libs.junit)
    testImplementation(libs.kotlinx.coroutines.test)
    testImplementation(libs.turbine)
}
