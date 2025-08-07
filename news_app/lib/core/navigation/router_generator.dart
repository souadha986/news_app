import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/navigation/app_routes.dart';
import 'package:news_app/core/networking/models.dart';
import 'package:news_app/pages/explore/explore.dart';
import 'package:news_app/pages/informations/article.dart';
import 'package:news_app/pages/search_results/search_results.dart';

class RouterGenerator {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.explore,
        name: AppRoutes.explore,
        builder: (context, state) => Explore(),
      ),
      GoRoute(
        path: AppRoutes.searchresult,
        name: AppRoutes.searchresult,

        builder: (context, state) {
          String query = state.extra as String;
          return SearchResults(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.article,
        name: AppRoutes.article,

        builder: (context, state) {
          Article article = state.extra as Article;
          return ArticleDetails(
            title: article.title ?? '',
            authorname: article.author ?? '',
            date: DateFormat('yyyy-MM-dd– kk:mm').format(article.publishedAt!),
            content: article.content ?? '',
            description: article.description ?? '',
            url: article.url,
            imageUrl:
                article.urlToImage ??
                "https://static.vecteezy.com/system/resources/thumbnails/010/586/271/small_2x/breaking-news-background-business-or-technology-template-breaking-news-text-on-dark-blue-with-light-effect-digital-technology-tv-news-show-broadcast-design-vector.jpg",
          );
        },
      ),
    ],
    initialLocation: AppRoutes.explore,
  );
}
