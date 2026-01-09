# mini_screen_util

A tiny ScreenUtil-like helper built on **MediaQuery**.

- ✅ Provides `.w`, `.h`, `.r`, `.sp` on numbers
- ✅ No `BuildContext` needed at usage
- ✅ Handles resize/orientation (via `LayoutBuilder`)
- ✅ Optional system text scale support + clamp

> Version: **0.0.1**

---

## Install

```yaml
dependencies:
  mini_screen_util: ^0.0.1
```

---

## Initialize (like `ScreenUtilInit`)

Wrap your app once:

```dart
import 'package:flutter/material.dart';
import 'package:mini_screen_util/mini_screen_util.dart';

void main() {
  runApp(
    MiniScreenInit(
      designSize: const Size(480, 800),
      // Optional:
      // allowSystemTextScale: true,
      // minTextScaleFactor: 1.0,
      // maxTextScaleFactor: 1.15,
      child: const MyApp(),
    ),
  );
}
```

---

## Use `.w/.h/.r/.sp` (no context)

```dart
import 'package:flutter/material.dart';
import 'package:mini_screen_util/mini_screen_util.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 72.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w),
      ),
      alignment: Alignment.center,
      child: Text(
        'Hello',
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
```

---

## Notes

- `.sp` uses **width scaling** + optional **system textScaleFactor**.
- `.r` defaults to scaling using the **shortest side**.

---

## License

MIT
