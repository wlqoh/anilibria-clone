// Flutter imports:
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/widgets/video_player/video_player.dart';
import 'package:auto_route/auto_route.dart';
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
        shadowColor: AnilibColor.black,
        backgroundColor: AnilibColor.white,
        surfaceTintColor: AnilibColor.white,
        title: const Text('Описание'),
        titleTextStyle: AnilibTextStyle.title2(AnilibColor.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    alignment: Alignment.topCenter,
                    imageUrl + article.posters.original.url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                  IconButton(
                    onPressed: () {
                      context.router.push(VideoAppRouter(article: article));
                    },
                    icon: const Icon(
                      Icons.play_circle,
                      color: AnilibColor.red,
                      size: 30,
                    ),
                    color: AnilibColor.white,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.names.ru ?? "Нет названия",
                      style: AnilibTextStyle.title3(AnilibColor.black),
                    ),
                  ),
                  FavoriteField(article: article),
                ],
              ),
              Text(
                article.names.en ?? "Нет названия",
                style: AnilibTextStyle.small1(AnilibColor.grey),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Год: ',
                      style: AnilibTextStyle.small1(AnilibColor.black),
                    ),
                    TextSpan(
                      text: article.season.year.toString(),
                      style: AnilibTextStyle.small2(AnilibColor.black),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Голоса: ',
                    style: AnilibTextStyle.small1(AnilibColor.black),
                  ),
                  Text(
                    article.team.voice.join(', '),
                    style: AnilibTextStyle.small2(AnilibColor.black),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Тип: ',
                      style: AnilibTextStyle.small1(AnilibColor.black),
                    ),
                    TextSpan(
                      text: article.type.fullString,
                      style: AnilibTextStyle.small2(AnilibColor.black),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Состояние релиза: ',
                      style: AnilibTextStyle.small1(AnilibColor.black),
                    ),
                    TextSpan(
                      text: article.status.string,
                      style: AnilibTextStyle.small2(AnilibColor.black),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Жанр: ',
                      style: AnilibTextStyle.small1(AnilibColor.black),
                    ),
                    TextSpan(
                      text: article.genres.join(', '),
                      style: AnilibTextStyle.small2(AnilibColor.red),
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
                style: AnilibTextStyle.body(AnilibColor.black),
              ),
              VideoApp(article: article),
            ],
          ),
        ),
      ),
    );
  }
}
