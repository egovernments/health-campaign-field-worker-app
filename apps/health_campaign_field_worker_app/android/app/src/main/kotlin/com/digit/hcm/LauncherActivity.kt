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

        // Immediately start MainActivity and finish this launcher.
        //
        // Flag rationale:
        //  - FLAG_ACTIVITY_REORDER_TO_FRONT: when MainActivity already exists
        //    deeper in the task stack (e.g. app is in foreground and the user
        //    tapped a notification while the FCM PendingIntent targeted
        //    LauncherActivity), bring the existing MainActivity to the top
        //    rather than spawning a fresh instance. Without this, singleTop
        //    can't kick in because MainActivity is no longer at the top
        //    once LauncherActivity sits above it, so Android creates a new
        //    MainActivity — the "app reopens on notification tap" symptom.
        //  - FLAG_ACTIVITY_CLEAR_TOP: any activities above the brought-forward
        //    MainActivity are finished, ensuring the navigation stack lands
        //    cleanly on MainActivity to receive onNewIntent with the
        //    notification extras.
        //
        // With these flags and MainActivity declared `singleTop` in the
        // manifest, an already-running MainActivity receives onNewIntent
        // and Flutter's notification handlers fire on the existing engine
        // instead of triggering a cold reopen.
        val intent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT or
                Intent.FLAG_ACTIVITY_CLEAR_TOP
            // Forward all extras from the launch intent
            this@LauncherActivity.intent.extras?.let { putExtras(it) }
            // Forward action and data if not MAIN/LAUNCHER
            if (this@LauncherActivity.intent.action != Intent.ACTION_MAIN) {
                action = this@LauncherActivity.intent.action
                data = this@LauncherActivity.intent.data
            }
        }

        startActivity(intent)
        finish()
    }
}
