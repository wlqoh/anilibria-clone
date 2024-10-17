// Flutter imports:
import 'package:anilibria_clone/components/cards/result_card.dart';
import 'package:anilibria_clone/repositories/search.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/bloc/list_cubit.dart';
import 'package:anilibria_clone/components/buttons/standard_button.dart';
import 'package:anilibria_clone/components/fields/animated_search_field.dart';
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/screens/feed/expected_today/list.dart';
import 'package:anilibria_clone/screens/feed/list/bloc/feed_cubit.dart';
import 'package:anilibria_clone/screens/feed/list/widgets/article.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

@RoutePage(name: 'FeedListRouter')
class FeedListScreen extends StatefulWidget {
  const FeedListScreen({super.key});

  @override
  State<FeedListScreen> createState() => _FeedListScreenState();
}

class _FeedListScreenState extends State<FeedListScreen> {
  Future<void> _refresh(BuildContext context) async {
    await context.read<FeedCubit>().fetch();
  }

  late bool searching;
  late final List<Article> items;

  @override
  void initState() {
    super.initState();
    searching = false;
    items = [];
  }

  Future<void> fetchItems(String text) async {
    final list = await context.read<SearchRepository>().search(text);
    if (list.isNotEmpty) items.clear();
    items.addAll(list);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, ListState<Article>>(
      builder: (context, state) {
        if (state.status == StandardListStatus.initial) {
          context.read<FeedCubit>().fetch();
        }
        if (state.status == StandardListStatus.loaded) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Scaffold(
                backgroundColor: AnilibColor.white,
                appBar: AppBar(
                  toolbarHeight: 35,
                  actions: [
                    IconButton(
                      onPressed: () {
                        searching = !searching;
                        setState(() {});
                      },
                      icon: const Icon(Icons.search),
                      color: AnilibColor.black,
                      iconSize: 17,
                    ),
                  ],
                  scrolledUnderElevation: 4,
                  shadowColor: AnilibColor.black,
                  backgroundColor: AnilibColor.white,
                  surfaceTintColor: AnilibColor.white,
                  title: const Text('Лента'),
                  titleTextStyle: AnilibTextStyle.title2(AnilibColor.black),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () => _refresh(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationListener<ScrollUpdateNotification>(
                        onNotification: (event) {
                          context.read<FeedCubit>().onScroll(event.metrics);
                          return true;
                        },
                        child: Scrollbar(
                          controller: state.scrollController,
                          child: SingleChildScrollView(
                            controller: state.scrollController,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ожидается сегодня',
                                    style:
                                        AnilibTextStyle.bold(AnilibColor.black),
                                  ),
                                  const SizedBox(height: 15),
                                  const SizedBox(
                                    height: 150,
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
                                        textStyle: AnilibTextStyle.title1(
                                          AnilibColor.red1,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      StandardButton(
                                        onPressed: () {},
                                        // textColor: AnilibriaColor.red,
                                        text: 'Случайный релиз',
                                        textStyle: AnilibTextStyle.title1(
                                          AnilibColor.red1,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      StandardButton(
                                        onPressed: () {},
                                        // textColor: AnilibriaColor.red,
                                        text: 'История',
                                        textStyle: AnilibTextStyle.title1(
                                          AnilibColor.red1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'Обновления',
                                    style:
                                        AnilibTextStyle.bold(AnilibColor.black),
                                  ),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: state.items
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 15.0,
                                            ),
                                            child: ArticleWidget(article: e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  if (state.isPaginating == true)
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 32.0),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (searching)
                ModalBarrier(
                  dismissible: false,
                  color: AnilibColor.black.withOpacity(0.5),
                ),
              if (searching)
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AnilibColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AnimatedSearchField(
                          onChanged: (text) async {
                            state.textController.value = text;
                            await fetchItems(text);
                          },
                          onPressed: () {
                            searching = !searching;
                            items.clear();
                            state.textController.controller.clear();
                            setState(() {});
                          },
                          isSearching: searching,
                          controller: state.textController.controller,
                          focusNode: state.textController.focusNode,
                        ),
                        if (items.isNotEmpty)
                          AnimatedSize(
                            alignment: Alignment.topLeft,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: items
                                  .map(
                                    (e) => SearchCard(
                                      article: e,
                                      onTap: () {
                                        context.router.push(
                                          FeedItemRouter(id: e.id.toString()),
                                        );
                                        searching = !searching;
                                        items.clear();
                                        state.textController.controller.clear();
                                        setState(() {});
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
