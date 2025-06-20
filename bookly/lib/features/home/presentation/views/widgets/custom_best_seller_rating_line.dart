import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBestSellerRatingLine extends StatelessWidget {
  const CustomBestSellerRatingLine({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        r"Free",
        style: AppStyles.styleRegular20.copyWith(color: Colors.green),
      ),
      const Spacer(),
      RateSection(
        volumeInfo: volumeInfo,
      )
    ]);
  }
}

class RateSection extends StatelessWidget {
  const RateSection({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.rateIcon),
        const SizedBox(
          width: 4.7,
        ),
        Text(
          volumeInfo.averageRating == null
              ? '0'
              : volumeInfo.averageRating.toString(),
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(
          width: 4.7,
        ),
        Text(
          volumeInfo.ratingsCount == null
              ? '( 0 )'
              : '( ${volumeInfo.ratingsCount.toString()} )',
          style: AppStyles.styleRegular14,
        )
      ],
    );
  }
}
