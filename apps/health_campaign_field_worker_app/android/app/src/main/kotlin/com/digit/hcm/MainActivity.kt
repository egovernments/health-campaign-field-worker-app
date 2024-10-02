package com.digit.hcm

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import java.io.File
import java.io.FileOutputStream
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter
import android.os.Environment
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.widget.Toast

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.digit.location_tracker"
    private val locationReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val latitude = intent?.getDoubleExtra("latitude", 0.0)
            val longitude = intent?.getDoubleExtra("longitude", 0.0)
            // Handle the location data here
            Toast.makeText(context, "Latitude: $latitude, Longitude: $longitude", Toast.LENGTH_LONG).show()
            // Optionally, you can send this data to Flutter via MethodChannel
            flutterEngine?.dartExecutor?.binaryMessenger?.let {
                MethodChannel(it, CHANNEL).invokeMethod("locationUpdate", mapOf("latitude" to latitude, "longitude" to longitude))
            }
        }
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startLocationUpdates" -> {
                    val interval = (call.argument<Number>("interval")?.toLong()) ?: 60000L
                    val stopAfterTimestamp = (call.argument<Number>("stopAfterTimestamp")?.toLong()) ?: (System.currentTimeMillis() + 60000L)
                    startService(interval, stopAfterTimestamp)
                    result.success(null)
                }
                "stopLocationUpdates" -> {
                    stopService()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        // Register the receiver for location updates
        val filter = IntentFilter("LocationUpdate")
        registerReceiver(locationReceiver, filter)
    }

    override fun onDestroy() {
        super.onDestroy()
        // Unregister the receiver
        unregisterReceiver(locationReceiver)
    }

    private fun startService(locationUpdateInterval: Long, stopAfterTimestamp: Long) {
        try {
            val serviceIntent = Intent(this, LocationService::class.java).apply {
                putExtra("interval", locationUpdateInterval) // Pass the interval to the service
                putExtra("stopAfterTimestamp", stopAfterTimestamp)

            }
            startService(serviceIntent)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun stopService() {
        try {
            val serviceIntent = Intent(this, LocationService::class.java)
            stopService(serviceIntent)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}