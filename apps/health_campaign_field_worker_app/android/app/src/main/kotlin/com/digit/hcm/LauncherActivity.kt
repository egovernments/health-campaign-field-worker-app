package com.digit.hcm

import android.app.Activity
import android.content.Intent
import android.os.Bundle

/**
 * Launcher Activity - Acts as a secure entry point to the application.
 * This activity is exported (required for LAUNCHER intent-filter on Android 12+)
 * but immediately redirects to the non-exported MainActivity for security.
 * 
 * Note: This is a simple Activity (not FlutterActivity) to avoid conflicts
 * with Flutter engine initialization in MainActivity.
 */
class LauncherActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Immediately start MainActivity and finish this launcher
        val intent = Intent(this, MainActivity::class.java).apply {
            // Forward all extras from the launch intent
            this@LauncherActivity.intent.extras?.let { putExtras(it) }
            // Forward action and data
            action = this@LauncherActivity.intent.action
            data = this@LauncherActivity.intent.data
            // Preserve the original flags
            addFlags(this@LauncherActivity.intent.flags)
        }
        
        startActivity(intent)
        finish()
    }
}
