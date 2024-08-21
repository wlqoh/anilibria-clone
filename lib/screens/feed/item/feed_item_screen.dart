// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/repositories/feed.dart';
import 'package:anilibria_clone/screens/feed/item/widgets/feed_item_card.dart';

@RoutePage(name: 'FeedItemRouter')
class FeedItemScreen extends StatelessWidget {
  final String? id;

  const FeedItemScreen({
    super.key,
    @PathParam('id') this.id,
  });

  Future<Article> _load(BuildContext context) async {
    late Article item;
    final dbId = int.parse(id ?? "");
    item = await context.read<FeedListRepository>().item(id: dbId);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _load(context),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? FeedItemCard(
                article: snapshot.requireData,
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
