package com.example.phantom_transfer

import android.view.KeyEvent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity : FlutterActivity() {

    private val CHANNEL = "phantom_transfer/volume"

    private var volumeChannel: MethodChannel? = null

    override fun configureFlutterEngine(
        flutterEngine: io.flutter.embedding.engine.FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)

        volumeChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        )
    }

    override fun onKeyDown(
        keyCode: Int,
        event: KeyEvent?
    ): Boolean {

        if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
            Log.d("VolumeCheck", "Volume down button was pressed (Kotlin)")

            volumeChannel?.invokeMethod(
                "volumeDownPressed",
                null
            )

            return true
        }

        return super.onKeyDown(keyCode, event)
    }
}