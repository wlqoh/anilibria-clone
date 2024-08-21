import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/routes/router.gr.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
            color: AnilibriaColor.white,
            borderRadius: BorderRadius.circular(6),
          ),
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  width: 70,
                  height: 110,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  'https://a.anilibria.sbs${article.posters.original.url}',
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
                            style:
                                AnilibriaTextStyle.bold(AnilibriaColor.black),
                            children: [
                              TextSpan(
                                text:
                                    ' (${article.player
                                        .episodes?.string ?? "sdf"}'
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
                            style:
                                AnilibriaTextStyle.title3(AnilibriaColor.grey),
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
