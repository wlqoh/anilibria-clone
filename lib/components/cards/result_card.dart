import 'package:anilibria_clone/components/cards/network_loading_image.dart';
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/article/article.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final void Function()? onTap;
  final Article article;

  const SearchCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            NetworkLoadingImage(
              width: 30,
              height: 40,
              imageUrl + article.posters.small.url,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                article.names.ru.toString(),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
