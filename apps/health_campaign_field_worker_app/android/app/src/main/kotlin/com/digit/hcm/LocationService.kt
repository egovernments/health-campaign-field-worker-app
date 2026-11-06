package com.digit.hcm

import android.annotation.TargetApi
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.location.Location
import android.os.Build
import java.io.File
import java.io.FileOutputStream
import android.os.IBinder
import android.os.Environment
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*
import java.io.IOException
import javax.crypto.Cipher
import javax.crypto.CipherOutputStream
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec
import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import java.security.KeyStore

class LocationService : Service() {

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private var locationUpdateInterval: Long = 60000L
    private var stopAfterTimestamp: Long = 0L

    override fun onCreate() {
        super.onCreate()
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        createNotificationChannel()
        startForegroundService()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        locationUpdateInterval = intent?.getLongExtra("interval", 60000L) ?: 60000L
        stopAfterTimestamp = intent?.getLongExtra("stopAfterTimestamp", System.currentTimeMillis() + 60000L) ?: System.currentTimeMillis() + 60000L
        startLocationUpdates()
        return START_STICKY
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    private fun startForegroundService() {
        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE)

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Location Service")
            .setContentText("Tracking location in background")
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(pendingIntent)
            // SECURITY: Prevent notification content from appearing on lock screen
            .setVisibility(NotificationCompat.VISIBILITY_SECRET)
            .build()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForeground(1, notification)
        } else {
            startForeground(1, notification)
        }
    }

    private fun startLocationUpdates() {
        val locationRequest = LocationRequest.Builder(
            Priority.PRIORITY_HIGH_ACCURACY,
            locationUpdateInterval
        ).setMinUpdateIntervalMillis(locationUpdateInterval).build()

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult ?: return
                for (location in locationResult.locations) {
                    updateNotification(location)
                    sendLocationToMainActivity(location)

                    // Check if the stop time has been reached
                    if (System.currentTimeMillis() >= stopAfterTimestamp) {
                        stopSelf()
                    }
                }
            }
        }

        fusedLocationClient.requestLocationUpdates(
            locationRequest,
            locationCallback,
            Looper.getMainLooper()
        )
    }

    private fun sendLocationToMainActivity(location: Location) {
        val intent = Intent("LocationUpdate")
        // SECURITY: Restrict broadcast to this app's package only
        intent.setPackage(packageName)
        intent.putExtra("latitude", location.latitude)
        intent.putExtra("longitude", location.longitude)
        intent.putExtra("accuracy", location.accuracy)

        // SECURITY: Send with a signature-level permission so only this app can receive it
        sendBroadcast(intent, "${packageName}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION")
    }

    override fun onDestroy() {
        super.onDestroy()
        fusedLocationClient.removeLocationUpdates(locationCallback)
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel = NotificationChannel(
                CHANNEL_ID,
                "Location Service Channel",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            // SECURITY: Prevent notifications in this channel from showing on lock screen
            serviceChannel.lockscreenVisibility = NotificationCompat.VISIBILITY_SECRET
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }

    fun stopService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
        stopSelf()
    }

    private fun updateNotification(location: Location) {
        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE)
        val timestamp = System.currentTimeMillis()

        // SECURITY: Do NOT display raw coordinates in the notification — they are
        // visible on the lock screen and in the notification shade to anyone with
        // physical access to the device.
        val notificationContent = "Location updated"

        // Write encrypted location data to internal storage
        writeToEncryptedFile("Latitude: ${location.latitude}, Longitude: ${location.longitude}, Accuracy: ${location.accuracy}, isSync: false, timestamp: $timestamp")

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Location Service")
            .setContentText(notificationContent)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(pendingIntent)
            .setVisibility(NotificationCompat.VISIBILITY_SECRET)
            .build()

        val notificationManager = getSystemService(NotificationManager::class.java)
        notificationManager.notify(1, notification)
    }

    /**
     * Write location data to INTERNAL (app-private) storage using AES-256-GCM
     * encryption backed by Android Keystore. The plaintext never touches disk.
     *
     * Previous implementation wrote plaintext GPS coordinates to the Downloads
     * folder (external storage), which was accessible via ADB or file managers.
     */
    private fun writeToEncryptedFile(data: String) {
        try {
            val fileName = "location_data.enc"

            // SECURITY: Use internal storage (app-private); NOT external/Downloads
            val file = File(filesDir, fileName)

            // Get or create a Keystore-backed AES key
            val secretKey = getOrCreateSecretKey()

            val cipher = Cipher.getInstance("AES/GCM/NoPadding")
            cipher.init(Cipher.ENCRYPT_MODE, secretKey)

            // Prepend the IV (12 bytes for GCM) so we can decrypt later
            val iv = cipher.iv
            val fos = FileOutputStream(file, true) // Append mode
            fos.write(iv.size)          // 1 byte: IV length
            fos.write(iv)               // IV
            val encryptedData = cipher.doFinal((data + "\n").toByteArray(Charsets.UTF_8))
            // Write encrypted data length (4 bytes, big-endian) then data
            fos.write((encryptedData.size shr 24) and 0xFF)
            fos.write((encryptedData.size shr 16) and 0xFF)
            fos.write((encryptedData.size shr  8) and 0xFF)
            fos.write((encryptedData.size       ) and 0xFF)
            fos.write(encryptedData)
            fos.close()
        } catch (e: Exception) {
            // SECURITY: Do not log the exception details — they may contain file paths
        }
    }

    /** Retrieve or generate an AES-256-GCM key stored in Android Keystore. */
    private fun getOrCreateSecretKey(): SecretKey {
        val keyStore = KeyStore.getInstance("AndroidKeyStore")
        keyStore.load(null)

        val alias = "location_data_key"
        val entry = keyStore.getEntry(alias, null)
        if (entry is KeyStore.SecretKeyEntry) {
            return entry.secretKey
        }

        val keyGen = KeyGenerator.getInstance(
            KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore"
        )
        keyGen.init(
            KeyGenParameterSpec.Builder(
                alias,
                KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT
            )
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build()
        )
        return keyGen.generateKey()
    }

    companion object {
        private const val CHANNEL_ID = "LocationServiceChannel"
    }
}
