import 'dart:async';

import 'package:flutter/services.dart';

class CheckInet {
  static const MethodChannel _channel = const MethodChannel('check_inet');

  static Future<bool> get checkInternet async {
    bool inetActive = false;
    await _channel.invokeMethod('checkInternet').then((value) {
      if(value == "inet_present"){
        inetActive = true;
      } else {
        inetActive = false;
      }
    });
    return inetActive;
  }
}
