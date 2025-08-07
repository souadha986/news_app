import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_fonts.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String authorName;
  final String date;
  final String? imageUrl;
  const ArticleCard({
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
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(32.w, 0.h, 32.w, 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Text(title, style: AppFonts.black18w600, maxLines: 2),
                ),
                SizedBox(
                  width: 238.w,
                  child: Text("$authorName .$date", style: AppFonts.grey12w400),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl:
                    imageUrl ??
                    "https://static.vecteezy.com/system/resources/thumbnails/010/586/271/small_2x/breaking-news-background-business-or-technology-template-breaking-news-text-on-dark-blue-with-light-effect-digital-technology-tv-news-show-broadcast-design-vector.jpg",
                height: 80.h,
                width: 112.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
