import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';
import 'package:flutter/material.dart';

class FavoriteField extends StatelessWidget {
  final Article article;

  const FavoriteField({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.5),
      width: 55,
      decoration: BoxDecoration(
        color: AnilibriaColor.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AnilibriaColor.black,
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            article.inFavourites.toString(),
            style: AnilibriaTextStyle.small2(AnilibriaColor.black),
          ),
          const SizedBox(width: 3),
          const Icon(
            Icons.star_border,
            size: 15,
            color: AnilibriaColor.black,
          ),
        ],
      ),
    );
  }
}
