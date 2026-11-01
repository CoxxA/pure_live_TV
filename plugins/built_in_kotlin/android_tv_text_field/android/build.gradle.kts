plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

group = "com.example.native_textfield_tv"
version = "1.0.0"

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

android {
    namespace = "com.example.native_textfield_tv"
    compileSdk = 35

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }

    defaultConfig {
        minSdk = 21
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}
