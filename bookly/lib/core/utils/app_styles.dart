import 'package:bookly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static final TextStyle basePoppins = GoogleFonts.poppins();

  static final TextStyle styleRegular18 = basePoppins.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle styleRegular20 = basePoppins.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular14 = basePoppins.copyWith(
    color: AppColors.kSecondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular16 = basePoppins.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle styleRegular30 = basePoppins.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );
}
