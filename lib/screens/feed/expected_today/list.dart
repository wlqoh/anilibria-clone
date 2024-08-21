import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/screens/feed/expected_today/bloc/expected_today_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'ExpectedTodayListRouter')
class ExpectedTodayListScreen extends StatelessWidget {
  const ExpectedTodayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpectedTodayCubit, ExpectedTodayState>(
      builder: (context, state) {
        if (state.status == Status.initial) {
          context.read<ExpectedTodayCubit>().fetch();
        }
        if (state.status == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.router
                    .push(FeedItemRouter(id: state.items[index].id.toString()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://a.anilibria.sbs${state.items[index].posters.original.url}',
                  width: 70,
                  height: 100,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
          itemCount: state.items.length,
        );
      },
    );
  }
}
