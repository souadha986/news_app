import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_fonts.dart';

class ArticleDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String authorname;
  final String date;
  final String description;

  final String content;
  const ArticleDetails({
    super.key,
    required this.title,
    required this.authorname,
    required this.date,
    required this.content,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 316.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 271.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: 400.w,
                      child: Text(title, style: AppFonts.black18w600),
                    ),
                    Text(content),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
