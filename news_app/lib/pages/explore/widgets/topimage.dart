import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_fonts.dart';

class Topimage extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String authorName;
  final String date;
  final String? imageUrl;
  const Topimage(
    String? urlToImage, {
    super.key,
    required this.title,
    required this.onTap,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8.r),

            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://static.toiimg.com/photo/msid-109960309/109960309.jpg",
              height: 206.h,
              width: 366.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 16.h),
          Text(title, style: AppFonts.black18w600),
          SizedBox(height: 12.h),
          Text("$authorName . $date", style: AppFonts.grey12w400),
        ],
      ),
    );
  }
}
