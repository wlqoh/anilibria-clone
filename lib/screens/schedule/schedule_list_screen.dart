import 'package:anilibria_clone/screens/schedule/bloc/schedule_cubit.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'ScheduleListRouter')
class ScheduleListScreen extends StatelessWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        scrolledUnderElevation: 1.5,
        shadowColor: AnilibriaColor.black,
        backgroundColor: AnilibriaColor.white,
        surfaceTintColor: AnilibriaColor.white,
        title: const Text('Расписание'),
        titleTextStyle: AnilibriaTextStyle.bold(AnilibriaColor.black),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Понедельник',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[0].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Вторник',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[1].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Среда',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[2].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Четверг',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[3].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Пятница',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[4].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Суббота',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[5].list
                            .map(
                              (e) => ColoredBox(
                                color: Colors.yellow,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://a.anilibria.sbs${e.posters.original.url}',
                                  height: 140,
                                  width: 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Воскресенье',
                        style: AnilibriaTextStyle.title1(AnilibriaColor.black),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: state.items[6].list
                            .map(
                              (e) => Image.network(
                                fit: BoxFit.cover,
                                'https://a.anilibria.sbs${e.posters.original.url}',
                                height: 140,
                                width: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ],
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
