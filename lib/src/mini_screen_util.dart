import 'package:flutter/widgets.dart';

import 'config.dart';
import 'enums.dart';

/// Mini ScreenUtil-like engine.
///
/// Initialize once (typically via [MiniScreenInit]) then use
/// `.w`, `.h`, `.r`, `.sp` on numbers.
class MiniScreenUtil {
  MiniScreenUtil._();

  static late Size _screen;
  static late TextScaler _systemTextScaler;
  static late MiniScreenConfig _config;
  static bool _ready = false;

  /// Initialize the engine.
  ///
  /// Usually you do not call this directly; wrap your app with [MiniScreenInit].
  static void init({
    required Size screenSize,
    required TextScaler systemTextScaler,
    required MiniScreenConfig config,
  }) {
    _screen = screenSize;
    _systemTextScaler = systemTextScaler;
    _config = config;
    _ready = true;
  }

  static void _checkReady() {
    assert(
      _ready,
      'MiniScreenInit must wrap your app before using .w/.h/.r/.sp',
    );
  }

  /// Current screen size (logical pixels).
  static Size get screen {
    _checkReady();
    return _screen;
  }

  /// Design size configured via [MiniScreenConfig].
  static Size get design {
    _checkReady();
    return _config.designSize;
  }

  /// Width scale factor: screenWidth / designWidth.
  static double get scaleW {
    _checkReady();
    return _screen.width / _config.designSize.width;
  }

  /// Height scale factor: screenHeight / designHeight.
  static double get scaleH {
    _checkReady();
    return _screen.height / _config.designSize.height;
  }

  /// Effective text scale factor used for `.sp`.
  static double get textScaleFactor {
    _checkReady();
    if (!_config.allowSystemTextScale) return 1.0;

    // Flutter now exposes a TextScaler instead of a single textScaleFactor.
    // We derive an approximate factor by scaling 1.0.
    var factor = _systemTextScaler.scale(1.0);

    final min = _config.minTextScaleFactor;
    final max = _config.maxTextScaleFactor;
    if (min != null && factor < min) factor = min;
    if (max != null && factor > max) factor = max;

    return factor;
  }

  static TextScaler get textScaler {
    _checkReady();
    if (!_config.allowSystemTextScale) return const TextScaler.linear(1.0);

    final factor = textScaleFactor;
    // We intentionally use a linear scaler after clamping to ensure predictable results.
    return TextScaler.linear(factor);
  }

  /// Scale a value based on width.
  static double w(num v) {
    _checkReady();
    return v * scaleW;
  }

  /// Scale a value based on height.
  static double h(num v) {
    _checkReady();
    return v * scaleH;
  }

  /// Scale a value for border radius.
  static double r(num v) {
    _checkReady();
    switch (_config.radiusMode) {
      case RadiusMode.width:
        return v * scaleW;
      case RadiusMode.height:
        return v * scaleH;
      case RadiusMode.min:
        // Use shortest side against design width (stable across aspect ratios).
        final s = _screen.shortestSide / _config.designSize.width;
        return v * s;
    }
  }

  /// Scale a font size.
  ///
  /// Uses width scaling and applies system text scale (optional).
  static double sp(num v) {
    _checkReady();
    final base = v * scaleW;
    return textScaler.scale(base);
  }
}
