# Comprehensive ProGuard/R8 Rules for Flutter Android App
# This file contains obfuscation rules to protect the app from reverse engineering

# ============================================================================
# Flutter Framework Rules
# ============================================================================

# Keep Flutter engine classes
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Keep Flutter embedding classes
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }

# Keep Flutter plugins
-keep class io.flutter.plugins.** { *; }

# ============================================================================
# Kotlin Rules
# ============================================================================

-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    static void checkParameterIsNotNull(java.lang.Object, java.lang.String);
}

# ============================================================================
# AndroidX Rules
# ============================================================================

-keep class androidx.** { *; }
-keep interface androidx.** { *; }
-dontwarn androidx.**

# ============================================================================
# Google Play Services
# ============================================================================

-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# ============================================================================
# Security Helper (Native Android Code)
# ============================================================================

# Keep custom security classes - MUST NOT BE OBFUSCATED
-keep,includedescriptorclasses class com.digit.hcm.** { *; }
-keepclassmembers class com.digit.hcm.** { *; }

# Explicitly keep Activities
-keep public class com.digit.hcm.LauncherActivity { *; }
-keep public class com.digit.hcm.MainActivity { *; }
-keep public class com.digit.hcm.SecurityHelper { *; }
-keep public class com.digit.hcm.LocationService { *; }

# Keep all public methods in security classes (needed for method channels)
-keepclassmembers class com.digit.hcm.SecurityHelper {
    public *;
}
-keepclassmembers class com.digit.hcm.MainActivity {
    public *;
}

# ============================================================================
# Method Channel Communication
# ============================================================================

# Keep classes used for Flutter method channel communication
-keepclassmembers class * {
    @io.flutter.plugin.common.MethodCall *;
    @io.flutter.plugin.common.MethodChannel *;
}

# ============================================================================
# Reflection Rules
# ============================================================================

# Keep classes that use reflection
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses

# ============================================================================
# Serialization Rules
# ============================================================================

# Keep serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ============================================================================
# Native Methods
# ============================================================================

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# ============================================================================
# Enum Rules
# ============================================================================

# Keep enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ============================================================================
# Parcelable Rules
# ============================================================================

# Keep Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# ============================================================================
# Third-Party Libraries
# ============================================================================

# Gson (if used)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# OkHttp3 (if used)
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }

# Retrofit (if used)
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

# SQLite/Drift Database
-keep class com.drift.** { *; }
-keep class org.sqlite.** { *; }
-dontwarn org.sqlite.**

# Jailbreak/Root Detection Library
-keep class com.jailbreak.** { *; }
-keep class jailbreak.root.detection.** { *; }

# Location Services
-keep class com.google.android.gms.location.** { *; }

# Background Service
-keep class id.flutter.flutter_background_service.** { *; }

# Device Info
-keep class io.flutter.plugins.deviceinfo.** { *; }

# Package Info
-keep class io.flutter.plugins.packageinfo.** { *; }

# QR Code / Scanner
-keep class com.google.zxing.** { *; }
-dontwarn com.google.zxing.**

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }

# ============================================================================
# Remove Logging (Production Build Optimization)
# ============================================================================

# Remove all Log.d, Log.v, Log.i calls (keep Log.w and Log.e for critical issues)
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Remove System.out.println
-assumenosideeffects class java.io.PrintStream {
    public void println(%);
    public void println(**);
}

# ============================================================================
# Optimization Rules
# ============================================================================

# Optimization passes
-optimizationpasses 5

# Allow optimization
-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*

# Repackage classes into single package
-repackageclasses ''

# Allow access modification during optimization
-allowaccessmodification

# ============================================================================
# Crash Reporting
# ============================================================================

# Keep line numbers for crash reports
-keepattributes SourceFile,LineNumberTable

# Rename source file to "SourceFile" to reduce APK size
-renamesourcefileattribute SourceFile

# ============================================================================
# Security Enhancements
# ============================================================================

# Additional obfuscation for security-sensitive classes
-keep,allowobfuscation class com.digit.hcm.SecurityHelper
-keep,allowobfuscation class com.digit.hcm.MainActivity

# Obfuscate method names but keep their functionality
-keepclassmembers,allowobfuscation class * {
    @android.webkit.JavascriptInterface <methods>;
}

# ============================================================================
# Testing Rules (Keep for debug builds only)
# ============================================================================

# Keep test classes (remove in production if needed)
-dontwarn org.junit.**
-dontwarn junit.**

# ============================================================================
# Warnings to Ignore
# ============================================================================

# Ignore warnings about missing classes (external dependencies)
-dontwarn javax.annotation.**
-dontwarn javax.inject.**
-dontwarn sun.misc.Unsafe

# ============================================================================
# Custom Application Rules
# ============================================================================

# Add any app-specific rules below this line
# Example: Keep your custom data models
# -keep class com.digit.hcm.models.** { *; }
# ============================================================================
# Critical Flutter Plugin Rules (Added to fix APK launch issues)
# ============================================================================

# Keep all Flutter plugin registrants
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }
-keep class io.flutter.embedding.engine.plugins.FlutterPlugin { *; }

# Keep LauncherActivity (critical for app launch)
-keep class com.digit.hcm.LauncherActivity { *; }
-keepclassmembers class com.digit.hcm.LauncherActivity {
    *;
}

# Keep all Activity classes
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Keep method channel handlers
-keepclassmembers class * {
    @io.flutter.embedding.engine.dart.DartMessenger.DartCallback *;
}

# Prevent optimization issues with Kotlin coroutines (if used in plugins)
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-dontwarn kotlinx.coroutines.flow.**

# ============================================================================
# Dart/Flutter VM Rules
# ============================================================================

# Keep Dart VM classes
-keep class io.flutter.view.** { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.embedding.android.** { *; }
-keep class io.flutter.embedding.engine.** { *; }