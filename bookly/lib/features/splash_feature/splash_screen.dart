import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/features/splash_feature/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBgColor,
      body: const SplashScreenBody(),
    );
  }
}
