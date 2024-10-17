// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:anilibria_clone/components/cards/network_loading_image.dart';
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(FeedItemRouter(id: article.id.toString()));
      },
      child: Material(
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: AnilibColor.white,
            borderRadius: BorderRadius.circular(6),
          ),
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkLoadingImage(
                  width: 70,
                  height: 110,
                  fit: BoxFit.cover,
                  imageUrl + article.posters.original.url,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: article.names.ru,
                            style: AnilibTextStyle.bold(AnilibColor.black),
                            children: [
                              TextSpan(
                                text:
                                    ' (${article.player.episodes.string ?? ""}'
                                    ')',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 3),
                        Flexible(
                          child: Text(
                            article.description ?? 'нет описания',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: AnilibTextStyle.title3(AnilibColor.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
