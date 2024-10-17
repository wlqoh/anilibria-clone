// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/bloc/list_cubit.dart';
import 'package:anilibria_clone/models/youtube.dart';
import 'package:anilibria_clone/screens/youtube/bloc/youtube_cubit.dart';
import 'package:anilibria_clone/screens/youtube/widgets/youtube_article.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

@RoutePage(name: 'YouTubeListRouter')
class YouTubeListScreen extends StatelessWidget {
  const YouTubeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      await context.read<YoutubeCubit>().fetch();
    }

    return Scaffold(
      backgroundColor: AnilibColor.white,
      appBar: AppBar(
        toolbarHeight: 35,
        scrolledUnderElevation: 4,
        shadowColor: AnilibColor.black,
        backgroundColor: AnilibColor.white,
        surfaceTintColor: AnilibColor.white,
        title: const Text('YouTube'),
        titleTextStyle: AnilibTextStyle.title2(AnilibColor.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<YoutubeCubit, ListState<Youtube>>(
              builder: (context, state) {
                if (state.status == StandardListStatus.initial) {
                  context.read<YoutubeCubit>().fetch();
                }
                if (state.status == StandardListStatus.loaded) {
                  return NotificationListener<ScrollUpdateNotification>(
                    onNotification: (event) {
                      context.read<YoutubeCubit>().onScroll(event.metrics);
                      return true;
                    },
                    child: Scrollbar(
                      controller: state.scrollController,
                      child: SingleChildScrollView(
                        controller: state.scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: state.items
                                    .map(
                                      (e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: YouTubeArticle(youtube: e),
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
      ),
    );
  }
}
