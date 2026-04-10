package com.example.native_phone_dialer.channel

import android.app.Activity
import android.content.Intent
import android.net.Uri

object PhoneDialerHandler {

    fun open(activity: Activity, phone: String) {
        val intent = Intent(Intent.ACTION_DIAL).apply {
            data = Uri.parse("tel:$phone")
        }
        activity.startActivity(intent)
    }
}