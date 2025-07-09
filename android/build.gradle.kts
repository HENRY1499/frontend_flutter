import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import java.io.File

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    project.evaluationDependsOn(":app")

    // ✅ Java 17
    tasks.withType<JavaCompile>().configureEach {
        sourceCompatibility = "17"
        targetCompatibility = "17"
    }

    // ✅ Kotlin con JVM 17
    tasks.withType<KotlinCompile>().configureEach {
        kotlinOptions.jvmTarget = "17"
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
