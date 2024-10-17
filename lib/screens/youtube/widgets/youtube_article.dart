// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/link.dart';

// Project imports:
import 'package:anilibria_clone/components/cards/network_loading_image.dart';
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/youtube.dart';
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

class YouTubeArticle extends StatelessWidget {
  final Youtube youtube;

  const YouTubeArticle({super.key, required this.youtube});

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(youTubeUrl + youtube.youtubeId),
      builder: (context, followLink) => InkWell(
        onTap: followLink,
        child: Material(
          borderRadius: BorderRadius.circular(4),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NetworkLoadingImage(
                  imageUrl + youtube.preview.src,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: AnilibColor.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        youtube.title,
                        style: AnilibTextStyle.title1(AnilibColor.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.mode_comment_outlined,
                            color: AnilibColor.grey,
                          ),
                          Text(
                            youtube.comments.toString(),
                            style: AnilibTextStyle.title1(AnilibColor.grey),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AnilibColor.grey,
                          ),
                          Text(
                            youtube.views.toString(),
                            style: AnilibTextStyle.title3(AnilibColor.grey),
                          ),
                        ],
                      ),
                    ],
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
