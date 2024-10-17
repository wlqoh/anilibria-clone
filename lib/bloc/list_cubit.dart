// Flutter imports:
import 'package:anilibria_clone/components/values/text.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/repositories/list_repository.dart';

part 'list_state.dart';

enum StandardListStatus {
  initial,
  loading,
  loaded,
  error,
}

abstract class ListCubit<T> extends Cubit<ListState<T>> {
  final ListRepository<T> repository;

  ListCubit({
    required this.repository,
  }) : super(
          ListState<T>(
            status: StandardListStatus.initial,
            items: const [],
            nextUrl: 1,
            isPaginating: false,
            scrollController: ScrollController(),
            textController: TextValue.defaultValue(),
            searching: false,
          ),
        );

  Future<void> fetch() async {
    if (state.status == StandardListStatus.loading) return;
    emit(
      state.copyWith(
        nextUrl: 1,
        status: StandardListStatus.loading,
        items: [],
      ),
    );
    final response = await repository.list(state.nextUrl);
    emit(
      state.copyWith(
        status: StandardListStatus.loaded,
        items: response.items,
      ),
    );
  }

  void onScroll(ScrollMetrics metrics) {
    if (state.status == StandardListStatus.loaded) {
      final paginatePosition = metrics.maxScrollExtent;
      if (metrics.pixels == paginatePosition) {
        emit(state.copyWith(isPaginating: true));
        paginate();
      }
    }
  }

  Future<void> paginate() async {
    emit(state.copyWith(nextUrl: state.nextUrl + 1));
    final response = await repository.list(state.nextUrl);
    emit(
      state.copyWith(
        items: state.items..addAll(response.items),
        isPaginating: false,
      ),
    );
  }
}
