import 'package:go_router/go_router.dart';
import 'package:news_app/core/navigation/app_routes.dart';
import 'package:news_app/pages/explore/explore.dart';

class RouterGenerator {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.explore,
        name: AppRoutes.explore,
        builder: (context, state) => Explore(),
      ),
    ],
    initialLocation: AppRoutes.explore,
  );
}
