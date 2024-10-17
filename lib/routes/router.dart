// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:anilibria_clone/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<CustomRoute> routes = [
    CustomRoute(
      path: '/',
      page: HomeRouter.page,
      initial: true,
      children: [
        AutoRoute(
          path: 'feed',
          page: FeedRouter.page,
          children: [
            AutoRoute(path: '', page: FeedListRouter.page),
            CustomRoute(
              path: ':id',
              page: FeedItemRouter.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              durationInMilliseconds: 200,
              children: [
                CustomRoute(
                  path: 'video',
                  page: VideoAppRouter.page,
                  transitionsBuilder: TransitionsBuilders.slideBottom,
                  durationInMilliseconds: 300,
                ),
              ],
            ),
            CustomRoute(
              path: 'schedule',
              page: ScheduleListRouter.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              durationInMilliseconds: 200,
            ),
          ],
        ),
        AutoRoute(
          path: 'search',
          page: SearchRouter.page,
          children: [
            AutoRoute(path: '', page: SearchListRouter.page),
            CustomRoute(
              path: ':id',
              page: FeedItemRouter.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              durationInMilliseconds: 200,
            ),
          ],
        ),
        AutoRoute(
          path: 'youtube',
          page: YouTubeRouter.page,
          children: [AutoRoute(path: '', page: YouTubeListRouter.page)],
        ),
      ],
    ),
  ];
}
