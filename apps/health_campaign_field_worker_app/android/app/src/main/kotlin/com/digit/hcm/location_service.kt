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
            .build()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForeground(1, notification)
        } else {
            startForeground(1, notification)
        }
    }

    private fun startLocationUpdates() {
        val locationRequest = LocationRequest.create().apply {
            interval = locationUpdateInterval
            fastestInterval = locationUpdateInterval
            priority = LocationRequest.PRIORITY_HIGH_ACCURACY
        }

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult ?: return
                for (location in locationResult.locations) {
                    updateNotification(location)
                    sendLocationToMainActivity(location)

                    // Check if the stop time has been reached
                    if (System.currentTimeMillis() >= stopAfterTimestamp) {
                        Log.d("LocationService", "Stop after timestamp reached")
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
        intent.putExtra("latitude", location.latitude)
        intent.putExtra("longitude", location.longitude)
        intent.putExtra("accuracy", location.accuracy)

        sendBroadcast(intent)

        Log.d("LocationSharing", "Location sent to MainActivity: Latitude ${location.latitude}, Longitude ${location.longitude}, Accuracy ${location.accuracy}")
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
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }

    fun stopService() {
        stopForeground(true)
        stopSelf()
        Log.d("LocationService", "Service stopped")
    }

    private fun updateNotification(location: Location) {
        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE)
        val timestamp = System.currentTimeMillis()
        val notificationContent = "Latitude: ${location.latitude}, Longitude: ${location.longitude}, Accuracy: ${location.accuracy}"  // Include accuracy

        // Write location and accuracy to file
        writeToFile("Latitude: ${location.latitude}, Longitude: ${location.longitude}, Accuracy: ${location.accuracy}, isSync: false, timestamp: $timestamp")

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Location Service")
            .setContentText(notificationContent)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(pendingIntent)
            .build()

        val notificationManager = getSystemService(NotificationManager::class.java)
        notificationManager.notify(1, notification)
    }

    private fun writeToFile(data: String) {
        try {
            val fileName = "location_data.txt"
            val file: File

            // Access Downloads folder
            val downloadsFolder = File(getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), "")
            file = File(downloadsFolder, fileName)

            val fileOutputStream = FileOutputStream(file, true) // Append mode
            fileOutputStream.write((data + "\n").toByteArray())
            fileOutputStream.close()

            // Print the file path
            println("File saved at: ${file.absolutePath}")
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    companion object {
        private const val CHANNEL_ID = "LocationServiceChannel"
    }
}
