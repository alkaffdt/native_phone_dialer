package com.example.native_phone_dialer // ⚠️ SESUAIKAN dengan project kamu

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "openPhoneDialer") {
                    val phone = call.argument<String>("phoneNumber") ?: ""
                    openPhoneDialer(phone)
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun openPhoneDialer(phone: String) {
        val intent = Intent(Intent.ACTION_DIAL)
        intent.data = Uri.parse("tel:$phone")
        startActivity(intent)
    }
}