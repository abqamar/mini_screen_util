import 'dart:ui';

import 'enums.dart';

/// Configuration for [MiniScreenUtil].
class MiniScreenConfig {
  const MiniScreenConfig({
    required this.designSize,
    this.allowSystemTextScale = true,
    this.minTextScaleFactor,
    this.maxTextScaleFactor,
    this.radiusMode = RadiusMode.min,
  });

  /// The size your UI was designed on (e.g. Size(480, 800)).
  final Size designSize;

  /// Whether to apply the device/system textScaleFactor.
  ///
  /// If false, `.sp` will ignore system text scale (equivalent to 1.0).
  final bool allowSystemTextScale;

  /// Optional minimum clamp for system textScaleFactor.
  final double? minTextScaleFactor;

  /// Optional maximum clamp for system textScaleFactor.
  final double? maxTextScaleFactor;

  /// How `.r` values scale.
  final RadiusMode radiusMode;
}
