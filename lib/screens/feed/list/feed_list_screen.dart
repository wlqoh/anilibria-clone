import 'package:anilibria_clone/bloc/list_cubit.dart';
import 'package:anilibria_clone/components/buttons/standard_button.dart';
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/screens/feed/expected_today/list.dart';
import 'package:anilibria_clone/screens/feed/list/bloc/feed_cubit.dart';
import 'package:anilibria_clone/screens/feed/list/widgets/article.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'FeedListRouter')
class FeedListScreen extends StatelessWidget {
  const FeedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: AnilibriaColor.black,
            iconSize: 17,
          ),
        ],
        scrolledUnderElevation: 1.5,
        shadowColor: AnilibriaColor.black,
        backgroundColor: AnilibriaColor.white,
        surfaceTintColor: AnilibriaColor.white,
        title: const Text('Лента'),
        titleTextStyle: AnilibriaTextStyle.title2(AnilibriaColor.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FeedCubit, ListState<Article>>(
            builder: (context, state) {
              if (state.status == StandardListStatus.initial) {
                context.read<FeedCubit>().fetch();
              }
              if (state.status == StandardListStatus.loaded) {
                return NotificationListener<ScrollUpdateNotification>(
                  onNotification: (event) {
                    context.read<FeedCubit>().onScroll(event.metrics);
                    return true;
                  },
                  child: Scrollbar(
                    controller: state.controller,
                    child: SingleChildScrollView(
                      controller: state.controller,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Ожидается сегодня',
                              style:
                                  AnilibriaTextStyle.bold(AnilibriaColor.black),
                            ),
                            const SizedBox(height: 15),
                            const SizedBox(
                              height: 100,
                              child: ExpectedTodayListScreen(),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                StandardButton(
                                  onPressed: () {
                                    context.router
                                        .push(const ScheduleListRouter());
                                  },
                                  // textColor: AnilibriaColor.red,
                                  text: 'Расписание',
                                  textStyle: AnilibriaTextStyle.title1(
                                    AnilibriaColor.red,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                StandardButton(
                                  onPressed: () {},
                                  // textColor: AnilibriaColor.red,
                                  text: 'Случайный релиз',
                                  textStyle: AnilibriaTextStyle.title1(
                                    AnilibriaColor.red,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                StandardButton(
                                  onPressed: () {},
                                  // textColor: AnilibriaColor.red,
                                  text: 'История',
                                  textStyle: AnilibriaTextStyle.title1(
                                    AnilibriaColor.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Обновления',
                              style:
                                  AnilibriaTextStyle.bold(AnilibriaColor.black),
                            ),
                            const SizedBox(height: 5),
                            Column(
                              children: state.items
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: ArticleWidget(article: e),
                                    ),
                                  )
                                  .toList(),
                            ),
                            if (state.isPaginating == true)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 32.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
