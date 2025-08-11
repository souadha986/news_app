import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/navigation/app_routes.dart';
import 'package:news_app/core/networking/models.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_fonts.dart';
import 'package:news_app/pages/explore/widgets/article_card.dart';
import 'package:news_app/pages/search_results/Cubit/seachcubit.dart';
import 'package:news_app/pages/search_results/Cubit/searchstates.dart';

class SearchResults extends StatefulWidget {
  final String query;
  const SearchResults({super.key, required this.query});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().search(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search_result".tr()),
        toolbarHeight: 100.h,
        backgroundColor: Color(0xffE9EEFA),
        centerTitle: true,
        titleTextStyle: AppFonts.black18w600,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SearchCubit, Searchstates>(
          builder: (context, state) {
            if (state is Loadingstate) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(color: AppColors.blackColor),
                ),
              );
            } else if (state is Successstate) {
              final modele = state.model;
              if (modele.totalResults == 0) {
                return Center(child: Text("no_results".tr()));
              } else {
                return Column(
                  children: [
                    SizedBox(height: 18.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: modele.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = modele.articles![index];
                        return ArticleCard(
                          onTap: () {
                            context.push(AppRoutes.article, extra: article);
                          },
                          title: article.title ?? "",
                          authorName: article.author ?? "",
                          date: DateFormat(
                            'yyyy-MM-dd– kk:mm',
                          ).format(article.publishedAt!),
                          imageUrl: article.urlToImage,
                        );
                      },
                    ),
                  ],
                );
              }
            } else if (state is Errorstate) {
              return Center(child: Text(state.error));
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(child: Text("something went wrong ")),
              );
            }
          },
        ),
      ),
    );
  }
}
