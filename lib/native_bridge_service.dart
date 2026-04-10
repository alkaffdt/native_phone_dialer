import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeBridgeService {
  static Future<String> openPhoneDialer(String phoneNumber) async {
    // try {
    //   await MethodChannel(
    //     'com.example/native',
    //   ).invokeMethod('openPhoneDialer', {'phoneNumber': phoneNumber});
    // } on PlatformException catch (e) {
    //   print("Failed to make phone call: '${e.message}'.");
    // }

    try {
      final result = await MethodChannel(
        'com.example/native',
      ).invokeMethod('openPhoneDialer', {'phoneNumber': phoneNumber});

      return result;
    } catch (error) {
      // return 'Error: $error';
      debugPrint('Error: $error');
      return 'Error: $error';
    }
  }
}
