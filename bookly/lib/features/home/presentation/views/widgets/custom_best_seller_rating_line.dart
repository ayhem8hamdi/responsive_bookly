import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBestSellerRatingLine extends StatelessWidget {
  const CustomBestSellerRatingLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r"19.99$",
          style: AppStyles.styleRegular20,
        ),
        const Spacer(),
        SvgPicture.asset(Assets.rateIcon),
        const SizedBox(
          width: 3,
        ),
        Text(
          '4.8',
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          '(2390)',
          style: AppStyles.styleRegular14,
        )
      ],
    );
  }
}
