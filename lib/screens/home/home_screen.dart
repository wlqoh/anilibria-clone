// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/repositories/feed.dart';
import 'package:anilibria_clone/repositories/search_repository.dart';
import 'package:anilibria_clone/repositories/youtube.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/screens/feed/expected_today/bloc/expected_today_cubit.dart';
import 'package:anilibria_clone/screens/feed/list/bloc/feed_cubit.dart';
import 'package:anilibria_clone/screens/feed/schedule/bloc/schedule_cubit.dart';
import 'package:anilibria_clone/screens/search/bloc/search_cubit.dart';
import 'package:anilibria_clone/screens/youtube/bloc/youtube_cubit.dart';
import 'package:anilibria_clone/theme/colors.dart';

@RoutePage(name: 'HomeRouter')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [FeedRouter(), SearchRouter(), YouTubeRouter()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeedCubit(
                repository: context.read<FeedListRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => YoutubeCubit(
                repository: context.read<YouTubeListRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => ExpectedTodayCubit(),
            ),
            BlocProvider(
              create: (context) => ScheduleCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  SearchCubit(repository: context.read<SearchListRepository>()),
            ),
          ],
          child: Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 1,
              unselectedFontSize: 1,
              unselectedItemColor: AnilibColor.black,
              selectedItemColor: AnilibColor.red,
              backgroundColor: AnilibColor.white,
              elevation: 1,
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
