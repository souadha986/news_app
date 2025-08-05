import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_fonts.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  const ArticleCard({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.w),
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
                child: Text(title, style: AppFonts.black18w600),
              ),
              Text("$authorName .$date", style: AppFonts.grey12w400),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://static.toiimg.com/photo/msid-109960309/109960309.jpg",
              height: 80.h,
              width: 112.w,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
