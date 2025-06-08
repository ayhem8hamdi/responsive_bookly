import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.logo,
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              'Read Free Books',
              style: AppStyles.styleRegular16
                  .copyWith(color: AppColors.kThirdColor),
            ),
          ],
        ),
      ),
    );
  }
}
