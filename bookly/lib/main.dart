import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );

  _testApi();
}

void _testApi() async {
  var t = HomeRepoImplementation(ApiService(Dio()));
  var l = await t.fetchBestSellerBooks();
  print(l);
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
