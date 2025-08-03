import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/styling/app_colors.dart';

class AppFonts {
  static TextStyle black32w600 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 32.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle black18w600 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle grey12w400 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 12.sp,
      color: AppColors.greyColor,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle black16w400 = GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400,
    ),
  );
}
