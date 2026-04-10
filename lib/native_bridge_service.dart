import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeBridgeService {
  static Future<String> openPhoneDialer() async {
    try {
      final result = await MethodChannel(
        'com.example/native',
      ).invokeMethod('openPhoneDialer');

      return result;
    } catch (error) {
      debugPrint('Error: $error');
      return 'Error: $error';
    }
  }
}
