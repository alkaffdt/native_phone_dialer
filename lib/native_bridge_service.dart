import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeBridgeService {
  static Future<String> openPhoneDialer(String phoneNumber) async {
    try {
      final result = await MethodChannel(
        'com.example/native',
      ).invokeMethod('openPhoneDialer', {'phoneNumber': phoneNumber});

      return result;
    } catch (error) {
      debugPrint('Error: $error');
      return 'Error: $error';
    }
  }
}
