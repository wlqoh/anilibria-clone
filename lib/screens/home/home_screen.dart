// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/repositories/feed.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/screens/feed/expected_today/bloc/expected_today_cubit.dart';
import 'package:anilibria_clone/screens/feed/list/bloc/feed_cubit.dart';
import 'package:anilibria_clone/screens/schedule/bloc/schedule_cubit.dart';

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
      routes: const [FeedRouter(), FeedListRouter(), ScheduleListRouter()],
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeedCubit(
                repository: context.read<FeedListRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => ExpectedTodayCubit(),
            ),
            BlocProvider(
              create: (context) => ScheduleCubit(),
            ),
          ],
          child: child,
        );
      },
    );
  }
}
