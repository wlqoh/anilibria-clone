import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomeRouter.page,
      children: [
        AutoRoute(
          path: 'feed',
          page: FeedRouter.page,
          children: [
            AutoRoute(path: '', page: FeedListRouter.page),
            AutoRoute(path: ':id', page: FeedItemRouter.page),
            AutoRoute(path: 'schedule', page: ScheduleListRouter.page),
          ],
        ),
      ],
    ),
  ];
}
