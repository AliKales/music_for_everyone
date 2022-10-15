import 'package:go_router/go_router.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_page_view.dart';
import 'package:music_for_everyone/ui/pages/main_page/main_page_view.dart';
import 'package:music_for_everyone/ui/pages/search_page/search_page_view.dart';

import 'common_libs.dart';

String lastPage = "";

class PagePaths {
  static String main = "/";
  static String charts = "/charts";
  static String search = "/search";
}

final appRouter = GoRouter(
  routes: [
    AppRoute(PagePaths.main, (s) => const MainPageView()),
    AppRoute(PagePaths.charts, (s) => const ChartsPageView()),
    AppRoute(PagePaths.search, (s) => const SearchPageView()),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder)
      : super(
          path: path,
          pageBuilder: (context, state) => MaterialPage(
            child: builder(state),
          ),
        );
}

String? _handleRedirect(GoRouterState state) {
  if (state.location == lastPage) {
    return null;
  }
  lastPage = state.location;
  return lastPage;
}
