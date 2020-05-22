import 'dart:async';

import 'package:flutter/services.dart';

class PlatformViewBugDemo {
  static const MethodChannel _channel =
      const MethodChannel('platform_view_bug_demo');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
