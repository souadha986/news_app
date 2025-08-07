import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/core/styling/app_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CategoryItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        alignment: Alignment.center,
        height: 35.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56.r),
          border: BoxBorder.all(color: Color(0xFFE9EEFA), width: 1),
        ),
        child: Text(
          title,
          style: AppFonts.black16w400inter.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
