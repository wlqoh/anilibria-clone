// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:card_loading/card_loading.dart';

// Project imports:
import 'package:anilibria_clone/theme/colors.dart';

class NetworkLoadingImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final BoxFit fit;
  final double? blackout;

  const NetworkLoadingImage(
    this.url, {
    super.key,
    this.fit = BoxFit.cover,
    this.blackout,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoaded = false;
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      color: blackout != null ? Colors.black.withOpacity(blackout!) : null,
      colorBlendMode: BlendMode.darken,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        isLoaded = frame != null;
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (isLoaded && loadingProgress == null) {
          return child;
        }
        return CardLoading(
          height: height ?? 400,
          width: width,
          animationDuration: const Duration(milliseconds: 500),
          cardLoadingTheme: const CardLoadingTheme(
            colorOne: AnilibColor.background,
            colorTwo: AnilibColor.grey,
          ),
        );
      },
      errorBuilder: (context, obj, st) {
        return CardLoading(
          height: 0,
          width: width,
          animationDuration: const Duration(milliseconds: 500),
          cardLoadingTheme: const CardLoadingTheme(
            colorOne: AnilibColor.background,
            colorTwo: AnilibColor.black,
          ),
        );
      },
    );
  }
}
