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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.sizeOf(context);
        final textScaler = MediaQuery.textScalerOf(context);

        MiniScreenUtil.init(
          screenSize: screenSize,
          systemTextScaler: textScaler,
          config: MiniScreenConfig(
            designSize: designSize,
            allowSystemTextScale: allowSystemTextScale,
            minTextScaleFactor: minTextScaleFactor,
            maxTextScaleFactor: maxTextScaleFactor,
          ),
        );

        final built = builder?.call(context, child) ?? child;

        // Force subtree rebuild on resize/orientation changes (especially important on Web),
        // so widgets that rely on .w/.h/.sp/.r (and don't read MediaQuery directly) update.
        return KeyedSubtree(
          key: ValueKey(
              'msu_${screenSize.width}x${screenSize.height}_${textScaler.scale(1.0)}'),
          child: built,
        );
      },
    );
  }
}
