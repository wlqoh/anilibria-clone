// Flutter imports:
import 'package:anilibria_clone/components/cards/network_loading_image.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/screens/feed/schedule/bloc/schedule_cubit.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

@RoutePage(name: 'ScheduleListRouter')
class ScheduleListScreen extends StatelessWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = [
      "Понедельник",
      "Вторник",
      "Среда",
      "Четверг",
      "Пятница",
      "Суббота",
      "Воскресенье",
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        scrolledUnderElevation: 1.5,
        shadowColor: AnilibColor.black,
        backgroundColor: AnilibColor.white,
        surfaceTintColor: AnilibColor.white,
        title: const Text('Расписание'),
        titleTextStyle: AnilibTextStyle.bold(AnilibColor.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (BuildContext context, ScheduleState state) {
              if (state.status == Status.initial) {
                context.read<ScheduleCubit>().fetch();
              }
              if (state.status == Status.loaded) {
                return SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: weekDays
                        .map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weekDays[weekDays.indexOf(e)],
                                style: AnilibTextStyle.title1(
                                  AnilibColor.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 15,
                                runSpacing: 15,
                                direction: Axis.horizontal,
                                children: state.items[weekDays.indexOf(e)].list
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          context.router.push(
                                            FeedItemRouter(
                                              id: e.id.toString(),
                                            ),
                                          );
                                        },
                                        child: NetworkLoadingImage(
                                          fit: BoxFit.cover,
                                          imageUrl + e.posters.original.url,
                                          height: 140,
                                          width: 100,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
