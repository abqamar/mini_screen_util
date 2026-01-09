import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_screen_util/mini_screen_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('mini_screen_util', () {
    testWidgets('scales .w/.h 1:1 when screen == design size', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 800));

      await tester.pumpWidget(
        MiniScreenInit(
          designSize: const Size(480, 800),
          child: const MaterialApp(home: SizedBox()),
        ),
      );
      await tester.pumpAndSettle();

      expect(100.w, closeTo(100, 0.001));
      expect(100.h, closeTo(100, 0.001));
      expect(10.r, closeTo(10, 0.001));
      expect(16.sp, closeTo(16, 0.001));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('scales width proportionally', (tester) async {
      // screen width doubles, height same
      await tester.binding.setSurfaceSize(const Size(960, 800));

      await tester.pumpWidget(
        MiniScreenInit(
          designSize: const Size(480, 800),
          child: const MaterialApp(home: SizedBox()),
        ),
      );
      await tester.pumpAndSettle();

      expect(100.w, closeTo(200, 0.001));
      expect(100.h, closeTo(100, 0.001));

      await tester.binding.setSurfaceSize(null);
    });
  });
}
