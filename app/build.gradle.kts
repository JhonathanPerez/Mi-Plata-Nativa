// SDK, Java 17, Compose y lint vienen de la convención `miplata.android.application` (build-logic).
plugins {
    alias(libs.plugins.miplata.android.application)
    alias(libs.plugins.ksp)
    alias(libs.plugins.hilt)
}

// versionCode = major*1.000.000 + minor*1.000 + patch  (1.0.0 -> 1000000)
val appVersion: String = providers.gradleProperty("appVersion").orElse("1.0.0").get()
val versionParts = Regex("""^(\d+)\.(\d+)\.(\d+)$""").matchEntire(appVersion)
    ?.destructured
    ?.toList()
    ?.map { it.toInt() }
    ?: throw GradleException("appVersion debe ser X.Y.Z, recibido: «$appVersion»")
require(versionParts[1] < 1000 && versionParts[2] < 1000) {
    "minor y patch deben ser menores que 1000 para que la fórmula de versionCode no choque"
}
val computedVersionCode = versionParts[0] * 1_000_000 + versionParts[1] * 1_000 + versionParts[2]

android {
    namespace = "co.miplata.nativa"

    defaultConfig {
        applicationId = "co.miplata.nativa"
        versionCode = computedVersionCode
        versionName = appVersion
    }

    buildTypes {
        debug {
            // Instalable junto al release y junto al híbrido: otro applicationId y otro nombre.
            applicationIdSuffix = ".debug"
        }
        release {
            isMinifyEnabled = false // se activa en la etapa de empaquetado/release
        }
    }

    buildFeatures {
        buildConfig = true
    }
}

dependencies {
    implementation(project(":core:domain"))
    implementation(project(":core:data"))
    implementation(project(":core:ui"))

    implementation(platform(libs.compose.bom))
    implementation(libs.compose.ui)
    implementation(libs.compose.ui.tooling.preview)
    implementation(libs.compose.material3)
    debugImplementation(libs.compose.ui.tooling)

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.activity.compose)

    implementation(libs.hilt.android)
    ksp(libs.hilt.compiler)

    testImplementation(libs.junit)
}
