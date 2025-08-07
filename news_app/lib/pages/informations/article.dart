import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_fonts.dart';
import 'package:news_app/pages/informations/launcher.dart';

class ArticleDetails extends StatelessWidget {
  final String? url;
  final String imageUrl;
  final String title;
  final String authorname;
  final String date;
  final String description;

  final String content;
  const ArticleDetails({
    super.key,
    required this.title,
    this.url,
    required this.authorname,
    required this.date,
    required this.content,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 316.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 271.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.w),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(title, style: AppFonts.black18w600),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "$authorname .$date",
                          style: AppFonts.grey12w400,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          description,
                          style: AppFonts.black16w400merriweather,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      url == null
                          ? const SizedBox()
                          : TextButton(
                              onPressed: () async {
                                await Launcher.launchUrlInBrowser(url!);
                              },

                              child: const Text(
                                'Read full article',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
