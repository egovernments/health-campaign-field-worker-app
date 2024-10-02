package com.digit.location_tracker

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class LocationTrackerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    private val locationReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val latitude = intent?.getDoubleExtra("latitude", 0.0)
            val longitude = intent?.getDoubleExtra("longitude", 0.0)
            // Handle the location data here
            Toast.makeText(context, "Latitude: $latitude, Longitude: $longitude", Toast.LENGTH_LONG).show()
            channel.invokeMethod("locationUpdate", mapOf("latitude" to latitude, "longitude" to longitude))
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("LocationTrackerPlugin", "Plugin attached to engine")
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.digit.location_tracker")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext

        // Register the receiver for location updates
        val filter = IntentFilter("LocationUpdate")
        context.registerReceiver(locationReceiver, filter)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "startLocationUpdates" -> {
                val interval = call.argument<Long>("interval") ?: 60000L
                val stopAfterTimestamp = call.argument<Long>("stopAfterTimestamp") ?: System.currentTimeMillis() + 60000L
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

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        // Unregister the receiver
        context.unregisterReceiver(locationReceiver)
    }

    private fun startService(locationUpdateInterval: Long, stopAfterTimestamp: Long) {
        try {
            val serviceIntent = Intent(context, LocationService::class.java).apply {
                putExtra("interval", locationUpdateInterval)
                putExtra("stopAfterTimestamp", stopAfterTimestamp)
            }
            context.startService(serviceIntent)
        } catch (e: Exception) {
            Log.e("LocationTrackerPlugin", "Error starting service", e)
        }
    }

    private fun stopService() {
        try {
            val serviceIntent = Intent(context, LocationService::class.java)
            context.stopService(serviceIntent)
        } catch (e: Exception) {
            Log.e("LocationTrackerPlugin", "Error stopping service", e)
        }
    }
}
