import 'package:flutter/foundation.dart';

abstract final class AppMotion {
  static const Duration fast = Duration(milliseconds: 180);
  static const Duration standard = Duration(milliseconds: 360);
  static const Duration slow = Duration(milliseconds: 700);

  static Duration getDuration({
    required Duration duration,
    required bool reduceMotion,
  }) {
    if (reduceMotion || kIsWeb == false) {
      return duration;
    }

    return duration;
  }
}
