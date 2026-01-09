import 'package:flutter/material.dart';
import 'package:mini_screen_util/mini_screen_util.dart';

void main() {
  runApp(
    MiniScreenInit(
      designSize: const Size(480, 800),
      child: const ExampleApp(),
    ),
  );
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ExampleHome(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mini_screen_util', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Center(
        child: Container(
          width: 320.w,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(width: 1.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Responsive Units',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 12.h),
              Text('200.w = ${200.w.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 6.h),
              Text('48.h = ${48.h.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 6.h),
              Text('12.r = ${12.r.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 6.h),
              Text('16.sp = ${16.sp.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
