
package com.example.native_phone_dialer.channel

import android.app.Activity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class NativeChannelHandler(
    private val activity: Activity
) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        when (call.method) {

            "openPhoneDialer" -> {
                val phone = call.argument<String>("phoneNumber") ?: ""
                PhoneDialerHandler.open(activity, phone)
                result.success("Dialer opened")
            }

            else -> result.notImplemented()
        }
    }
}