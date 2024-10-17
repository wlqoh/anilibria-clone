// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anilibria_clone/models/article/article.dart' as _i12;
import 'package:anilibria_clone/routes/empty_routers.dart' as _i4;
import 'package:anilibria_clone/screens/feed/expected_today/list.dart' as _i1;
import 'package:anilibria_clone/screens/feed/item/feed_item_screen.dart' as _i2;
import 'package:anilibria_clone/screens/feed/list/feed_list_screen.dart' as _i3;
import 'package:anilibria_clone/screens/feed/schedule/schedule_list_screen.dart'
    as _i6;
import 'package:anilibria_clone/screens/home/home_screen.dart' as _i5;
import 'package:anilibria_clone/screens/search/search_list_screen.dart'
    as _i7;
import 'package:anilibria_clone/screens/youtube/youtube_list_screen.dart'
    as _i9;
import 'package:anilibria_clone/widgets/video_player/video_player.dart' as _i8;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    ExpectedTodayListRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExpectedTodayListScreen(),
      );
    },
    FeedItemRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FeedItemRouterArgs>(
          orElse: () => FeedItemRouterArgs(id: pathParams.optString('id')));
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.FeedItemScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FeedListRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FeedListScreen(),
      );
    },
    FeedRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FeedRouter(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    ScheduleListRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ScheduleListScreen(),
      );
    },
    SearchListRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchListScreen(),
      );
    },
    SearchRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchRouter(),
      );
    },
    VideoAppRouter.name: (routeData) {
      final args = routeData.argsAs<VideoAppRouterArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.VideoApp(
          key: args.key,
          article: args.article,
        ),
      );
    },
    YouTubeListRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.YouTubeListScreen(),
      );
    },
    YouTubeRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.YouTubeRouter(),
      );
    },
  };
}

/// generated route for
/// [_i1.ExpectedTodayListScreen]
class ExpectedTodayListRouter extends _i10.PageRouteInfo<void> {
  const ExpectedTodayListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ExpectedTodayListRouter.name,
          initialChildren: children,
        );

  static const String name = 'ExpectedTodayListRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FeedItemScreen]
class FeedItemRouter extends _i10.PageRouteInfo<FeedItemRouterArgs> {
  FeedItemRouter({
    _i11.Key? key,
    String? id,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FeedItemRouter.name,
          args: FeedItemRouterArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'FeedItemRouter';

  static const _i10.PageInfo<FeedItemRouterArgs> page =
      _i10.PageInfo<FeedItemRouterArgs>(name);
}

class FeedItemRouterArgs {
  const FeedItemRouterArgs({
    this.key,
    this.id,
  });

  final _i11.Key? key;

  final String? id;

  @override
  String toString() {
    return 'FeedItemRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.FeedListScreen]
class FeedListRouter extends _i10.PageRouteInfo<void> {
  const FeedListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FeedListRouter.name,
          initialChildren: children,
        );

  static const String name = 'FeedListRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FeedRouter]
class FeedRouter extends _i10.PageRouteInfo<void> {
  const FeedRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FeedRouter.name,
          initialChildren: children,
        );

  static const String name = 'FeedRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRouter extends _i10.PageRouteInfo<void> {
  const HomeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ScheduleListScreen]
class ScheduleListRouter extends _i10.PageRouteInfo<void> {
  const ScheduleListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ScheduleListRouter.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleListRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SearchListScreen]
class SearchListRouter extends _i10.PageRouteInfo<void> {
  const SearchListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SearchListRouter.name,
          initialChildren: children,
        );

  static const String name = 'SearchListRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SearchRouter]
class SearchRouter extends _i10.PageRouteInfo<void> {
  const SearchRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'SearchRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.VideoApp]
class VideoAppRouter extends _i10.PageRouteInfo<VideoAppRouterArgs> {
  VideoAppRouter({
    _i11.Key? key,
    required _i12.Article article,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          VideoAppRouter.name,
          args: VideoAppRouterArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoAppRouter';

  static const _i10.PageInfo<VideoAppRouterArgs> page =
      _i10.PageInfo<VideoAppRouterArgs>(name);
}

class VideoAppRouterArgs {
  const VideoAppRouterArgs({
    this.key,
    required this.article,
  });

  final _i11.Key? key;

  final _i12.Article article;

  @override
  String toString() {
    return 'VideoAppRouterArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i9.YouTubeListScreen]
class YouTubeListRouter extends _i10.PageRouteInfo<void> {
  const YouTubeListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          YouTubeListRouter.name,
          initialChildren: children,
        );

  static const String name = 'YouTubeListRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.YouTubeRouter]
class YouTubeRouter extends _i10.PageRouteInfo<void> {
  const YouTubeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          YouTubeRouter.name,
          initialChildren: children,
        );

  static const String name = 'YouTubeRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
