import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_fonts.dart';
import 'package:news_app/pages/explore/widgets/category_item.dart';
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
          child: Column(
            children: [
              SizedBox(height: 16.h),
              SizedBox(
                height: 40.h,
                child: ListView(
                  padding: EdgeInsets.only(left: 32.w),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
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
                  //ageUrl:
                  //https://thumbs.dreamstime.com/b/sacre-coeur-cathedral-paris-france-panoramic-imaage-spring-flowers-garden-front-94274859.jpg",
                  title: "Apple Unveils Revolutionary AI Features",
                  authorName: "Abdallah",
                  date: "May 1,2025",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
