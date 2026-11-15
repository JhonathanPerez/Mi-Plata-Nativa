plugins {
    alias(libs.plugins.miplata.android.library)
}

android {
    namespace = "co.miplata.nativa.core.ui"
}

dependencies {
    implementation(project(":core:domain"))

    testImplementation(libs.junit)
}
