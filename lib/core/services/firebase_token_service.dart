import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseTokenService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<String> getFCMToken() async {
    try {
      if (Platform.isIOS) {
        String? apnsToken = await _messaging.getAPNSToken();
        if (apnsToken != null) {
          String? token = await _messaging.getToken();
          return token ?? "";
        } else {
          debugPrint('APNS Token is not available (Expected on Simulator)');
          return "";
        }
      } else {
        String? token = await _messaging.getToken();
        return token ?? "";
      }
    } catch (e) {
      debugPrint("Error getting FCM Token: $e");
      return "";
    }
  }
}
