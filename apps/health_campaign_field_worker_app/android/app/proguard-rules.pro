# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# App classes
-keep class com.digit.hcm.** { *; }

# Flutter Background Service
-keep class id.flutter.flutter_background_service.** { *; }

# Google Play Services / Location
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Flutter Secure Storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# Flutter Local Notifications
-keep class com.dexterous.** { *; }

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }

# Workmanager
-keep class be.tramckrijte.workmanager.** { *; }

# Jailbreak Root Detection
-keep class dev.nicholaslee.jailbreak_root_detection.** { *; }

# Screen Protector
-keep class dev.nicholaslee.screen_protector.** { *; }

# Isar Database
-keep class dev.isar.** { *; }

# AndroidX
-keep class androidx.** { *; }
-dontwarn androidx.**

# Kotlin
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**

# OkHttp / Okio (used by Dio)
-dontwarn okhttp3.**
-dontwarn okio.**

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep Parcelables
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# Keep annotations and signatures
-keepattributes *Annotation*,Signature,Exceptions
