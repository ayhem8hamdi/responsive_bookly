import 'package:bookly/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static final TextStyle baseInter = GoogleFonts.inter();

  static final TextStyle styleRegular18 = baseInter.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle styleRegular20 = baseInter.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular14 = baseInter.copyWith(
    color: AppColors.kSecondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular16 = baseInter.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular30 = baseInter.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );
}
