import 'mini_screen_util.dart';

/// Numeric extensions for responsive units.
extension MiniScreenNum on num {
  /// Width-scaled value.
  double get w => MiniScreenUtil.w(this);

  /// Height-scaled value.
  double get h => MiniScreenUtil.h(this);

  /// Radius-scaled value.
  double get r => MiniScreenUtil.r(this);

  /// Font-size scaled value.
  double get sp => MiniScreenUtil.sp(this);
}
