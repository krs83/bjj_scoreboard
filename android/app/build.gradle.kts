plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.bjj_scoreboard" // замените на ваш namespace
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.example.bjj_scoreboard" // замените на ваш
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ★★★ КЛЮЧЕВОЙ БЛОК ★★★
repositories {
    maven("https://storage.googleapis.com/download.flutter.io")
    maven("https://mirrors.tuna.tsinghua.edu.cn/flutter/download.flutter.io")
    google()
    mavenCentral()
}