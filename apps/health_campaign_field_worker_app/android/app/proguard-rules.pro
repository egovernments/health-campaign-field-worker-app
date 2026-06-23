# Comprehensive ProGuard/R8 Rules for Flutter Android App
# This file contains obfuscation rules to protect the app from reverse engineering

# ============================================================================
# Flutter Framework Rules
# ============================================================================

# Keep Flutter engine/embedding classes (required for JNI and plugin registration)
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugins.** { *; }

# ============================================================================
# Kotlin Rules (R8 has built-in support; only suppress warnings & keep metadata)
# ============================================================================

# Do NOT use: -keep class kotlin.** { *; }  ← this defeats obfuscation of Kotlin code
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
# AndroidX Rules (R8 includes built-in AndroidX rules; only suppress warnings)
# ============================================================================

# Do NOT use: -keep class androidx.** { *; }  ← this defeats obfuscation of AndroidX
-dontwarn androidx.**

# ============================================================================
# Google Play Services / Firebase
# ============================================================================

# Suppress warnings only; do NOT blanket-keep entire GMS/Firebase namespaces
-dontwarn com.google.android.gms.**
-dontwarn com.google.firebase.**

# Firebase (keep class names; internal members obfuscated)
-keep class com.google.firebase.** { *; }

# ============================================================================
# App Entry Points
# Only classes referenced BY NAME from AndroidManifest.xml need their name kept.
# Internal implementation (methods, fields) is obfuscated by R8.
# ============================================================================

# Activities - name kept (manifest resolves by FQCN); internals obfuscated by R8
-keep public class com.digit.hcm.LauncherActivity
-keepclassmembers public class com.digit.hcm.LauncherActivity { *; }
-keep public class com.digit.hcm.MainActivity
-keepclassmembers class com.digit.hcm.MainActivity {
    public *;
}

# LocationService - name kept; internals obfuscated
-keep public class com.digit.hcm.LocationService

# SecurityHelper - OBFUSCATE class and method names for maximum protection.
# Flutter MethodChannel uses string-based dispatch (call.method), so Java method
# names do not need to be preserved.
-keep,allowobfuscation class com.digit.hcm.SecurityHelper
-keepclassmembers,allowobfuscation class com.digit.hcm.SecurityHelper {
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

# SecurityHelper and MainActivity are handled in the "App Entry Points" section
# above with the correct allowobfuscation settings. Do NOT add blanket -keep
# rules here — that would override allowobfuscation and expose class names.

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

# LauncherActivity entry point is already handled in the "App Entry Points"
# section above with a targeted keep. Do NOT use blanket { *; } here as it
# would expose all internal methods/fields in the APK.

# Android component lifecycle methods are preserved automatically by R8
# via the built-in rules in proguard-android-optimize.txt. Blanket keeps
# like "-keep public class * extends android.app.Activity" are NOT needed
# and would prevent R8 from obfuscating third-party Activity subclasses.

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