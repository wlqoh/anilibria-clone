// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/screens/feed/item/widgets/favorite_field.dart';
import 'package:anilibria_clone/screens/feed/item/widgets/weekday.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

class FeedItemCard extends StatelessWidget {
  final Article article;

  const FeedItemCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        scrolledUnderElevation: 1.5,
        shadowColor: AnilibriaColor.black,
        backgroundColor: AnilibriaColor.white,
        surfaceTintColor: AnilibriaColor.white,
        title: const Text('Описание'),
        titleTextStyle: AnilibriaTextStyle.title2(AnilibriaColor.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.names.ru ?? "Нет названия",
                      style: AnilibriaTextStyle.title3(AnilibriaColor.black),
                    ),
                  ),
                  FavoriteField(article: article),
                ],
              ),
              Text(
                article.names.en ?? "Нет названия",
                style: AnilibriaTextStyle.small1(AnilibriaColor.grey),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Год: ',
                      style: AnilibriaTextStyle.small1(AnilibriaColor.black),
                    ),
                    TextSpan(
                      text: article.season.year.toString(),
                      style: AnilibriaTextStyle.small2(AnilibriaColor.black),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Голоса: ',
                    style: AnilibriaTextStyle.small1(AnilibriaColor.black),
                  ),
                  Text(
                    article.team.voice.join(', '),
                    style: AnilibriaTextStyle.small2(AnilibriaColor.black),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Тип: ',
                      style: AnilibriaTextStyle.small1(AnilibriaColor.black),
                    ),
                    TextSpan(
                      text: article.type.fullString,
                      style: AnilibriaTextStyle.small2(AnilibriaColor.black),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Состояние релиза: ',
                      style: AnilibriaTextStyle.small1(AnilibriaColor.black),
                    ),
                    TextSpan(
                      text: article.status.string,
                      style: AnilibriaTextStyle.small2(AnilibriaColor.black),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Жанр: ',
                      style: AnilibriaTextStyle.small1(AnilibriaColor.black),
                    ),
                    TextSpan(
                      text: article.genres.join(', '),
                      style: AnilibriaTextStyle.small2(AnilibriaColor.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const WeekDay(),
              const Divider(),
              Text(
                article.description ?? 'Описания нет',
                style: AnilibriaTextStyle.body(AnilibriaColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
