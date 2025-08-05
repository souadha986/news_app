import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_fonts.dart';
import 'package:news_app/pages/explore/widgets/article_card.dart';
import 'package:news_app/pages/explore/widgets/category_item.dart';
import 'package:news_app/pages/explore/widgets/features.dart';
import 'package:news_app/pages/explore/widgets/models.dart';
import 'package:news_app/pages/explore/widgets/topimage.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Color(0xffE9EEFA),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text("explore".tr()),
        ),
        titleTextStyle: AppFonts.black32w600,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: Features.getTopHeadlines(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.blackColor),
                );
              }
              ;
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.hasData) {
                Models model = snapshot.data as Models;
                if (model.totalResults == 0) {
                  return Center(child: Text("no_results".tr()));
                } else {
                  Column(
                    children: [
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        child: ListView(
                          padding: EdgeInsets.only(left: 32.w),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoryItem(title: "all".tr()),
                            CategoryItem(title: "technology".tr()),
                            CategoryItem(title: "business".tr()),
                            CategoryItem(title: "entertainment".tr()),
                            CategoryItem(title: "travel".tr()),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 32.w),
                        child: Topimage(
                          model.articles![0].urlToImage,
                          title: model.articles![0].title ?? "",
                          authorName: model.articles![0].author ?? "",
                          date: DateFormat(
                            'yyyy-MM-dd – kk:mm',
                          ).format(model.articles![0].publishedAt!),
                        ),
                      ),

                      SizedBox(height: 40.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.articles!.length,
                          itemBuilder: (context, index) {
                            Article article = model.articles![index];
                            return ArticleCard(
                              title: article.title ?? "",
                              authorName: article.author ?? "",
                              date: DateFormat(
                                'yyyy-MM-dd– kk:mm',
                              ).format(article.publishedAt!),
                              imageUrl: article.urlToImage,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              }
              ;
              return Center(child: Text("something went wrong "));
            },
          ),
        ),
      ),
    );
  }
}
