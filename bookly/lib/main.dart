import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: AppColors.kBgColor,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.getViews(),
    );
  }
}
