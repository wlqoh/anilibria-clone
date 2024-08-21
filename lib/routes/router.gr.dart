// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anilibria_clone/routes/empty_routers.dart' as _i4;
import 'package:anilibria_clone/screens/feed/expected_today/list.dart' as _i1;
import 'package:anilibria_clone/screens/feed/item/feed_item_screen.dart' as _i2;
import 'package:anilibria_clone/screens/feed/list/feed_list_screen.dart' as _i3;
import 'package:anilibria_clone/screens/home/home_screen.dart' as _i5;
import 'package:anilibria_clone/screens/schedule/schedule_list_screen.dart'
    as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ExpectedTodayListRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExpectedTodayListScreen(),
      );
    },
    FeedItemRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FeedItemRouterArgs>(
          orElse: () => FeedItemRouterArgs(id: pathParams.optString('id')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.FeedItemScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FeedListRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FeedListScreen(),
      );
    },
    FeedRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FeedRouter(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    ScheduleListRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ScheduleListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ExpectedTodayListScreen]
class ExpectedTodayListRouter extends _i7.PageRouteInfo<void> {
  const ExpectedTodayListRouter({List<_i7.PageRouteInfo>? children})
      : super(
          ExpectedTodayListRouter.name,
          initialChildren: children,
        );

  static const String name = 'ExpectedTodayListRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FeedItemScreen]
class FeedItemRouter extends _i7.PageRouteInfo<FeedItemRouterArgs> {
  FeedItemRouter({
    _i8.Key? key,
    String? id,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<FeedItemRouterArgs> page =
      _i7.PageInfo<FeedItemRouterArgs>(name);
}

class FeedItemRouterArgs {
  const FeedItemRouterArgs({
    this.key,
    this.id,
  });

  final _i8.Key? key;

  final String? id;

  @override
  String toString() {
    return 'FeedItemRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.FeedListScreen]
class FeedListRouter extends _i7.PageRouteInfo<void> {
  const FeedListRouter({List<_i7.PageRouteInfo>? children})
      : super(
          FeedListRouter.name,
          initialChildren: children,
        );

  static const String name = 'FeedListRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FeedRouter]
class FeedRouter extends _i7.PageRouteInfo<void> {
  const FeedRouter({List<_i7.PageRouteInfo>? children})
      : super(
          FeedRouter.name,
          initialChildren: children,
        );

  static const String name = 'FeedRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ScheduleListScreen]
class ScheduleListRouter extends _i7.PageRouteInfo<void> {
  const ScheduleListRouter({List<_i7.PageRouteInfo>? children})
      : super(
          ScheduleListRouter.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleListRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
