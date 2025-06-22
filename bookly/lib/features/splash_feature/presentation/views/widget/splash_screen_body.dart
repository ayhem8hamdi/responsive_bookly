import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/splash_feature/presentation/views/widget/animated_fade_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3400),
        () => Get.offNamed(AppRouter.homeScreen));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedFadeWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              Assets.logo,
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 9),
            Text(
              'Read Free Books',
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular16.copyWith(
                color: AppColors.kThirdColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
