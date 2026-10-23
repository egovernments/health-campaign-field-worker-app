package com.digit.hcm

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.location.GnssStatus
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.EventChannel

/**
 * Streams GNSS satellite counts to Flutter for the location capture dialog,
 * the way ODK Collect does. Fused location fixes don't carry a satellite
 * count, so this reads Android's GnssStatus directly. Each event is
 * {"used": satellites used in the current fix, "visible": satellites tracked,
 *  "systems": {constellation name: satellites used}} (systems with none used
 * are left out).
 *
 * While the stream is listened to, this also requests GPS_PROVIDER updates
 * directly: requests made through the fused provider don't reliably keep the
 * GNSS engine reporting satellite status to this app, which left the count
 * missing on some captures. The fixes themselves are ignored here; positions
 * still come from the location plugin. Needs API 24+ and precise location
 * permission; otherwise the stream stays silent.
 */
class GnssSatelliteStreamHandler(private val context: Context) : EventChannel.StreamHandler {

    private val locationManager =
        context.getSystemService(Context.LOCATION_SERVICE) as LocationManager

    // Typed as Any so this class still loads on API < 24.
    private var callback: Any? = null

    // Keeps the GNSS engine running while satellite counts are wanted.
    private val gpsListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {}
        override fun onProviderEnabled(provider: String) {}
        override fun onProviderDisabled(provider: String) {}
        @Deprecated("Required on API < 29")
        override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}
    }
    private var gpsRequested = false

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) return
        if (ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION)
            != PackageManager.PERMISSION_GRANTED
        ) return
        register(events)
    }

    override fun onCancel(arguments: Any?) {
        unregister()
    }

    @RequiresApi(Build.VERSION_CODES.N)
    private fun register(events: EventChannel.EventSink) {
        unregister()
        val statusCallback = object : GnssStatus.Callback() {
            override fun onSatelliteStatusChanged(status: GnssStatus) {
                var used = 0
                val systems = mutableMapOf<String, Int>()
                for (i in 0 until status.satelliteCount) {
                    if (!status.usedInFix(i)) continue
                    used++
                    val name = constellationName(status.getConstellationType(i))
                    systems[name] = (systems[name] ?: 0) + 1
                }
                events.success(
                    mapOf(
                        "used" to used,
                        "visible" to status.satelliteCount,
                        "systems" to systems
                    )
                )
            }
        }
        try {
            locationManager.registerGnssStatusCallback(
                statusCallback,
                Handler(Looper.getMainLooper())
            )
            callback = statusCallback
            locationManager.requestLocationUpdates(
                LocationManager.GPS_PROVIDER,
                GPS_INTERVAL_MS,
                0f,
                gpsListener,
                Looper.getMainLooper()
            )
            gpsRequested = true
            // GnssStatus stays silent while no satellites are heard (e.g. deep
            // indoors), so report zero up front, as ODK Collect shows it.
            events.success(
                mapOf("used" to 0, "visible" to 0, "systems" to emptyMap<String, Int>())
            )
        } catch (e: SecurityException) {
            // Permission revoked between the check and registration.
        } catch (e: IllegalArgumentException) {
            // Device has no GPS provider; the count just stays hidden.
        }
    }

    fun unregister() {
        if (gpsRequested) {
            locationManager.removeUpdates(gpsListener)
            gpsRequested = false
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) return
        (callback as? GnssStatus.Callback)?.let {
            locationManager.unregisterGnssStatusCallback(it)
        }
        callback = null
    }

    companion object {
        const val CHANNEL = "digit_forms_engine/gnss_satellites"
        private const val GPS_INTERVAL_MS = 1000L

        // GnssStatus.CONSTELLATION_* values (compile-time constants, so safe on
        // any API level; IRNSS/NavIC was added in API 29).
        private fun constellationName(type: Int): String = when (type) {
            GnssStatus.CONSTELLATION_GPS -> "GPS"
            GnssStatus.CONSTELLATION_SBAS -> "SBAS"
            GnssStatus.CONSTELLATION_GLONASS -> "GLONASS"
            GnssStatus.CONSTELLATION_QZSS -> "QZSS"
            GnssStatus.CONSTELLATION_BEIDOU -> "BeiDou"
            GnssStatus.CONSTELLATION_GALILEO -> "Galileo"
            GnssStatus.CONSTELLATION_IRNSS -> "NavIC"
            else -> "Other"
        }
    }
}
