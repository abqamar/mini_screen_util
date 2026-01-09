import 'package:flutter/widgets.dart';

import 'config.dart';
import 'mini_screen_util.dart';

/// App-level initializer (similar to ScreenUtilInit).
///
/// Wrap your app with this widget so [MiniScreenUtil] can use
/// `MediaQuery.sizeOf(context)` safely and update on resize/orientation.
class MiniScreenInit extends StatelessWidget {
  const MiniScreenInit({
    super.key,
    required this.designSize,
    required this.child,
    this.builder,
    this.allowSystemTextScale = true,
    this.minTextScaleFactor,
    this.maxTextScaleFactor,
  });

  /// The size your UI was designed on (e.g. const Size(480, 800)).
  final Size designSize;

  /// Your app widget.
  final Widget child;

  /// Optional builder, matching ScreenUtilInit style.
  final TransitionBuilder? builder;

  /// Whether `.sp` should respect system text scaling.
  final bool allowSystemTextScale;

  /// Optional clamp for system text scale factor.
  final double? minTextScaleFactor;
  final double? maxTextScaleFactor;

  @override
  Widget build(BuildContext context) {
    final built = builder?.call(context, child) ?? child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mq = MediaQuery.of(context);

        MiniScreenUtil.init(
          screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          systemTextScaleFactor: mq.textScaleFactor,
          config: MiniScreenConfig(
            designSize: designSize,
            allowSystemTextScale: allowSystemTextScale,
            minTextScaleFactor: minTextScaleFactor,
            maxTextScaleFactor: maxTextScaleFactor,
          ),
        );

        return built;
      },
    );
  }
}
