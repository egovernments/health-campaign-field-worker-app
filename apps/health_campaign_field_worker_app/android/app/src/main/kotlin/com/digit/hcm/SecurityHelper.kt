package com.digit.hcm

import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class SecurityHelper(private val context: Context) {

    companion object {
        private const val CHANNEL = "com.digit.hcm/security"
    }

    fun setupMethodChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkRootAccess" -> {
                    result.success(checkRootAccess())
                }
                "checkEmulator" -> {
                    result.success(checkEmulator())
                }
                "checkHookingFrameworks" -> {
                    result.success(checkHookingFrameworks())
                }
                "checkAppSignature" -> {
                    val expectedSignature = call.argument<String>("expectedSignature")
                    result.success(checkAppSignature(expectedSignature))
                }
                "checkDebugger" -> {
                    result.success(checkDebugger())
                }
                else -> result.notImplemented()
            }
        }
    }

    /**
     * Multi-layered root detection
     */
    private fun checkRootAccess(): Boolean {
        return checkSuBinary() || checkSuperuserApk() || checkRWPaths() || 
               checkDangerousProps() || checkRootCloakingApps() || checkBusyBox()
    }

    /**
     * Check for su binary in common locations
     */
    private fun checkSuBinary(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su",
            "/su/bin/su"
        )
        
        return paths.any { File(it).exists() }
    }

    /**
     * Check for Superuser.apk
     */
    private fun checkSuperuserApk(): Boolean {
        val packages = arrayOf(
            "com.noshufou.android.su",
            "com.noshufou.android.su.elite",
            "eu.chainfire.supersu",
            "com.koushikdutta.superuser",
            "com.thirdparty.superuser",
            "com.yellowes.su",
            "com.topjohnwu.magisk",
            "com.kingroot.kinguser",
            "com.kingo.root",
            "com.smedialink.oneclickroot",
            "com.zhiqupk.root.global",
            "com.alephzain.framaroot"
        )

        return packages.any { isPackageInstalled(it) }
    }

    /**
     * Check if sensitive paths are writable (indicates root)
     */
    private fun checkRWPaths(): Boolean {
        val paths = arrayOf(
            "/system",
            "/system/bin",
            "/system/sbin",
            "/system/xbin",
            "/vendor/bin",
            "/sbin",
            "/etc"
        )

        return paths.any { 
            try {
                val file = File(it)
                file.canWrite()
            } catch (e: Exception) {
                false
            }
        }
    }

    /**
     * Check for dangerous system properties
     */
    private fun checkDangerousProps(): Boolean {
        val props = mapOf(
            "ro.debuggable" to "1",
            "ro.secure" to "0"
        )

        return props.any { (key, value) ->
            try {
                val process = Runtime.getRuntime().exec("getprop $key")
                val prop = process.inputStream.bufferedReader().readText().trim()
                prop == value
            } catch (e: Exception) {
                false
            }
        }
    }

    /**
     * Check for root cloaking apps
     */
    private fun checkRootCloakingApps(): Boolean {
        val packages = arrayOf(
            "com.devadvance.rootcloak",
            "com.devadvance.rootcloakplus",
            "de.robv.android.xposed.installer",
            "com.saurik.substrate",
            "com.zachspong.temprootremovejb",
            "com.amphoras.hidemyroot",
            "com.amphoras.hidemyrootadfree",
            "com.formyhm.hiderootPremium",
            "com.formyhm.hideroot"
        )

        return packages.any { isPackageInstalled(it) }
    }

    /**
     * Check for BusyBox (common on rooted devices)
     */
    private fun checkBusyBox(): Boolean {
        return try {
            val process = Runtime.getRuntime().exec(arrayOf("which", "busybox"))
            val output = process.inputStream.bufferedReader().readText()
            output.isNotEmpty()
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Check if running on emulator
     */
    private fun checkEmulator(): Boolean {
        return (Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || "google_sdk" == Build.PRODUCT
                || Build.PRODUCT.contains("sdk")
                || Build.PRODUCT.contains("emulator"))
    }

    /**
     * Check for hooking frameworks (Frida, Xposed, etc.)
     */
    private fun checkHookingFrameworks(): Boolean {
        return checkFrida() || checkXposed() || checkSubstrate()
    }

    /**
     * Check for Frida
     */
    private fun checkFrida(): Boolean {
        val fridaFiles = arrayOf(
            "/data/local/tmp/frida-server",
            "/data/local/tmp/re.frida.server",
            "/system/lib/libfrida-gadget.so",
            "/system/lib64/libfrida-gadget.so"
        )

        if (fridaFiles.any { File(it).exists() }) {
            return true
        }

        // Check for Frida ports
        return try {
            val process = Runtime.getRuntime().exec("netstat -an")
            val output = process.inputStream.bufferedReader().readText()
            output.contains("27042") || output.contains("27043")
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Check for Xposed framework
     */
    private fun checkXposed(): Boolean {
        return try {
            Class.forName("de.robv.android.xposed.XposedBridge")
            true
        } catch (e: ClassNotFoundException) {
            false
        } || File("/system/framework/XposedBridge.jar").exists()
            || isPackageInstalled("de.robv.android.xposed.installer")
    }

    /**
     * Check for Substrate (Cydia Substrate)
     */
    private fun checkSubstrate(): Boolean {
        return try {
            Class.forName("com.saurik.substrate.MS$2")
            true
        } catch (e: ClassNotFoundException) {
            false
        } || isPackageInstalled("com.saurik.substrate")
    }

    /**
     * Check if debugger is attached
     */
    private fun checkDebugger(): Boolean {
        return (android.os.Debug.isDebuggerConnected() 
                || android.os.Debug.waitingForDebugger())
    }

    /**
     * Verify app signature (detect repackaging)
     */
    private fun checkAppSignature(expectedSignature: String?): Boolean {
        if (expectedSignature == null) return true

        return try {
            val packageInfo = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                context.packageManager.getPackageInfo(
                    context.packageName,
                    PackageManager.GET_SIGNING_CERTIFICATES
                )
            } else {
                @Suppress("DEPRECATION")
                context.packageManager.getPackageInfo(
                    context.packageName,
                    PackageManager.GET_SIGNATURES
                )
            }

            val signatures = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                packageInfo.signingInfo?.apkContentsSigners
            } else {
                @Suppress("DEPRECATION")
                packageInfo.signatures
            }

            val currentSignature = signatures?.firstOrNull()?.toCharsString() ?: ""
            currentSignature == expectedSignature
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Check if package is installed
     */
    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            context.packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }
}
