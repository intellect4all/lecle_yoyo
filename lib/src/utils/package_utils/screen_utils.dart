import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';

class ScreenUtils {
  static void toggleFullScreen(bool fullScreen) {
    if (fullScreen) {
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    } else {
      OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
    }
  }
}
