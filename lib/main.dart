// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/repositories/dio.dart';
import 'package:anilibria_clone/repositories/feed.dart';
import 'package:anilibria_clone/repositories/schedule.dart';
import 'package:anilibria_clone/repositories/schedule_today.dart';
import 'package:anilibria_clone/routes/router.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/utils/utils.dart';

void main() async {
  final dio = await getDio();
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;

  MyApp({super.key, required this.dio});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => FeedListRepository(dio)),
        RepositoryProvider(create: (context) => ScheduleTodayListRepository()),
        RepositoryProvider(create: (context) => ScheduleListRepository()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: AnilibriaColor.black),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              for (final platform in TargetPlatform.values)
                platform: const NoTransitionsBuilder(),
            },
          ),
        ),
        title: 'Anilibria',
        supportedLocales: const [Locale.fromSubtags(languageCode: 'en')],
        locale: const Locale.fromSubtags(languageCode: 'en'),
      ),
    );
  }
}
